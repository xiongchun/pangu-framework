package com.gitee.myclouds.admin.web.param;

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
public interface ParamService {
	
	/**
	 * 查询参数列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/list",method = RequestMethod.POST)
	String getParams(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 新增参数对象
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/save",method = RequestMethod.POST)
	Map<String, Object> saveParam(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除参数对象
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/delete",method = RequestMethod.POST)
	Map<String, Object> deleteParam(@RequestParam("inDto") Map<String,Object> inDto);
}
