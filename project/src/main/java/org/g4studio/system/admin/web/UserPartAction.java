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
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.OrganizationService;
import org.g4studio.system.admin.service.PartService;
import org.g4studio.system.common.util.SystemConstants;

/**
 * UI组件人员授权
 * 
 * @author OSWorks-XC
 * @since 2011-06-03
 * @see BaseAction
 */
public class UserPartAction extends BaseAction {
	
	private PartService partService = (PartService) getService("partService");
	
	private OrganizationService organizationService = (OrganizationService)getService("organizationService");

	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.removeSessionAttribute(request, "deptid");
		Dto inDto = new BaseDto();
		String deptid = super.getSessionContainer(request).getUserInfo().getDeptid();
		inDto.put("deptid", deptid);
		Dto outDto = organizationService.queryDeptinfoByDeptid(inDto);
		request.setAttribute("rootDeptid", outDto.getAsString("deptid"));
		request.setAttribute("rootDeptname", outDto.getAsString("deptname"));
		Dto dto = (Dto)g4Reader.queryForObject("Resource.queryEamenuByMenuID", "01");
		request.setAttribute("rootMenuName", dto.getAsString("menuname"));
		return mapping.findForward("initView");
	}
	
	/**
	 * 部门管理树初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward departmentTreeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String nodeid = request.getParameter("node");
		dto.put("parentid", nodeid);
		Dto outDto = organizationService.queryDeptItems(dto);
		write(outDto.getAsString("jsonString"), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询UI组件列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryParts(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm)form;
		Dto dto = cForm.getParamAsDto(request);
		List list = g4Reader.queryForPage("Part.queryParts", dto);
		Integer countInteger = (Integer) g4Reader.queryForObject("Part.queryPartsForPageCount", dto);
		for (int i = 0; i < list.size(); i++) {
			Dto partDto = (BaseDto)list.get(i);
			dto.put("partid", partDto.getAsString("partid"));
			Dto outDto = (BaseDto)g4Reader.queryForObject("Part.queryPart4UserGrant", dto);
			if (G4Utils.isEmpty(outDto)) {
				partDto.put("partauthtype", SystemConstants.PARTAUTHTYPE_NOGRANT);
			}else {
				partDto.putAll(outDto);
			}
		}
		String jsonString = encodeList2PageJson(list, countInteger, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存UI人员授权数据
	 * 
	 * @param
	 * @return
	 */
	public ActionForward savePartUserGrantDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		List list  = aForm.getGridDirtyData(request);
		Dto inDto = new BaseDto();
		inDto.setDefaultAList(list);
		if (!isDemoMode(response)) {
			partService.savePartUserGrantDatas(inDto);
			setOkTipMsg("授权数据保存成功", response);
		}
		return mapping.findForward(null);
	}

}
