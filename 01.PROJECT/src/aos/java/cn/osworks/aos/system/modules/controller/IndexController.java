package cn.osworks.aos.system.modules.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.math.RandomUtils;
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
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_extMapper;
import cn.osworks.aos.system.dao.po.Aos_log_sessionPO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_extPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.IndexService;
import cn.osworks.aos.system.modules.service.PreferenceService;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.system.modules.service.auth.UserService;
import cn.osworks.aos.system.modules.service.log.LogService;

/**
 * <b>首页控制器</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-13
 */
@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;
	@Autowired
	private Aos_sys_userMapper aos_sys_userMapper;
	@Autowired
	private Aos_sys_user_extMapper aos_sys_user_extMapper;
	@Autowired
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private UserService userService;
	@Autowired
	private PreferenceService preferenceService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private LogService logService;

	/**
	 * 登录页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login")
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String curSkin = WebCxt.getCfgByUser(session, "skin_");
		request.setAttribute("app_name", WebCxt.getCfgOfDB("app_name_"));
		request.setAttribute("app_title", WebCxt.getCfgOfDB("app_title_"));
		request.setAttribute("north_back_img_", WebCxt.getDicCodeDesc("north_back_img_", curSkin));
		request.setAttribute("left_logo_", WebCxt.getDicCodeDesc("left_logo_", curSkin));
		request.setAttribute("vercode_characters", WebCxt.getCfgOfDB("vercode_characters_"));
		request.setAttribute("vercode_length", WebCxt.getCfgOfDB("vercode_length_"));
		request.setAttribute("show_login_win_head", WebCxt.getCfgOfDB("show_login_win_head_"));
		request.setAttribute("dev_account_login", WebCxt.getCfgOfDB("dev_account_login_"));
		String login_back_img = WebCxt.getCfgOfDB("login_back_img_");
		if (StringUtils.equals(login_back_img, "-1")) {
			int backImgIndex = RandomUtils.nextInt(3); // [0,3)
			login_back_img = backImgIndex + ".jpg";
		}
		request.setAttribute("login_back_img", login_back_img);
		String vercode_show = WebCxt.getCfgOfDB("vercode_show_");
		request.setAttribute("vercode_show", vercode_show);
		int rowSpace = 25, padding = 50;
		if (StringUtils.equals(vercode_show, "1")) {
			rowSpace = 15;
			padding = 30;
		}
		request.setAttribute("rowSpace", rowSpace);
		request.setAttribute("padding", padding);
		String login_page = WebCxt.getCfgOfDB("login_page_");
		return "aos/login/" + login_page;
	}

	/**
	 * 验证码校验
	 * 
	 * @param inDto
	 * @param session
	 * @return
	 */
	private Dto checkVerCode(Dto inDto, HttpSession session) {
		Dto outDto = Dtos.newDto();
		String vercode_show = WebCxt.getCfgOfDB("vercode_show_");
		// 配置为无验证码机制则跳过验证
		if (StringUtils.equals(vercode_show, "0")) {
			outDto.setBooleanA(true);
			return outDto;
		}
		String _vercode = (String) session.getAttribute(AOSCons.VERCODE);
		if (StringUtils.equalsIgnoreCase(_vercode, inDto.getString("vercode"))) {
			outDto.setBooleanA(true);
		} else {
			outDto.setBooleanA(false);
			outDto.setAppCode(-1);
			outDto.setAppMsg("验证码输入错误，请重新输入。");
		}
		return outDto;
	}

	/**
	 * 帐号密码校验
	 * 
	 * @param inDto
	 * @param session
	 * @return
	 */
	private Dto checkAccount(Dto inDto, HttpSession session) {
		Dto outDto = Dtos.newDto();
		// 帐号存在校验
		Dto aos_sys_userDto = Dtos.newDto("account_", inDto.getString("account_"));
		aos_sys_userDto.put("delete_flag_", DicCons.DELETE_FLAG.NO);
		Aos_sys_userPO aos_sys_userPO = aos_sys_userMapper.selectOne(aos_sys_userDto);
		if (AOSUtils.isEmpty(aos_sys_userPO)) {
			outDto.setBooleanA(false);
			outDto.setAppCode(-2);
			outDto.setAppMsg("帐号输入错误，请重新输入。");
		} else {
			// 密码校验
			String password = userService.encryptPwd(inDto.getString("password_"));
			if (!StringUtils.equals(password, aos_sys_userPO.getPassword_())) {
				outDto.setBooleanA(false);
				outDto.setAppCode(-3);
				outDto.setAppMsg("密码输入错误，请重新输入。");
			} else {
				// 有效状态校验
				if (!aos_sys_userPO.getStatus_().equals(DicCons.USER_STATUS_NORMAL)) {
					outDto.setBooleanA(false);
					outDto.setAppCode(-4);
					outDto.setAppMsg("该帐号已停用，系统拒绝登录。");
				} else {
					outDto.setBooleanA(true);
					outDto.put("aos_sys_userPO", aos_sys_userPO);
				}
			}
		}
		return outDto;
	}

	/**
	 * 登录认证
	 * 
	 * @param session
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "doLogin")
	public void doLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Dto inDto = Dtos.newDto(request);
		// 验证码检查
		Dto checkVerCodeDto = checkVerCode(inDto, session);
		if (!checkVerCodeDto.getBooleanA()) {
			WebCxt.write(response, AOSJson.toJson(checkVerCodeDto));
			return;
		}
		// 账户检查
		Dto checkAccountDto = checkAccount(inDto, session);
		if (!checkAccountDto.getBooleanA()) {
			WebCxt.write(response, AOSJson.toJson(checkAccountDto));
			return;
		}
		// 检查通过
		Dto outDto = Dtos.newDto();
		Aos_sys_userPO aos_sys_userPO = (Aos_sys_userPO) checkAccountDto.get("aos_sys_userPO");
		UserInfoVO userInfoVO = new UserInfoVO();
		AOSUtils.copyProperties(aos_sys_userPO, userInfoVO);
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = WebCxt.getUserCfgInfo(aos_sys_userPO.getId_());
		userInfoVO.setCfgInfo(aos_sys_user_cfgPO);
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_userPO.getOrg_id_());
		userInfoVO.setOrgInfo(aos_sys_orgPO);
		Aos_sys_user_extPO aos_sys_user_extPO = aos_sys_user_extMapper.selectByKey(aos_sys_userPO.getId_());
		userInfoVO.setExtInfo(aos_sys_user_extPO);
		session.setAttribute(AOSCons.USERINFOKEY, userInfoVO);
		saveSessionLog(request, session, userInfoVO);
		outDto.setAppCode(1);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 开发者快捷登录
	 * 
	 * @param response
	 * @param session
	 */
	@RequestMapping(value = "doDevLogin")
	public void doDevLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Dto outDto = Dtos.newDto();
		// 生产模式下禁用开发者快捷登录功能
		if (AOSCons.RUNAS_PRO.equals(WebCxt.getCfgOfDB("run_mode_"))) {
			outDto.setAppCode(-1);
			outDto.setAppMsg("生产模式下禁用开发者快捷登录功能。");
		} else {
			String dev_account_login = WebCxt.getCfgOfDB("dev_account_login_");
			if (!StringUtils.equals(dev_account_login, AOSCons.YES)) {
				outDto.setAppCode(-2);
				outDto.setAppMsg("开发者登录功能已被禁用。");
			} else {
				outDto.setAppCode(1);
				String dev_account = WebCxt.getCfgOfDB("dev_account_");
				Dto aos_sys_userDto = Dtos.newDto("account_", dev_account);
				aos_sys_userDto.put("delete_flag_", DicCons.DELETE_FLAG.NO);
				Aos_sys_userPO aos_sys_userPO = aos_sys_userMapper.selectOne(aos_sys_userDto);
				UserInfoVO userInfoVO = new UserInfoVO();
				AOSUtils.copyProperties(aos_sys_userPO, userInfoVO);
				Aos_sys_user_cfgPO aos_sys_user_cfgPO = WebCxt.getUserCfgInfo(aos_sys_userPO.getId_());
				userInfoVO.setCfgInfo(aos_sys_user_cfgPO);
				Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_userPO.getOrg_id_());
				userInfoVO.setOrgInfo(aos_sys_orgPO);
				session.setAttribute(AOSCons.USERINFOKEY, userInfoVO);
				saveSessionLog(request, session, userInfoVO);
			}
		}
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 保存会话日志
	 * 
	 * @param request
	 * @param session
	 * @param userInfoVO
	 */
	private void saveSessionLog(HttpServletRequest request, HttpSession session, UserInfoVO userInfoVO) {
		Aos_log_sessionPO aos_log_sessionPO = new Aos_log_sessionPO();
		aos_log_sessionPO.setId_(session.getId());
		aos_log_sessionPO.setUser_id_(userInfoVO.getId_());
		aos_log_sessionPO.setAccount_(userInfoVO.getAccount_());
		aos_log_sessionPO.setUser_name_(userInfoVO.getName_());
		aos_log_sessionPO.setClient_type_(request.getHeader("USER-AGENT"));
		aos_log_sessionPO.setIp_address_(WebCxt.getClientIpAddr(request));
		aos_log_sessionPO.setOwner_(String.valueOf(request.getServerPort()));
		logService.saveSessionLog(aos_log_sessionPO);
	}

	/**
	 * 认证通过跳转主页
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Dto inDto = Dtos.newDto(request);
		// 清除快捷菜单和浮动菜单的垃圾数据
		systemService.clearRubbishQuiclModules(inDto);
		// 构造West区域的系统导航
		List<Dto> cardDtos = indexService.getLeftNavCradList(inDto);
		request.setAttribute("cardDtos", cardDtos);
		// 第一个卡片标识字段
		String first_card_id_ = "";
		if (cardDtos.size() >= 1) {
			first_card_id_ = cardDtos.get(0).getString("id_");
		}
		// 界面初始化后选中的缺省卡片和缺省水平导航
		request.setAttribute("first_card_id_", first_card_id_);
		// 一些首页所需的页面变量
		initIndexVars(request, session, cardDtos);
		return "aos/index.jsp";
	}

	/**
	 * 初始化首页所需变量
	 * 
	 * @param request
	 */
	private void initIndexVars(HttpServletRequest request, HttpSession session, List<Dto> cardDtos) {
		UserInfoVO userInfoVO = WebCxt.getUserInfo(session);
		String app_name = WebCxt.getCfgOfDB("app_name_");
		request.setAttribute("app_name", app_name);
		String curSkin = WebCxt.getCfgByUser(session, "skin_");
		String north_back_img_ = WebCxt.getDicCodeDesc("north_back_img_", curSkin);
		request.setAttribute("north_back_img_", north_back_img_);
		String south_back_color_ = WebCxt.getDicCodeDesc("south_back_color_", curSkin);
		request.setAttribute("south_back_color_", south_back_color_);
		String copyright = WebCxt.getCfgOfDB("copyright_");
		request.setAttribute("copyright", copyright);
		String app_title = WebCxt.getCfgOfDB("app_title_");
		request.setAttribute("app_title", app_title);
		request.setAttribute("welcome_page_title", WebCxt.getCfgOfDB("welcome_page_title_"));
		request.setAttribute("logo", WebCxt.getCfgOfDB("logo_"));
		request.setAttribute("username", userInfoVO.getName_());
		request.setAttribute("deptname", userInfoVO.getOrgInfo().getName_());
		request.setAttribute("welcome", getWelcomeMsg());
		request.setAttribute("date", AOSUtils.getDateStr());
		request.setAttribute("week", AOSUtils.getWeekDayByDate(AOSUtils.getDateStr()));
		request.setAttribute("main_text_color_", WebCxt.getDicCodeDesc("main_text_color_", curSkin));
		request.setAttribute("nav_text_color_", WebCxt.getDicCodeDesc("nav_text_color_", curSkin));
		request.setAttribute("left_logo_", WebCxt.getDicCodeDesc("left_logo_", curSkin));
		request.setAttribute("page_load_msg_", WebCxt.getCfgOfDB("page_load_msg_"));
		String nav_tab_index_ = WebCxt.getCfgByUser(session, "nav_tab_index_");
		request.setAttribute("nav_tab_index_", nav_tab_index_);
		request.setAttribute("run_mode_", WebCxt.getCfgOfDB("run_mode_"));
		String statusbar_height = "18";
		if (StringUtils.equalsIgnoreCase("false", WebCxt.getCfgOfDB("is_show_statusbar_"))) {
			statusbar_height = "1";
		}
		request.setAttribute("statusbar_height", statusbar_height);
		String opacity = "0.5", alpha = "50";
		// 需要设置为不透明，否则IE的neptune主题下主页刷新会显示瑕疵
		if (AOSUtils.isIE(request.getHeader("USER-AGENT")) && curSkin.equalsIgnoreCase(AOSCons.SKIN_NEPTUNE)) {
			opacity = "1";
			alpha = "100";
		}
		request.setAttribute("opacity", opacity);
		request.setAttribute("alpha", alpha);
		String page_load_gif = WebCxt.getCfgOfDB("page_load_gif_");
		request.setAttribute("page_load_gif", page_load_gif);
		String searchfield_width = "185";
		if (curSkin.equalsIgnoreCase(AOSCons.SKIN_NEPTUNE)) {
			searchfield_width = "150";
		}
		request.setAttribute("searchfield_width", searchfield_width);
		// 导航相关的参数集
		Dto navDto = Dtos.newDto();
		String is_show_top_nav_ = WebCxt.getCfgByUser(session, "is_show_top_nav_");
		navDto.put("is_show_top_nav_", is_show_top_nav_);
		String nav_button_style = WebCxt.getCfgByUser(session, "navbar_btn_style_");
		navDto.put("nav_button_style", nav_button_style);
		// 分析导航条的class类属性
		navDto.putAll(initNavBarStyle(curSkin, nav_button_style));
		request.setAttribute("navDto", navDto);
	}

	/**
	 * 计算水平导航条、banner右侧注销等按钮样式风格
	 * 
	 * @param curSkin
	 * @param nav_button_style
	 * @return
	 */
	private Dto initNavBarStyle(String curSkin, String nav_button_style) {
		Dto outDto = Dtos.newDto();
		String nav_bar_style = "";
		String nav_bar_style_visited = "";
		String right_button_style = "";
		// 根据SKIN和navbar_btn_style_来判断
		if (curSkin.equalsIgnoreCase(AOSCons.SKIN_NEPTUNE)) {
			if (nav_button_style.equalsIgnoreCase("tight")) {
				nav_bar_style = "button button-pill button-border-neptune";
				nav_bar_style_visited = "button button-pill button-border-neptune button-border-neptune-visited";
				right_button_style = "button-small button-pill button-small-neptune";
			} else if (nav_button_style.equalsIgnoreCase("standalone")) {
				nav_bar_style = "button button-rounded button-border-neptune";
				nav_bar_style_visited = "button button-rounded button-border-neptune button-border-neptune-visited";
				right_button_style = "button-small button-rounded button-small-neptune";
			}
		} else if (curSkin.equalsIgnoreCase(AOSCons.SKIN_BLUE)) {
			if (nav_button_style.equalsIgnoreCase("tight")) {
				nav_bar_style = "button button-pill button-border-blue";
				nav_bar_style_visited = "button button-pill button-border-blue button-border-blue-visited";
				right_button_style = "button-small button-pill button-small-blue";
			} else if (nav_button_style.equalsIgnoreCase("standalone")) {
				nav_bar_style = "button button-rounded button-border-blue";
				nav_bar_style_visited = "button button-rounded button-border-blue button-border-blue-visited";
				right_button_style = "button-small button-rounded button-small-blue";
			}
		} else if (curSkin.equalsIgnoreCase(AOSCons.SKIN_GRAY)) {
			if (nav_button_style.equalsIgnoreCase("tight")) {
				nav_bar_style = "button button-pill button-border-gray";
				nav_bar_style_visited = "button button-pill button-border-gray button-border-gray-visited";
				right_button_style = "button-small button-pill button-small-gray";
			} else if (nav_button_style.equalsIgnoreCase("standalone")) {
				nav_bar_style = "button button-rounded button-border-gray";
				nav_bar_style_visited = "button button-rounded button-border-gray button-border-gray-visited";
				right_button_style = "button-small button-rounded button-small-gray";
			}
		} else if (curSkin.equalsIgnoreCase(AOSCons.SKIN_AOS)) {
			if (nav_button_style.equalsIgnoreCase("tight")) {

			} else if (nav_button_style.equalsIgnoreCase("standalone")) {

			}
		}
		outDto.put("nav_bar_style", nav_bar_style);
		outDto.put("nav_bar_style_visited", nav_bar_style_visited);
		outDto.put("right_button_style", right_button_style);
		return outDto;
	}

	/**
	 * 获取系统导航菜单树
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getModuleTree")
	public void getModuleTree(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = indexService.getModuleTree(inDto).getStringA();
		WebCxt.write(response, jsonString);
	}

	/**
	 * 获取快捷菜单树
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
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "logout")
	public void logout(HttpServletResponse response, HttpServletRequest request, HttpSession session) {
		session.invalidate();
	}

	/**
	 * 生成问候信息
	 * 
	 * @return
	 */
	private String getWelcomeMsg() {
		String welcome = "晚上好";
		Integer timeInteger = new Integer(AOSUtils.getDateTimeStr("HH"));
		if (timeInteger.intValue() >= 7 && timeInteger.intValue() <= 12) {
			welcome = "上午好";
		} else if (timeInteger.intValue() > 12 && timeInteger.intValue() < 19) {
			welcome = "下午好";
		}
		return welcome;
	}
}
