package org.g4studio.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.MonitorService;

/**
 * 事件跟踪Action
 * 
 * @author OSWorks-XC
 * @since 2010-09-12
 */
public class EventTrackAction extends BaseAction {
	
	private MonitorService monitorService = (MonitorService)super.getService("monitorService");
	
	/**
	 * 事件跟踪页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("eventTrackView");
	}
	
	/**
	 * 查询事件列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryEvents(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		dto.put("ksrq", G4Utils.Date2String(dto.getAsDate("ksrq"), "yyyyMMdd000000"));
		dto.put("jsrq", G4Utils.Date2String(dto.getAsDate("jsrq"), "yyyyMMdd235959"));
		List eventList = g4Reader.queryForPage("Monitor.queryEventsByDto", dto);
		for (int i = 0; i < eventList.size(); i++) {
			Dto dto2 = (BaseDto)eventList.get(i);
			dto2.put("activetime", G4Utils.stringToDate(dto2.getAsString("activetime"), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss"));
		}
		Integer totalCount = (Integer) g4Reader.queryForObject("Monitor.queryEventsByDtoForPageCount", dto);
		String jsonString = encodeList2PageJson(eventList, totalCount, G4Constants.FORMAT_DateTime);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除事件
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteEvents(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		monitorService.deleteEvent(dto);
		if (dto.getAsString("type").equalsIgnoreCase("reset"))
			setOkTipMsg("清空成功,所有事件已被清除!", response);
		else
			setOkTipMsg("数据删除成功!", response);
		return mapping.findForward(null);
	}
}
