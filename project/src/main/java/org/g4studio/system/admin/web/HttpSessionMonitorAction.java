package org.g4studio.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.g4studio.common.util.SessionContainer;
import org.g4studio.common.util.SessionListener;
import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.MonitorService;

/**
 * HTTP会话监控
 * 
 * @author OSWorks-XC
 * @since 2010-09-03
 */
public class HttpSessionMonitorAction extends BaseAction {

	private MonitorService monitorService = (MonitorService)getService("monitorService");

	/**
	 * 会话监控页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("sessionMonitorView");
	}
	
	/**
	 * 获取当前活动的用户列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward getSessionList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm)form;
		Dto dto = cForm.getParamAsDto(request);
		List sessionList = g4Reader.queryForPage("Monitor.queryHttpSessions", dto);
		Integer pageCount = (Integer) g4Reader.queryForObject("Monitor.queryHttpSessionsForPageCount", dto);
		String jsonString = encodeList2PageJson(sessionList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 杀死会话
	 * 
	 * @param
	 * @return
	 */
	public ActionForward killSession(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		String[] sessionid = strChecked.split(",");
		Dto delDto = new BaseDto();
		String msg = "选中的会话已杀死!";
		for (int i = 0; i < sessionid.length; i++) {
			String seid = sessionid[i];
			delDto.put("sessionid", seid);
			if(!seid.equalsIgnoreCase(request.getSession().getId())){
				monitorService.deleteHttpSession(delDto);
				HttpSession session = SessionListener.getSessionByID(seid);
				if(G4Utils.isNotEmpty(seid)){
					SessionContainer sessionContainer =  (SessionContainer)session.getAttribute("SessionContainer");
					sessionContainer.setUserInfo(null); //配合RequestFilter进行拦截
					sessionContainer.cleanUp();
				}
			}else {
				msg += " 提示：不能杀死当前用户!";
			}
		}
		setOkTipMsg(msg, response);
		return mapping.findForward(null);
	}
}
