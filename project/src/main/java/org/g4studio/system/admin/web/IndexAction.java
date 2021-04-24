package org.g4studio.system.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.CodeUtil;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.OrganizationService;
import org.g4studio.system.admin.service.UserService;
import org.g4studio.system.common.dao.vo.UserInfoVo;

/**
 * 首页Action
 * 
 * @author OSWorks-XC
 * @since 2010-01-13
 * @see BaseAction
 */
public class IndexAction extends BaseAction {
	
	private OrganizationService organizationService = (OrganizationService)SpringBeanLoader.getSpringBean("organizationService");

	/**
	 * 首页初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward indexInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("sysTitle", getParamValue("SYS_TITLE", request));
		request.setAttribute("westTitle", getParamValue("WEST_NAVIGATE_TITLE", request));
		String viewString = "indexView";
		String appLayout = getParamValue("APP_LAYOUT", request);
		if (appLayout.equals(G4Constants.APP_LAYOUT_DESKTOP)) {
			viewString = "desktopView";
		}
        String userLayout = getSessionContainer(request).getUserInfo().getLayout();
        if (G4Utils.isNotEmpty(userLayout)) {
    		if (userLayout.equals(G4Constants.APP_LAYOUT_DESKTOP)) {
    			viewString = "desktopView";
    		}else {
    			viewString = "indexView";
    		}
		}
		return mapping.findForward(viewString);
	}

	/**
	 * 欢迎页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward preferencesInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return mapping.findForward("welcomeView");
	}
	
	/**
	 * 保存用户自定义皮肤
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserTheme(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String theme = request.getParameter("theme");
		dto.put("userid", super.getSessionContainer(request).getUserInfo().getUserid());
		dto.put("theme", theme);
		Dto outDto = organizationService.saveUserTheme(dto);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存用户自定义布局
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserLayout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String layout = request.getParameter("layout");
		dto.put("userid", super.getSessionContainer(request).getUserInfo().getUserid());
		dto.put("layout", layout);
		Dto outDto = organizationService.saveUserLayout(dto);
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		userInfoVo.setLayout(layout);
		getSessionContainer(request).setUserInfo(userInfoVo);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存用户自定义桌面背景
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserBackground(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String background = request.getParameter("background");
		dto.put("userid", super.getSessionContainer(request).getUserInfo().getUserid());
		dto.put("background", background);
		Dto outDto = organizationService.saveUserBackground(dto);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 加载当前登录用户信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward loadUserInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		Dto inDto = new BaseDto();
		G4Utils.copyPropFromBean2Dto(userInfoVo, inDto);
		Dto outDto = (BaseDto)g4Reader.queryForObject("User.getUserInfoByKey", inDto);
		outDto.remove("password");
		String jsonString = JsonHelper.encodeDto2FormLoadJson(outDto, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 修改当前登录用户信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateUserInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm)form;
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		UserService service = (UserService)getService("userService");
		Dto indDto = cForm.getParamAsDto(request);
		Dto outDto = new BaseDto(G4Constants.TRUE);
		outDto.put("flag", G4Constants.SUCCESS);
		String password = CodeUtil.encryptBase64(indDto.getAsString("password2"), G4Constants.BASE64_KEY); 
		if (password.equals(userInfoVo.getPassword())) {
			service.updateUserItem4IndexPage(indDto);
			outDto.put("flag", G4Constants.SUCCESS);
			userInfoVo.setPassword(CodeUtil.encryptBase64(indDto.getAsString("password1"), G4Constants.BASE64_KEY));
			getSessionContainer(request).setUserInfo(userInfoVo);
		}else {
			outDto.setSuccess(G4Constants.FALSE);
			outDto.put("flag", G4Constants.FAILURE);
		}
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 解锁系统
	 * 
	 * @param
	 * @return
	 */
	public ActionForward unlockSystem(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm)form;
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		Dto indDto = cForm.getParamAsDto(request);
		String password = CodeUtil.encryptBase64(indDto.getAsString("password"), G4Constants.BASE64_KEY);
		Dto outDto = new BaseDto(G4Constants.TRUE);
		if (password.equals(userInfoVo.getPassword())) {
			outDto.put("flag", G4Constants.SUCCESS);
		}else {
			outDto.put("flag", G4Constants.FAILURE);
		}
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}

}
