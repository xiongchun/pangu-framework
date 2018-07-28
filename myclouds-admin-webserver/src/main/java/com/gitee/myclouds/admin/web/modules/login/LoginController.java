package com.gitee.myclouds.admin.web.modules.login;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gitee.myclouds.toolbox.session.data.CurUser;
import com.gitee.myclouds.toolbox.util.MyCons;
import com.gitee.myclouds.toolbox.util.MyUtil;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 登录页
 * 
 * @author xiongchun
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@RequestMapping("login")
    public String login(ModelMap map) {
		
        return "login";  
    }
	
	/**
	 * 登录验证
	 * @param request
	 * @param httpSession
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "login/go", method = { RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Dto validate(HttpServletRequest request, HttpSession httpSession) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = Dtos.newDto(loginService.validate(inDto));
		if (StringUtils.equals(MyCons.YesOrNo.YES.getValue().toString(), outDto.getString("code"))) {
			CurUser curUser = new CurUser();
			MyUtil.copyProperties(outDto.get("curUser"), curUser);
			curUser.setSessionId(httpSession.getId());
			curUser.setRoleIds((List<String>)outDto.get("roleIds"));
			httpSession.setAttribute(MyCons.CUR_USER, curUser);
		}
		return outDto;
	}
	
	/**
	 * 注销
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("logout")
	@ResponseBody
    public Dto logout(HttpSession httpSession) {
		httpSession.invalidate();
        return Dtos.newDto().put2("code", "1").put2("msg", "用户安全退出成功");
    }
	
}
