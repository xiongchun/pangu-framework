package aos.framework.web.router;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.asset.WebCxt;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.system.common.model.UserModel;

/**
 * HTTP请求数据模型包装
 * 
 * @author xiongchun
 *
 */
public class HttpModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 请求入参Dto
	 */
	private Dto inDto;
	
	/**
	 * 请求出参消息
	 */
	private String outMsg;
	
	/**
	 * Request对象
	 */
	private HttpServletRequest request;
	
	/**
	 * 视图路径
	 */
	private String viewPath;
	
	/**
	 * 当前用户对象
	 */
	private UserModel userModel;
	
	/**
	 * 构造方法
	 * @param request
	 */
	public HttpModel(HttpServletRequest request){
		this.request = request;
		this.setInDto(WebCxt.getParamAsDto(request));
		this.setUserModel(WebCxt.getUserModel(request));
	}
	
	/**
	 * 转换JSON 
	 * 剔除HttpServletRequest，否则会报错
	 */
	public String toJson() {
		String Json = StringUtils.EMPTY;
		if (AOSUtils.isNotEmpty(getInDto())) {
			Json = Json + " InDto: " + AOSJson.toJson(getInDto());
		}
		if (AOSUtils.isNotEmpty(getUserModel())) {
			Json = Json + " UserModel: " + AOSJson.toJson(getUserModel());
		}
		if (AOSUtils.isNotEmpty(getOutMsg())) {
			Json = Json + " OutMsg: " + outMsg;
		}
		return Json;
	}
	
	/**
	 * Response响应消息
	 * <p/>
	 * 如果传入的参数是一个Json字符串则直接输出。若为一个常规字符串则将其自动作为Key为appmsg的json属性值输出。(缺省追加参数：
	 * appcode=1 success=true)
	 * 
	 * @param outMsg
	 */
	public void setOutMsg(String outMsg) {
		if (AOSUtils.isEmpty(outMsg)) {
			this.outMsg = StringUtils.EMPTY;
		}else{
			if (StringUtils.indexOf(outMsg, "{") == -1 && !StringUtils.equals(outMsg, "[]")) {
				Dto dto = Dtos.newDto();
				dto.put(AOSCons.APPCODE_KEY, AOSCons.SUCCESS);
				dto.put(AOSCons.APPMSG_KEY, outMsg);
				outMsg = AOSJson.toJson(dto);
			}
			this.outMsg = outMsg;
		}
	}
	
	/**
	 * 设置请求request作用域的属性
	 * @param key
	 * @param value
	 */
	public void setAttribute(String key, Object value){
		request.setAttribute(key, value);
	}
	
	/**
	 * 获取请求request作用域的属性
	 * @param key
	 * @param value
	 */
	public Object getAttribute(String key){
		return request.getAttribute(key);
	}

	/**
	 * 获取视图路径
	 * 
	 * @return
	 */
	public String getViewPath() {
		return viewPath;
	}

	/**
	 * 设置视图路径
	 * @param viewPath
	 */
	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}

	/**
	 * 请求入参Dto
	 * @return
	 */
	public Dto getInDto() {
		return inDto;
	}

	/**
	 * 请求入参Dto
	 * @param inDto
	 */
	public void setInDto(Dto inDto) {
		this.inDto = inDto;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	public String getOutMsg() {
		return outMsg;
	}

}
