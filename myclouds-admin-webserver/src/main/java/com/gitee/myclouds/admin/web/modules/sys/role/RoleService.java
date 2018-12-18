package com.gitee.myclouds.admin.web.modules.sys.role;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 角色服务 FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myclouds-admin-server")
public interface RoleService {

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/list",method = RequestMethod.POST)
	String list(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 查询实体
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/get",method = RequestMethod.POST)
	String get(@RequestParam("id") Integer id);
	
	/**
	 * 新增
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/save",method = RequestMethod.POST)
	Map<String, Object> save(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 修改
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/update",method = RequestMethod.POST)
	Map<String, Object> update(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/delete",method = RequestMethod.POST)
	Map<String, Object> delete(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 查询授权树列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/listGrantTree",method = RequestMethod.POST)
	String listGrantTree(@RequestParam("roleId") Integer roleId);
	
	/**
	 * 授权
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/role/grant",method = RequestMethod.POST)
	Map<String, Object> grant(@RequestParam("inDto") Map<String,Object> inDto);
	
}
