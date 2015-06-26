package cn.osworks.aos.modules.system.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_moduleMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_userMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_user_extMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_modulePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_module_user_navPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_userPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_user_cfgPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_user_extPO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.modules.system.service.PreferenceService;
import cn.osworks.aos.modules.system.service.SystemService;
import cn.osworks.aos.modules.system.service.auth.UserService;
import cn.osworks.aos.web.misc.DicCons;


/**
 * <b>首选项控制器</b>
 * 
 * @author OSWorks-XC
 * @date 2015-02-13
 */
@Controller
@RequestMapping(value = "system/preference/")
public class PreferenceController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PreferenceService preferenceService;
	@Autowired
	private Aos_au_user_extMapper aos_au_user_extMapper;
	@Autowired
	private Aos_au_userMapper aos_au_userMapper;
	@Autowired
	private Aos_au_moduleMapper aos_au_moduleMapper;
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
		return "aos/general/preference/preference.jsp";
	}

	/**
	 * 个人资料维护初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMyInfo")
	public String initMyInfo(HttpSession session, HttpServletRequest request) {
		String skin = WebCxt.getCfgByUser(session, "skin_");
		String height = "210";
		if (StringUtils.equalsIgnoreCase(skin, AOSCons.SKIN_NEPTUNE)) {
			height = "223";
		}
		request.setAttribute("height", height);
		request.setAttribute("max_size", WebCxt.getCfgOfDB("byteobj_maxsize_"));
		return "aos/general/preference/item/myInfo.jsp";
	}
	
	/**
	 * 偏好设置初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMySettings")
	public String initMySettings(HttpSession session, HttpServletRequest request) {
		return "aos/general/preference/item/mySettings.jsp";
	}
	
	/**
	 * 系统安全选项初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initSecurityCfg")
	public String initSecurityCfg(HttpSession session, HttpServletRequest request) {
		return "aos/general/preference/item/securityCfg.jsp";
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
			//非super类型账户
			Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey("0");
			id_ = "0";
			name_ = aos_au_modulePO.getName_();
			icon_name_ = aos_au_modulePO.getIcon_name_();
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
	 * 修改我的偏好设置
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateMySettings")
	public void updateMySettings(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.updateMySettings(inDto);
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
	 * 查询功能模块树(用于浮动菜单绑定)
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listModuleTree")
	public void listModuleTree(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		WebCxt.write(response, preferenceService.getModuleTree4BindingFloatMenu(inDto));
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
	 * 保存浮动菜单信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveFloatModuleInfo")
	public void saveFloatModuleInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.saveFloatModuleInfo(inDto);
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
	 * 修改浮动菜单信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateFloatModuleInfo")
	public void updateFloatModuleInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.updateFloatModuleInfo(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 删除浮动菜单信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delFloatModules")
	public void delFloatModules(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = preferenceService.delFloatModules(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 查询浮动菜单信息
	 *
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listFloatModules")
	public void listFloatModules(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		inDto.put("user_id_", inDto.getUserInfo().getId_());
		inDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_FLOAT);
		List<Aos_au_module_user_navPO> aos_au_module_user_navPOs = sqlDao.list("Auth.listAos_au_module_user_navPOs", inDto);
		WebCxt.write(response, AOSJson.toGridJson(aos_au_module_user_navPOs, aos_au_module_user_navPOs.size()));
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
		inDto.put("id_", inDto.getUserInfo().getId_());
		Aos_au_user_extPO aos_au_user_extPO = aos_au_user_extMapper.selectByKey(inDto.getUserInfo().getId_());
		inDto.put("bytearray_id_", aos_au_user_extPO.getBytearray_id_());
		String bytearray_id_ = userService.saveUserPhoto(inDto);
		Dto outDto = Dtos.newOutDto();
		outDto.put("bytearray_id_", bytearray_id_);
		outDto.setAppMsg("操作完成，用户头像文件上传成功。");
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
		Aos_au_userPO aos_au_userPO = aos_au_userMapper.selectByKey(old_userInfoVO.getId_());
		AOSUtils.apply(aos_au_userPO, new_userInfoVO);
		Aos_au_user_cfgPO aos_au_user_cfgPO = WebCxt.getUserCfgInfo(old_userInfoVO.getId_());
		new_userInfoVO.setCfgInfo(aos_au_user_cfgPO);
		new_userInfoVO.setOrgInfo(old_userInfoVO.getOrgInfo());
		session.setAttribute(AOSCons.USERINFOKEY, new_userInfoVO);
	}
}
