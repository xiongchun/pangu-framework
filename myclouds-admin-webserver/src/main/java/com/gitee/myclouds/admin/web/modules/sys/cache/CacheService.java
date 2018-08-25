package com.gitee.myclouds.admin.web.modules.sys.cache;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 缓存模块 FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myclouds-admin-server")
public interface CacheService {

	/**
	 * 同步配置类缓存
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/cache/syncCfgCache",method = RequestMethod.POST)
	Map<String, Object> syncCfgCache(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 刷新全局模块菜单缓存
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/cache/cacheModules",method = RequestMethod.POST)
	Map<String, Object> cacheModules(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 刷新所有角色授权数据缓存
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/cache/cacheRolesAuth",method = RequestMethod.POST)
	Map<String, Object> cacheRolesAuth(@RequestParam("inDto") Map<String,Object> inDto);
}
