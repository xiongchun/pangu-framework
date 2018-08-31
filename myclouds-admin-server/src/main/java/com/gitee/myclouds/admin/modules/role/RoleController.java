package com.gitee.myclouds.admin.modules.role;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 角色 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "list",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String list(@RequestParam Map<String,Object> inMap){
		return roleService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "get",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String get(@RequestParam Integer id){
		return roleService.get(id);
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "save",method = { RequestMethod.POST}, produces = "application/json")
	public Dto save(@RequestParam Map<String,Object> inMap){
		return roleService.save(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "update",method = { RequestMethod.POST}, produces = "application/json")
	public Dto update(@RequestParam Map<String,Object> inMap){
		return roleService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "delete",method = { RequestMethod.POST}, produces = "application/json")
	public Dto delete(@RequestParam Map<String,Object> inMap){
		return roleService.delete(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询授权树
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "listGrantTree",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String listGrantTree(@RequestParam Integer roleId){
		return roleService.listGrantTree(roleId);
	}
	
	/**
	 * 授权
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "grant",method = { RequestMethod.POST}, produces = "application/json")
	public Dto grant(@RequestParam Map<String,Object> inMap){
		return roleService.grant(Dtos.newDto(inMap));
	}
	
}
