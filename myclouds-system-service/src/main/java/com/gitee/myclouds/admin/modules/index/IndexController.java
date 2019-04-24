package com.gitee.myclouds.admin.modules.index;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.vo.MenuVO;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 首页 服务发布
 * 
 * @author xiongchun
 * 
 */
@RestController
@RequestMapping("index")
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	/**
	 * 查询用户功能菜单列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "listMenus",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public List<MenuVO> listMenus(@RequestParam Map<String,Object> inMap){
		return indexService.listMenus(Dtos.newDto(inMap));
	}
}
