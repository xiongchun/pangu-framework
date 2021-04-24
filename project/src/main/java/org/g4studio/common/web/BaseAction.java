package org.g4studio.common.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.g4studio.common.dao.Reader;
import org.g4studio.common.util.SessionContainer;
import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.common.util.WebUtils;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.actions.DispatchAction;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.common.util.SystemConstants;

/**
 * BizAction 商业Action组件基类
 * 
 * @author OSWorks-XC
 * @since 2009-09-03
 * @see DispatchAction
 */
public class BaseAction extends DispatchAction {

	/**
	 * Action基类中给子类暴露的一个DAO接口<br>
	 * <b>只能在Action子类中使用此Dao接口进行非事物相关的操作</b>:仅能进行查询操作
	 * 连接平台数据库用户
	 */
	protected Reader g4Reader = (Reader) getService("g4Reader");

	protected static PropertiesHelper g4PHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
	
	protected static PropertiesHelper appPHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.APP);

    /**
     * 从服务容器中获取服务组件
     * 
     * @param pBeanId
     * @return
     */
	protected Object getService(String pBeanId) {
		Object springBean = SpringBeanLoader.getSpringBean(pBeanId);
		return springBean;
	}

	/**
	 * 获取一个Session属性对象
	 * 
	 * @param request
	 * @param sessionName
	 * @return
	 */
	protected Object getSessionAttribute(HttpServletRequest request, String sessionKey) {
		Object objSessionAttribute = null;
		HttpSession session = request.getSession(false);
		if (session != null) {
			objSessionAttribute = session.getAttribute(sessionKey);
		}
		return objSessionAttribute;
	}

	/**
	 * 设置一个Session属性对象
	 * 
	 * @param request
	 * @param sessionName
	 * @return
	 */
	protected void setSessionAttribute(HttpServletRequest request, String sessionKey, Object objSessionAttribute) {
		HttpSession session = request.getSession();
		if (session != null)
			session.setAttribute(sessionKey, objSessionAttribute);
	}

	/**
	 * 移除Session对象属性值
	 * 
	 * @param request
	 * @param sessionName
	 * @return
	 */
	protected void removeSessionAttribute(HttpServletRequest request, String sessionKey) {
		HttpSession session = request.getSession();
		if (session != null)
			session.removeAttribute(sessionKey);
	}

	/**
	 * 获取一个SessionContainer容器,如果为null则创建之
	 * 
	 * @param form
	 * @param obj
	 */
	protected SessionContainer getSessionContainer(HttpServletRequest request) {
		SessionContainer sessionContainer = (SessionContainer) this.getSessionAttribute(request, "SessionContainer");
		if (sessionContainer == null) {
			sessionContainer = new SessionContainer();
			HttpSession session = request.getSession(true);
			session.setAttribute("SessionContainer", sessionContainer);
		}
		return sessionContainer;
	}

	/**
	 * 将请求参数封装为Dto
	 * 
	 * @param request
	 * @return
	 */
	protected static Dto getParamAsDto(HttpServletRequest request) {
		return WebUtils.getParamAsDto(request);
	}

	/**
	 * 获取代码对照值
	 * 
	 * @param field
	 *            代码类别
	 * @param code
	 *            代码值
	 * @param request
	 * @return
	 */
	protected String getCodeDesc(String pField, String pCode, HttpServletRequest request) {
		return WebUtils.getCodeDesc(pField, pCode, request);
	}

	/**
	 * 根据代码类别获取代码表列表
	 * 
	 * @param field
	 * @param request
	 * @return
	 */
	protected List getCodeListByField(String pField, HttpServletRequest request) {
		return WebUtils.getCodeListByField(pField, request);
	}

	/**
	 * 获取全局参数值
	 * 
	 * @param pParamKey
	 *            参数键名
	 * @return
	 */
	protected String getParamValue(String pParamKey, HttpServletRequest request) {
		return WebUtils.getParamValue(pParamKey, request);
	}

	/**
	 * 输出响应
	 * 
	 * @param str
	 * @throws IOException
	 */
	protected void write(String str, HttpServletResponse response) throws IOException {
		response.getWriter().write(str);
		response.getWriter().flush();
		response.getWriter().close();
	}

	/**
	 * 直接将List转为分页所需要的Json资料格式
	 * 
	 * @param list
	 *            需要编码的List对象
	 * @param totalCount
	 *            记录总数
	 * @param pDataFormat
	 *            时间日期格式化,传null则表明List不包含日期时间属性
	 */
	protected String encodeList2PageJson(List list, Integer totalCount, String dataFormat) {
		return JsonHelper.encodeList2PageJson(list, totalCount, dataFormat);
	}

	/**
	 * 将数据系列化为表单数据填充所需的Json格式
	 * 
	 * @param pObject
	 *            待系列化的对象
	 * @param pFormatString
	 *            日期时间格式化,如果为null则认为没有日期时间型字段
	 * @return
	 */
	protected String encodeDto2FormLoadJson(Dto pDto, String pFormatString) {
		return JsonHelper.encodeDto2FormLoadJson(pDto, pFormatString);
	}

	/**
	 * 将数据系列化为Json格式
	 * 
	 * @param pObject
	 *            待系列化的对象
	 * @param pFormatString
	 *            日期时间格式化,如果为null则认为没有日期时间型字段
	 * @return
	 */
	protected String encodeObject2Json(Object pObject, String pFormatString) {
		return JsonHelper.encodeObject2Json(pObject, pFormatString);
	}

	/**
	 * 将数据系列化为Json格式
	 * 
	 * @param pObject
	 *            待系列化的对象
	 * @return
	 */
	protected String encodeObjectJson(Object pObject) {
		return JsonHelper.encodeObject2Json(pObject);
	}
	
	/**
	 * 
	 * 交易成功提示信息
	 * 
	 * @param pMsg
	 *            提示信息
	 * @param pResponse
	 * @return
	 * @throws IOException 
	 */
	protected void setOkTipMsg(String pMsg, HttpServletResponse response) throws IOException {
		Dto outDto = new BaseDto(G4Constants.TRUE, pMsg);
		write(outDto.toJson(), response);
	}
	
	/**
	 * 
	 * 交易失败提示信息(特指：业务交易失败并不是请求失败)<br>
	 * 和Form的submit中的failur回调对应,Ajax.request中的failur回调是指请求失败
	 * 
	 * @param pMsg
	 *            提示信息
	 * @param pResponse
	 * @return
	 * @throws IOException 
	 */
	protected void setErrTipMsg(String pMsg, HttpServletResponse response) throws IOException {
		Dto outDto = new BaseDto(G4Constants.FALSE, pMsg);
		write(outDto.toJson(), response);
	}
	
	/**
	 * 检查在演示环境下绕过前端控制提交数据的情况
	 * 
	 * @param
	 * @return
	 * @throws IOException 
	 */
	public boolean isDemoMode(HttpServletResponse response) throws IOException{
		boolean flag = false;
	    PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
	    String runMode = pHelper.getValue("runMode");
	    if (runMode.equals(G4Constants.RUNMODE_DEMO)) {
	    	setOkTipMsg(G4Constants.PLAYBOY, response);
	    	flag = true;
		}
		return flag;
	}
	

	protected Map getKeyMethodMap() {
		return null;
	}
	
}
