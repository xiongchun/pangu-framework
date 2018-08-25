package com.gitee.myclouds.admin.web.modules.sys.module;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 资源模块服务 FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myclouds-admin-server")
public interface ModuleService {

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/module/list",method = RequestMethod.POST)
	String list(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 查询实体
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/module/get",method = RequestMethod.POST)
	String get(@RequestParam("id") Integer id);
	
	/**
	 * 新增
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/module/save",method = RequestMethod.POST)
	Map<String, Object> save(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 修改
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/module/update",method = RequestMethod.POST)
	Map<String, Object> update(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/module/delete",method = RequestMethod.POST)
	Map<String, Object> delete(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 查询资源树
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/module/listModuleTree",method = RequestMethod.POST)
	String listModuleTree(@RequestParam("inDto") Map<String,Object> inDto);
	
}
