package com.gitee.myclouds.admin.web.modules.org;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 组织机构FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myadmin-service")
public interface OrgService {
	
	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/org/list",method = RequestMethod.POST)
	String list(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 新增
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/org/save",method = RequestMethod.POST)
	Map<String, Object> save(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/org/delete",method = RequestMethod.POST)
	Map<String, Object> delete(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 查询部门树
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/org/listOrgTree",method = RequestMethod.POST)
	String listOrgTree(@RequestParam("inDto") Map<String,Object> inDto);
	
}
