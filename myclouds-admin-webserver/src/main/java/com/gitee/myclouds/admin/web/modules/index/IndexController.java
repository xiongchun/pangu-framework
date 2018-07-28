package com.gitee.myclouds.admin.web.modules.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gitee.myclouds.common.web.vo.MenuVO;
import com.gitee.myclouds.toolbox.session.data.CurUser;
import com.gitee.myclouds.toolbox.util.WebCxt;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 首页
 * 
 * @author xiongchun
 *
 */
@Controller
public class IndexController {
	
	@Autowired
	private IndexService indexService;

	/**
	 * 首页入口
	 * @param model
	 * @param httpSession
	 * @param request
	 * @return
	 */
	@RequestMapping("/")
    public String index(Model model, HttpSession httpSession, HttpServletRequest request) {
		//model.addAttribute("", "");
		CurUser curUser = WebCxt.getCurUser(httpSession);
		Dto inDto = Dtos.newDto(request).put2("user_id", curUser.getId());
		inDto.put("ctxPath", httpSession.getServletContext().getContextPath());
		List<MenuVO> menuVOs = indexService.listMenus(inDto);
		//扩大访问域到session，所有会话内页面使用
		httpSession.setAttribute("level1Menus", menuVOs);
        return "index";  
    }
	
}
