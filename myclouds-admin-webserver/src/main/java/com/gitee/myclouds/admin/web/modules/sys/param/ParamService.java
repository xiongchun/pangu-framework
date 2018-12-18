package com.gitee.myclouds.admin.web.modules.sys.param;

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
@FeignClient(value = "myclouds-admin-server")
public interface ParamService {
	
	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/list",method = RequestMethod.POST)
	String list(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 查询实体
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/get",method = RequestMethod.POST)
	String get(@RequestParam("id") Integer id);
	
	/**
	 * 新增
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/save",method = RequestMethod.POST)
	Map<String, Object> save(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 修改
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/update",method = RequestMethod.POST)
	Map<String, Object> update(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/param/delete",method = RequestMethod.POST)
	Map<String, Object> delete(@RequestParam("inDto") Map<String,Object> inDto);
}
