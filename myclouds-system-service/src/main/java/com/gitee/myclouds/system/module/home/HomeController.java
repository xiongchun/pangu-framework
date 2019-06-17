package com.gitee.myclouds.system.module.home;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.common.vo.MenuVO;

/**
 * 首页 服务发布
 * 
 * @author xiongchun
 * 
 */
@RestController
@RequestMapping("admin/home")
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	/**
	 * 查询用户功能菜单列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "listMenus",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public List<MenuVO> listMenus(@RequestParam Map<String,Object> inMap){
		return homeService.listMenus(Dtos.newDto(inMap));
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
}
