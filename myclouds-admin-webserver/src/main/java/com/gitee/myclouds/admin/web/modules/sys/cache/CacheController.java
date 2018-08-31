package com.gitee.myclouds.admin.web.modules.sys.cache;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 缓存模块
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping("sys/cache")
public class CacheController {
	
	@Autowired
	private CacheService cacheService;
	
	/**
	 * 同步配置类缓存
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "syncCfgCache", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto syncCfgCache(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(cacheService.syncCfgCache(inDto));
	}
	
	/**
	 * 刷新全局模块菜单缓存
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "cacheModules", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto cacheModules(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(cacheService.cacheModules(inDto));
	}
	
	/**
	 * 刷新所有角色授权数据缓存
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "cacheRolesAuth", method = { RequestMethod.POST }, produces = "application/json")
	@ResponseBody
	public Dto cacheRolesAuth(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto(cacheService.cacheRolesAuth(inDto));
	}
	
}
