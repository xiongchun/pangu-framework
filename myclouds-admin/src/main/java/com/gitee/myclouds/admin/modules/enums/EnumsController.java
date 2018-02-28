package com.gitee.myclouds.admin.modules.enums;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 枚举参数 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("enums")
public class EnumsController {
	
	@Autowired
	private EnumsService enumsService;

	@RequestMapping(value = "list",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String listEnums(@RequestParam Map<String,Object> inMap){
		return enumsService.listEnums(Dtos.newDto(inMap));
	}
}
