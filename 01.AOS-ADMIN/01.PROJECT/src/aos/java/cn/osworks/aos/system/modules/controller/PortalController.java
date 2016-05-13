package cn.osworks.aos.system.modules.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;


/**
 * <b>欢迎页控制器</b>
 * 
 * @author OSWorks-XC
 * @date 2014-10-13
 */
@Controller
@RequestMapping(value = "system/portal")
public class PortalController {
	
	@Autowired
	private SqlDao sqlDao;
	
	/**
	 * 页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		request.setAttribute("curSkin", WebCxt.getCfgByUser(session, "skin_"));
		return "aos/portal/portal.jsp";
	}
}
