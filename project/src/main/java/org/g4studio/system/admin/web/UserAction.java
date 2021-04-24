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
import org.g4studio.system.admin.service.UserService;
import org.g4studio.system.common.dao.vo.UserInfoVo;
import org.g4studio.system.common.util.SystemConstants;

/**
 * 用户管理与授权
 * 
 * @author OSWorks-XC
 * @since 2010-04-21
 * @see BaseAction
 */
public class UserAction extends BaseAction {
	
	private UserService userService = (UserService) super.getService("userService");
	
	private OrganizationService organizationService = (OrganizationService) super.getService("organizationService");


	/**
	 * 用户管理与授权页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward userInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
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
		return mapping.findForward("manageUserView");
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
	 * 查询用户列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryUsersForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		String deptid = request.getParameter("deptid");
		if (G4Utils.isNotEmpty(deptid)) {
			setSessionAttribute(request, "deptid", deptid);
		}
		if (!G4Utils.isEmpty(request.getParameter("firstload"))) {
			dto.put("deptid", super.getSessionContainer(request).getUserInfo().getDeptid());
		} else {
			dto.put("deptid", super.getSessionAttribute(request, "deptid"));
		}	
		dto.put("usertype", SystemConstants.USERTYPE_ADMIN);
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		if (WebUtils.getParamValue("DEFAULT_ADMIN_ACCOUNT", request).equals(userInfoVo.getAccount())) {
			dto.remove("usertype");
		}
		if (WebUtils.getParamValue("DEFAULT_DEVELOP_ACCOUNT", request).equals(userInfoVo.getAccount())) {
			dto.remove("usertype");
		}
		List userList = g4Reader.queryForPage("User.queryUsersForManage", dto);
		Integer pageCount = (Integer) g4Reader.queryForObject("User.queryUsersForManageForPageCount", dto);
		String jsonString = JsonHelper.encodeList2PageJson(userList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 保存用户
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		Dto outDto = userService.saveUserItem(inDto);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 删除用户
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteUserItems(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		if (!isDemoMode(response)) {
			userService.deleteUserItems(inDto);
			setOkTipMsg("用户数据删除成功", response);
		}
		return mapping.findForward(null);
	}

	/**
	 * 修改用户
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateUserItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		if (!isDemoMode(response)) {
			userService.updateUserItem(inDto);
			setOkTipMsg("用户数据修改成功", response);
		}
		return mapping.findForward(null);
	}

	/**
	 * 用户授权页面初始化:选择角色
	 * 
	 * @param
	 * @return
	 */
	public ActionForward userGrantInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.removeSessionAttribute(request, "USERID_USERACTION");
		String userid = request.getParameter("userid");
		super.setSessionAttribute(request, "USERID_USERACTION", userid);
		return mapping.findForward("selectRoleTreeView");
	}

	/**
	 * 用户授权页面初始化:选择菜单
	 * 
	 * @param
	 * @return
	 */
	public ActionForward selectMenuInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("selectMenuTreeView");
	}

	/**
	 * 保存用户角色关联信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveSelectedRole(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto inDto = new BaseDto();
		inDto.put("roleid", request.getParameter("roleid"));
		inDto.put("userid", super.getSessionAttribute(request, "USERID_USERACTION"));
		userService.saveSelectedRole(inDto);
		setOkTipMsg("您选择的人员角色关联数据保存成功", response);
		return mapping.findForward(null);
	}

	/**
	 * 保存用户菜单关联信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveSelectedMenu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto inDto = new BaseDto();
		inDto.put("menuid", request.getParameter("menuid"));
		inDto.put("userid", super.getSessionAttribute(request, "USERID_USERACTION"));
		if (!isDemoMode(response)) {
			userService.saveSelectedMenu(inDto);
			setOkTipMsg("您选择的人员菜单关联数据保存成功", response);
		}
		return mapping.findForward(null);
	}
}
