package cn.osworks.aos.system.modules.controller;

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
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_extMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.PreferenceService;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.system.modules.service.auth.UserService;


/**
 * <b>首选项控制器</b>
 * 
 * @author OSWorks-XC
 * @date 2015-02-13
 */
@Controller
@RequestMapping(value = "system/preference")
public class PreferenceController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PreferenceService preferenceService;
	@Autowired
	private Aos_sys_user_extMapper aos_sys_user_extMapper;
	@Autowired
	private Aos_sys_userMapper aos_sys_userMapper;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private SystemService systemService;

	/**
	 * 首选项主页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		String bodyBorder = "0 0 1 0";
		String skin = WebCxt.getCfgByUser(session, "skin_");
		if (StringUtils.equalsIgnoreCase(skin, AOSCons.SKIN_NEPTUNE)) {
			bodyBorder = "0 0 0 0";
		}
		request.setAttribute("bodyBorder", bodyBorder);
		Dto inDto = Dtos.newDto(request);
		request.setAttribute("mdpm", systemService.getMasterDetailPageModel(inDto));
		request.setAttribute("page_load_msg_", WebCxt.getCfgOfDB("page_load_msg_"));
		return "aos/general/preference/preference.jsp";
	}

	/**
	 * 个人资料维护初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMyInfo")
	public String initMyInfo(HttpSession session, HttpServletRequest request) {
		return "aos/general/preference/item/myInfo.jsp";
	}
	
	/**
	 * 自定义菜单初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMyNav")
	public String initMyNav(HttpSession session, HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		String id_ = "p";
		String name_ = "请选择";
		String icon_name_ = "";
		if (StringUtils.equals(DicCons.USER_TYPE_SUPER, inDto.getUserInfo().getType_())) {
			//super类型账户
			String rootId = AOSCons.MODULE_ROOT_ID;
			Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(rootId);
			id_ = rootId;
			name_ = aos_sys_modulePO.getName_();
			icon_name_ = aos_sys_modulePO.getIcon_name_();
		}
		Dto rootDto = Dtos.newDto();
		rootDto.put("id_", id_);
		rootDto.put("name_", name_);
		rootDto.put("icon_name_", icon_name_);
		request.setAttribute("root_", rootDto);
		return "aos/general/preference/item/myNav.jsp";
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
		inDto.put("id_", inDto.getUserInfo().getId_());
		Dto outDto = preferenceService.getUserInfo(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改我的个人资料
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateMyInfo")
	public void updateMyInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.updateMyInfo(inDto);
		resetUserInfoVOInSession(session);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改我的密码
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateMyPwd")
	public void updateMyPwd(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = userService.updateMyPwd(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 查询功能模块树 (用于快捷菜单选择树)
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getModuleCheckTree4QuickMenu")
	public void getModuleCheckTree4QuickMenu(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		WebCxt.write(response, preferenceService.getModuleCheckTree4QuickMenu(inDto));
	}
	
	/**
	 * 查询功能模块树 (已选择的快捷菜单)
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getModuleTree4QuickMenu")
	public void getModuleTree4QuickMenu(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		WebCxt.write(response, preferenceService.getModuleTree4QuickMenu(inDto));
	}
	
	/**
	 * 查询功能模块 (快捷菜单排序管理)
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listQuickMenu4Sort")
	public void listQuickMenu4Sort(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		inDto.put("user_id_", inDto.getUserInfo().getId_());
		inDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_QUICK);
		List<Dto> list = sqlDao.list("Auth.listQuickMenu4Sort", inDto);
		WebCxt.write(response, AOSJson.toGridJson(list));
	}
	
	/**
	 * 保存快捷菜单的排序号
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveQuickMenuSortNo")
	public void saveQuickMenuSortNo(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.saveQuickMenuSortNo(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 保存快捷单信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveQuickModuleInfo")
	public void saveQuickModuleInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.saveQuickModuleInfo(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 重置会话容器中的用户对象
	 * 
	 * @param session
	 */
	private void resetUserInfoVOInSession(HttpSession session){
		UserInfoVO old_userInfoVO = WebCxt.getUserInfo(session);
		UserInfoVO new_userInfoVO = new UserInfoVO();
		Aos_sys_userPO aos_sys_userPO = aos_sys_userMapper.selectByKey(old_userInfoVO.getId_());
		AOSUtils.copyProperties(aos_sys_userPO, new_userInfoVO);
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = WebCxt.getUserCfgInfo(old_userInfoVO.getId_());
		new_userInfoVO.setCfgInfo(aos_sys_user_cfgPO);
		new_userInfoVO.setOrgInfo(old_userInfoVO.getOrgInfo());
		session.setAttribute(AOSCons.USERINFOKEY, new_userInfoVO);
	}
}
