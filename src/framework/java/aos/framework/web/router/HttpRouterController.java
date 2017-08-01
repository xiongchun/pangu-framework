package aos.framework.web.router;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import aos.framework.core.asset.AOSBeanLoader;
import aos.framework.core.asset.WebCxt;
import aos.framework.core.exception.AOSException;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSUtils;

/**
 * HTTP请求路由转发器
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping(value = "http")
@SuppressWarnings("all")
public class HttpRouterController {

	private static final Logger logger = LoggerFactory.getLogger(HttpRouterController.class);

	/**
	 * HTTP路由转发器<br>
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "do")
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpModel httpModel = new HttpModel(request, response);
		String router = request.getHeader("router");
		
		router = AOSUtils.isEmpty(router) ? httpModel.getInDto().getString("router") : router;
		try {
			if (AOSUtils.isEmpty(router) || StringUtils.lastIndexOf(router, ".") == StringUtils.INDEX_NOT_FOUND) {
				throw new AOSException("请求路由规则参数缺失或路由规则不合法，请检查。" );
			}
			String[] routerArr = StringUtils.split(router, ".");
			if (routerArr.length != 2) {
				throw new AOSException("请求路由规则参数缺失或路由规则不合法，请检查。");
			}
			Object object = AOSBeanLoader.getSpringBean(routerArr[0]);
			Class c = object.getClass();
			Method method = c.getMethod(routerArr[1], httpModel.getClass());
			Object resultObj = method.invoke(object, httpModel);
		} catch (InvocationTargetException e) {
			throw new AOSException("系统服务出错，请稍后再试。", e);
		} catch (NoSuchMethodException e) {
			throw new AOSException(AOSUtils.merge("没有找到[{0}]对应的方法，请确认路由信息是否正确。", router), e);
		} catch (Exception e) {
			throw new AOSException("系统繁忙，请稍后再试。", e);
		} finally {
			logger.info(AOSCons.CONSOLE_FLAG3 + "ClientIP：{}，URI：{}，ROUTER：{}，HttpModel：{} ", WebCxt.getClientIpAddr(request),
					request.getRequestURI(), router, httpModel.toJson());
		}
		if (AOSUtils.isNotEmpty(httpModel.getOutMsg())) {
			WebCxt.write(response, httpModel.getOutMsg());
		}
		return httpModel.getViewPath();
	}

}
