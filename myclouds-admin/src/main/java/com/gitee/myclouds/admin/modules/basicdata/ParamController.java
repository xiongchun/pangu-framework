package com.gitee.myclouds.admin.modules.basicdata;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.admin.common.MyCxt;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * KV参数 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("param")
public class ParamController {
	
	@Autowired
	private ParamService paramService;
	@Autowired
	private CacheCfgService cacheCfgService;
	@Autowired
	private MyCxt myCxt;
	
	@RequestMapping(value = "list",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String list(@RequestParam Map<String,Object> inMap){
		Dto inDto = Dtos.newDto(inMap);
		String outJson = paramService.listAll(inDto);
		return outJson;
	}
	
	@RequestMapping(value = "test",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public void test(@RequestParam Map<String,Object> inMap){
		cacheCfgService.initCacheCfg();
		System.out.println(myCxt.getEnumElementValue("sex", "1"));
	}
	
}
