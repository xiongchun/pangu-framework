package com.gitee.myclouds.system.module.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.module.org.OrgService;

import cn.hutool.core.map.MapUtil;

/**
 * 用户管理 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private OrgService orgService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestBody Map<String, Object> inMap){
		return userService.list(Dtos.newPageDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String,Object> inMap){
		return userService.get(Dtos.newDto(inMap).getInteger("id"));
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "add", produces = "application/json")
	public OutVO add(@RequestBody Map<String,Object> inMap){
		return userService.add(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", produces = "application/json")
	public OutVO update(@RequestBody Map<String,Object> inMap){
		return userService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", produces = "application/json")
	public OutVO delete(@RequestBody Map<String,Object> inMap){
		return userService.delete(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 * 批量删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "batchDelete", produces = "application/json")
	public OutVO batchDelete(@RequestBody Map<String,Object> inMap){
		return userService.batchDelete(Dtos.newDto(inMap));
	}
	
	/**
	 * 根据用户查询待授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	@PostMapping(value = "listToGrantRoles", produces = "application/json")
	public OutVO listToGrantRoles(@RequestBody Map<String,Object> inMap){
		return userService.listToGrantRoles(MapUtil.getInt(inMap, "userId"));
	}
	
	/**
	 * 根据用户查询已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	@PostMapping(value = "listGrantedRoles", produces = "application/json")
	public OutVO listGrantedRoles(@RequestBody Map<String,Object> inMap){
		return userService.listGrantedRoles(MapUtil.getInt(inMap, "userId"));
	}
	
	/**
	 * 授权
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "grant", produces = "application/json")
	public OutVO grant(@RequestBody Map<String,Object> inMap){
		return userService.grant(Dtos.newDto(inMap));
	}
	
	/**
	 * 撤销
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "cancel", produces = "application/json")
	public OutVO cancel(@RequestBody Map<String,Object> inMap){
		return userService.cancel(Dtos.newDto(inMap));
	}
	
	/**
	 *  管理员重置用户密码
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "resetPwd", produces = "application/json")
	public OutVO resetPwd(@RequestBody Map<String,Object> inMap){
		return userService.resetPwd(Dtos.newDto(inMap));
	}
	
	/**
	 *查询组织树（返回树数据模型）
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String, Object> inMap){
		return orgService.listOrgTree(Dtos.newDto(inMap));
	}
}
