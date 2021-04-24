package org.g4studio.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.util.WebUtils;
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
import org.g4studio.system.admin.service.RoleService;
import org.g4studio.system.common.dao.vo.UserInfoVo;
import org.g4studio.system.common.util.SystemConstants;

/**
 * 角色管理与授权
 * 
 * @author OSWorks-XC
 * @since 2010-04-21
 */
public class RoleAction extends BaseAction{
	
	private RoleService roleService = (RoleService) super.getService("roleService");
	private OrganizationService organizationService = (OrganizationService) super.getService("organizationService");
	
	/**
	 * 角色管理与授权页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward roleInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.removeSessionAttribute(request, "deptid");
		Dto inDto = new BaseDto();
		String deptid = super.getSessionContainer(request).getUserInfo().getDeptid();
		inDto.put("deptid", deptid);
		Dto outDto = organizationService.queryDeptinfoByDeptid(inDto);
		request.setAttribute("rootDeptid", outDto.getAsString("deptid"));
		request.setAttribute("rootDeptname", outDto.getAsString("deptname"));
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		request.setAttribute("login_account", userInfoVo.getAccount());
		return mapping.findForward("manageRoleView");
	}
	
	/**
	 * 部门树初始化
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
	 * 查询角色列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryRolesForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
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
		dto.put("roletype", SystemConstants.ROLETYPE_ADMIN);
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		if (WebUtils.getParamValue("DEFAULT_ADMIN_ACCOUNT", request).equals(userInfoVo.getAccount())) {
			dto.remove("roletype");
		}
		if (WebUtils.getParamValue("DEFAULT_DEVELOP_ACCOUNT", request).equals(userInfoVo.getAccount())) {
			dto.remove("roletype");
		}
		List roleList = g4Reader.queryForPage("Role.queryRolesForManage", dto);
		Integer pageCount = (Integer)g4Reader.queryForObject("Role.queryRolesForManageForPageCount", dto);
		String jsonString = JsonHelper.encodeList2PageJson(roleList, pageCount, null);	
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存角色
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveRoleItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		roleService.saveRoleItem(inDto);
		setOkTipMsg("角色新增成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除角色
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteRoleItems(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		if (!isDemoMode(response)) {
			roleService.deleteRoleItems(inDto);
			setOkTipMsg("角色删除成功", response);
		}
		return mapping.findForward(null);
	}
	
	/**
	 * 修改角色
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateRoleItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		roleService.updateRoleItem(inDto);
		setOkTipMsg("角色修改成功", response);
		return mapping.findForward(null);
	}
		
	/**
	 * 操作权限授权初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward operatorTabInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.removeSessionAttribute(request, "ROLEID_ROLEACTION");
		String roleid = request.getParameter("roleid");
		super.setSessionAttribute(request, "ROLEID_ROLEACTION", roleid);
		return mapping.findForward("operatorTabView");
	}
	
	/**
	 * 选择人员初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward selectUserTabInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("selectUserTabView");
	}
	
	/**
	 * 管理权限授权初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward managerTabInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("managerTabView");
	}
	
	/**
	 * 保存角色授权信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveGrant(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto inDto = new BaseDto();
		inDto.put("menuid", request.getParameter("menuid"));
		inDto.put("authorizelevel", request.getParameter("key"));
		inDto.put("roleid", super.getSessionAttribute(request, "ROLEID_ROLEACTION"));
		roleService.saveGrant(inDto);
		String msg = "";
		if(inDto.getAsString("authorizelevel").equals(SystemConstants.AUTHORIZELEVEL_ACCESS))
			msg = "经办权限授权成功";
		if(inDto.getAsString("authorizelevel").equals(SystemConstants.AUTHORIZELEVEL_ADMIN))
			msg = "管理权限授权成功";
		setOkTipMsg(msg, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存角色用户关联信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto inDto = new BaseDto();
		inDto.put("userid", request.getParameter("userid"));
		inDto.put("roleid", super.getSessionAttribute(request, "ROLEID_ROLEACTION"));
		roleService.saveSelectUser(inDto);
		setOkTipMsg("您选择的角色人员关联数据保存成功", response);
		return mapping.findForward(null);
	}
}
