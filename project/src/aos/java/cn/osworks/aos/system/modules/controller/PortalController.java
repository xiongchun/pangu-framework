package cn.osworks.aos.system.modules.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;


/**
 * <b>欢迎页控制器</b>
 * 
 * @author OSWorks-XC
 * @date 2014-10-13
 */
@Controller
@RequestMapping(value = "system/portal/")
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
		UserInfoVO userInfoVO = WebCxt.getUserInfo(session);
		Dto qDto = Dtos.newDto("user_id_", userInfoVO.getId_());
		qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_FLOAT);
		List<Dto> macList = sqlDao.list("Auth.getNavMenusByUser", qDto);
		//TODO 过滤掉菜单权限被管理员收回的自定义浮动菜单
		request.setAttribute("macList", macList);
		request.setAttribute("welcome_mac_on", WebCxt.getCfgByUser(session, "is_show_mac_nav_"));
		request.setAttribute("curSkin", WebCxt.getCfgByUser(session, "skin_"));
		return "aos/portal/portal.jsp";
	}
}
