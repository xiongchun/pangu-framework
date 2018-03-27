package com.gitee.myclouds.admin.modules.cache;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 缓存模块 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("cache")
public class CacheController {

	@Autowired
	private CacheCfgService cacheCfgService;
	
	/**
	 * 同步配置类缓存
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "syncCfgCache",method = { RequestMethod.POST}, produces = "application/json")
	public Dto syncCfgCache(@RequestParam Map<String,Object> inMap){
		return cacheCfgService.syncCfgCache(Dtos.newDto(inMap));
	}
	
}
