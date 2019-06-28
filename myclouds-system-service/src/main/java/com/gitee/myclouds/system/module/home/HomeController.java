package com.gitee.myclouds.system.module.home;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.wrapper.Dtos;

import cn.hutool.core.map.MapUtil;

/**
 * 首页 服务发布
 * 
 * @author xiongchun
 * 
 */
@RestController
@RequestMapping("admin/system/home")
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	/**
	 * 初始化首页框架
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "init", produces = "application/json")
	public OutVO init(@RequestBody Map<String,Object> inMap){
		return homeService.init(MapUtil.getInt(inMap, "userId"));
	}
	
	/**
	 *  修改当前登录用户密码
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "updatePwd", produces = "application/json")
	public OutVO updatePwd(@RequestBody Map<String,Object> inMap){
		return homeService.updatePwd(Dtos.newDto(inMap));
	}
	
	@RequestMapping(value = "test")
	public OutVO test(@RequestParam Map<String,Object> inMap, HttpServletRequest request, HttpSession session){
		System.out.println(session);
		System.out.println(session.getId());
		session.setAttribute("aaa", "AAA");
		return new OutVO(0);
	}
	@RequestMapping(value = "test2")
	public OutVO test2(@RequestParam Map<String,Object> inMap, HttpServletRequest request, HttpSession session){
		System.out.println(session);
		System.out.println(session.getId());
		System.out.println(session.getAttribute("aaa"));
		return new OutVO(0);
	}
	@RequestMapping(value = "test3")
	public OutVO test3(@RequestParam Map<String,Object> inMap, HttpServletRequest request, HttpSession session){
		session.invalidate();
		return new OutVO(0);
	}
}
