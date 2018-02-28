package com.gitee.myclouds.admin.web.enums;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 枚举类型参数FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myadmin-service")
public interface EnumsService {
	
	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/enums/list",method = RequestMethod.POST)
	String list(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除参数对象
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/enums/delete",method = RequestMethod.POST)
	Map<String, Object> delete(@RequestParam("inDto") Map<String,Object> inDto);

}
