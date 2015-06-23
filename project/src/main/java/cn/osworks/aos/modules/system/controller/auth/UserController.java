package cn.osworks.aos.modules.system.controller.auth;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_moduleMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_modulePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_user_cfgPO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.modules.system.service.auth.UserService;
import cn.osworks.aos.web.misc.DicCons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 用户与授权
 * 
 * @author OSWorks-XC
 * @date 2014-08-08
 */
@Controller
@RequestMapping(value = "system/user/")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private Aos_au_moduleMapper aos_au_moduleMapper;

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
			rootId = "0";
			//超级用户
			Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey("0");
			rootText = aos_au_modulePO.getName_();
			rootIcon = aos_au_modulePO.getIcon_name_();
		}else {
			rootId = "p";
			rootText = "请选择";
			rootIcon = "";
		}
		rootDto_.put("rootId", rootId);
		rootDto_.put("rootText", rootText);
		rootDto_.put("rootIcon", rootIcon);
		request.setAttribute("rootDto_", rootDto_);
		String skin = WebCxt.getCfgByUser(session, "skin_");
		String height = "210";
		if (StringUtils.equalsIgnoreCase(skin, AOSCons.SKIN_NEPTUNE)) {
			height = "223";
		}
		request.setAttribute("height", height);
		request.setAttribute("max_size", WebCxt.getCfgOfDB("byteobj_maxsize_"));
		
		//获取缺省的用户配置项，将系统接配置项作为用户缺省配置
		Aos_au_user_cfgPO aos_au_user_cfgPO = new Aos_au_user_cfgPO();
        aos_au_user_cfgPO.setTheme_(WebCxt.getCfgOfDB("theme_"));
        aos_au_user_cfgPO.setSkin_(WebCxt.getCfgOfDB("skin_"));
        aos_au_user_cfgPO.setLayout_(WebCxt.getCfgOfDB("layout_"));
        aos_au_user_cfgPO.setNav_mode_(WebCxt.getCfgOfDB("nav_mode_"));
        aos_au_user_cfgPO.setIs_show_top_nav_(WebCxt.getCfgOfDB("is_show_top_nav_"));
        aos_au_user_cfgPO.setNavbar_btn_style_(WebCxt.getCfgOfDB("navbar_btn_style_"));
        aos_au_user_cfgPO.setTab_focus_color_(WebCxt.getCfgOfDB("tab_focus_color_"));
        aos_au_user_cfgPO.setIs_show_mac_nav_(WebCxt.getCfgOfDB("is_show_mac_nav_"));
        aos_au_user_cfgPO.setNav_quick_layout_(WebCxt.getCfgOfDB("nav_quick_layout_"));
        aos_au_user_cfgPO.setNav_tab_index_(WebCxt.getCfgOfDB("nav_tab_index_"));
        request.setAttribute("user_cfg_", aos_au_user_cfgPO);
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
	 * 上传用户头像文件
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveUserPhoto")
	public void saveUserPhoto(@RequestParam("myfile_") MultipartFile myfile_, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dto inDto = Dtos.newDto(request);
		long size_ = myfile_.getSize()/1024; //以KB为单位存储
		long maxSize = NumberUtils.toLong(WebCxt.getCfgOfDB("byteobj_maxsize_"));
		if (size_ > maxSize) {
			WebCxt.write(response, AOSCons.ERROR, AOSUtils.merge("操作被取消，文件大小不能超过{0}KB。", maxSize));
			return;
		}
		inDto.put("myfile_", myfile_);
		inDto.put("size_", size_);
		inDto.put("catalog_id_", WebCxt.getCfgOfDB("user_head_catalog_id_"));
		inDto.put("title_", "用户头像_" + inDto.getUserInfo().getName_());
		String bytearray_id_ = userService.saveUserPhoto(inDto);
		Dto outDto = Dtos.newOutDto();
		outDto.put("bytearray_id_", bytearray_id_);
		outDto.setAppMsg("操作完成，用户头像文件上传成功。");
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 删除用户头像
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delUserPhoto")
	public void delUserPhoto(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		userService.delUserPhoto(dto);
		WebCxt.write(response, "操作完成，用户头像删除成功。");
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
		List<Dto> aos_au_postList = userService.getPostsInOrg4Grant(qDto);
		String outString = AOSJson.toGridJson(aos_au_postList, qDto.getPageTotal());
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
		WebCxt.write(response, userService.getBizModulesOfUser(Dtos.newDto(request)));
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
