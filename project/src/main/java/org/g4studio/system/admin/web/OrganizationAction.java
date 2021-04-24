package org.g4studio.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.OrganizationService;

/**
 * 组织机构模型
 * 
 * @author OSWorks-XC
 * @since 2010-04-10
 * @see BaseAction
 */
public class OrganizationAction extends BaseAction {
	
	private OrganizationService organizationService = (OrganizationService) super.getService("organizationService");
	
	/**
	 * 部门管理页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward departmentInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.removeSessionAttribute(request, "deptid");
		Dto inDto = new BaseDto();
		String deptid = super.getSessionContainer(request).getUserInfo().getDeptid();
		inDto.put("deptid", deptid);
		Dto outDto = organizationService.queryDeptinfoByDeptid(inDto);
		request.setAttribute("rootDeptid", outDto.getAsString("deptid"));
		request.setAttribute("rootDeptname", outDto.getAsString("deptname"));
		return mapping.findForward("manageDepartmentView");
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
	 * 查询部门列表信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryDeptsForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		String deptid = request.getParameter("deptid");
		if (G4Utils.isNotEmpty(deptid)) {
			super.setSessionAttribute(request, "deptid", deptid);
		}
		if(!G4Utils.isEmpty(request.getParameter("firstload"))){
			dto.put("deptid", super.getSessionContainer(request).getUserInfo().getDeptid());
		}else{
			dto.put("deptid", super.getSessionAttribute(request, "deptid"));
		}		
		List menuList = g4Reader.queryForPage("Organization.queryDeptsForManage", dto);
		Integer pageCount = (Integer) g4Reader.queryForObject("Organization.queryDeptsForManageForPageCount", dto);
		String jsonString = encodeList2PageJson(menuList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存部门
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveDeptItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		if (!isDemoMode(response)) {
			organizationService.saveDeptItem(inDto);
			setOkTipMsg("部门数据新增成功", response);
		}
		return mapping.findForward(null);
	}
	
	/**
	 * 修改部门
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateDeptItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		if (!isDemoMode(response)) {
			organizationService.updateDeptItem(inDto);
			setOkTipMsg("部门数据修改成功", response);
		}
		return mapping.findForward(null);
	}
	
	/**
	 * 删除部门项
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteDeptItems(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		String type = request.getParameter("type");
		String deptid = request.getParameter("deptid");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		inDto.put("type", type);
		inDto.put("deptid", deptid);
		if (!isDemoMode(response)) {
			organizationService.deleteDeptItems(inDto);
			setOkTipMsg("部门数据删除成功", response);
		}
		return mapping.findForward(null);
	}
	
	/**
	 * 根据用户所属部门编号查询部门对象<br>
	 * 用于构造组织机构树的根节点
	 * @param
	 * @return
	 */
	public ActionForward queryDeptinfoByDeptid(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = new BaseDto();
		String deptid = super.getSessionContainer(request).getUserInfo().getDeptid();
		inDto.put("deptid", deptid);
		Dto outDto = organizationService.queryDeptinfoByDeptid(inDto);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
}
