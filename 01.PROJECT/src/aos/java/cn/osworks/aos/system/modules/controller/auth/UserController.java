package cn.osworks.aos.system.modules.controller.auth;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.auth.UserService;

/**
 * 用户与授权
 * 
 * @author OSWorks-XC
 * @date 2014-08-08
 */
@Controller
@RequestMapping(value = "system/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;

	/**
	 * 页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		UserInfoVO userInfoVO = WebCxt.getUserInfo(session);
		request.setAttribute("dept_", userInfoVO.getOrgInfo());
		Dto rootDto_ = Dtos.newDto();
		String rootId, rootText, rootIcon;
		if (StringUtils.equals(userInfoVO.getType_(), DicCons.USER_TYPE_SUPER)) {
			//超级用户
			rootId = AOSCons.MODULE_ROOT_ID;
			Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(rootId);
			rootText = aos_sys_modulePO.getName_();
			rootIcon = aos_sys_modulePO.getIcon_name_();
		}else {
			rootId = "p";
			rootText = "请选择";
			rootIcon = "";
		}
		rootDto_.put("rootId", rootId);
		rootDto_.put("rootText", rootText);
		rootDto_.put("rootIcon", rootIcon);
		request.setAttribute("rootDto_", rootDto_);
		
		//获取缺省的用户配置项，将系统接配置项作为用户缺省配置
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = new Aos_sys_user_cfgPO();
        aos_sys_user_cfgPO.setTheme_(WebCxt.getCfgOfDB("theme_"));
        aos_sys_user_cfgPO.setSkin_(WebCxt.getCfgOfDB("skin_"));
        aos_sys_user_cfgPO.setIs_show_top_nav_(WebCxt.getCfgOfDB("is_show_top_nav_"));
        aos_sys_user_cfgPO.setNavbar_btn_style_(WebCxt.getCfgOfDB("navbar_btn_style_"));
        aos_sys_user_cfgPO.setTab_focus_color_(WebCxt.getCfgOfDB("tab_focus_color_"));
        aos_sys_user_cfgPO.setNav_tab_index_(WebCxt.getCfgOfDB("nav_tab_index_"));
        request.setAttribute("user_cfg_", aos_sys_user_cfgPO);
		return "aos/auth/user.jsp";
	}

	/**
	 * 查询用户列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listUsers")
	public void listUsers(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.put("grant", true); //去除超级用户
		qDto.put("user_id_", qDto.getUserInfo().getId_()); //去除当前用户(普通管理员)
		qDto.put("delete_flag_", DicCons.DELETE_FLAG.NO);
		List<Dto> list = userService.getUsersInOrg(qDto);
		String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 查询用户信息
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getUser")
	public void getUser(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = userService.getUser(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 保存用户信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUser")
	public void saveUser(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = userService.saveUser(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 修改用户信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateUser")
	public void updateUser(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = userService.updateUser(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 删除用户信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteUser")
	public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = userService.deleteUser(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 重置用户密码
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updatePwd")
	public void updatePwd(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.updatePwd(dto);
		WebCxt.write(response, "操作完成，用户密码重置成功。");
	}

	/**
	 * 修改用户状态
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateStatus")
	public void updateStatus(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.updateStatus(dto);
		WebCxt.write(response, "操作完成, 用户状态更新成功。");
	}

	/**
	 * 修改用户所属部门
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "updateUserOrg")
	public void updateUserOrg(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.updateUserOrg(dto);
		WebCxt.write(response, "操作完成, 用户所属部门信息更新成功。");
	}

	/**
	 * 获取菜单树(一次加载全部节点) 授权选择
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getModuleTree4Select")
	public void getModuleTree4Select(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = userService.getModuleTree4Select(inDto);
		WebCxt.write(response, jsonString);
	}

	/**
	 * 获取菜单树(一次加载全部节点) 查看已授权
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getModuleTree4Selected")
	public void getModuleTree4Selected(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = userService.getModuleTree4Selected(inDto).getStringA();
		WebCxt.write(response, jsonString);
	}

	/**
	 * 保存用户-功能模块授权信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUserModuleGrantInfo")
	public void saveUserModuleGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.saveUserModuleGrantInfo(dto);
		WebCxt.write(response, "授权信息保存成功。");
	}

	/**
	 * 查询岗位列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listPosts")
	public void listPosts(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> aos_sys_postList = userService.getPostsInOrg4Grant(qDto);
		String outString = AOSJson.toGridJson(aos_sys_postList, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询岗位列表(已选中)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listPosts2")
	public void listPosts2(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> list = userService.listGrantedPostsOfUser(qDto);
		String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 保存用户-岗位授权信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUserPostGrantInfo")
	public void saveUserPostGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.saveUserPostGrantInfo(dto);
		WebCxt.write(response, "授权信息保存成功。");
	}
	
	/**
	 * 取消用户岗位授权
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "delUserPostGrantInfo")
	public void delUserPostGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		Dto outDto = userService.delUserPostGrantInfo(qDto);
		String outString = AOSUtils.merge("操作成功，取消了{0}个岗位与用户的关联。", outDto.getIntegerA());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询角色列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listRoles")
	public void listRoles(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> roleInfos = userService.listRoles4Grant(qDto);
		String outString = AOSJson.toGridJson(roleInfos);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询角色列表(以授权)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listRoles2")
	public void listRoles2(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> list = userService.listGrantedRolesOfUser(qDto);
		String outString = AOSJson.toGridJson(list);
		WebCxt.write(response, outString);
	}

	/**
	 * 保存用户-角色授权信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUserRoleGrantInfo")
	public void saveUserRoleGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.saveUserRoleGrantInfo(dto);
		WebCxt.write(response, "授权信息保存成功。");
	}
	
	/**
	 * 取消用户-角色授权信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delUserRoleGrantInfo")
	public void delUserRoleGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		Dto outDto = userService.delUserRoleGrantInfo(qDto);
		String outString = AOSUtils.merge("操作成功，取消了{0}个角色与用户的关联。", outDto.getIntegerA());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 权限预览(用户菜单经办权限)。经过权限计算后的总权限。
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getBizModulesOfUser")
	public void getBizModulesOfUser(HttpServletRequest request, HttpServletResponse response) {
		String jsonString = userService.getBizModulesOfUser(Dtos.newDto(request));
		WebCxt.write(response, jsonString);
	}
	
	/**
	 * 权限预览(用户菜单管理权限)。经过权限计算后的总权限。
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getAdminModulesOfUser")
	public void getAdminModulesOfUser(HttpServletRequest request, HttpServletResponse response) {
		WebCxt.write(response, userService.getAdminModulesOfUser(Dtos.newDto(request)));
	}
	
	/**
	 * 权限预览(用户页面元素权限)。经过权限计算后的总权限。
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getElementsOfUser")
	public void getElementsOfUser(HttpServletRequest request, HttpServletResponse response) {
		WebCxt.write(response, AOSJson.toGridJson(userService.getElementsOfUser(Dtos.newDto(request))));
	}

}
