package com.gitee.myclouds.system.module.role;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.wrapper.Dtos;

import cn.hutool.core.map.MapUtil;

/**
 * 角色 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestBody Map<String,Object> inMap){
		return roleService.list(Dtos.newPageDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String,Object> inMap){
		return roleService.get(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "add", produces = "application/json")
	public OutVO add(@RequestBody Map<String,Object> inMap){
		return roleService.add(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", produces = "application/json")
	public OutVO update(@RequestBody Map<String,Object> inMap){
		return roleService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", produces = "application/json")
	public OutVO delete(@RequestBody Map<String,Object> inMap){
		return roleService.delete(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 * 批量删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "batchDelete", produces = "application/json")
	public OutVO batchDelete(@RequestBody Map<String,Object> inMap){
		return roleService.batchDelete(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询授权树
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String,Object> inMap){
		return roleService.listGrantTree(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 * 授权
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "grant", produces = "application/json")
	public OutVO grant(@RequestBody Map<String,Object> inMap){
		return roleService.grant(Dtos.newDto(inMap));
	}
	
}
