package com.gitee.myclouds.admin.web.enums;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 键值参数FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myadmin-service")
public interface EnumsService {
	
	/**
	 * 查询枚举参数列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/enums/list",method = RequestMethod.POST)
	String getEnums(@RequestParam("inDto") Map<String,Object> inDto);

}
