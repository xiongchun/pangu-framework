package com.gitee.myclouds.admin.modules.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 用户管理 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "list",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String list(@RequestParam Map<String,Object> inMap){
		return userService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "get",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String get(@RequestParam Integer id){
		return userService.get(id);
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "save",method = { RequestMethod.POST}, produces = "application/json")
	public Dto save(@RequestParam Map<String,Object> inMap){
		return userService.save(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "update",method = { RequestMethod.POST}, produces = "application/json")
	public Dto update(@RequestParam Map<String,Object> inMap){
		return userService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "delete",method = { RequestMethod.POST}, produces = "application/json")
	public Dto delete(@RequestParam Map<String,Object> inMap){
		return userService.delete(Dtos.newDto(inMap));
	}
	
	/**
	 * 根据用户查询待授权角色列表和已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "listRoleGrantInfo",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public List<Map<String, Object>> listRoleGrantInfo(@RequestParam Integer userId){
		return userService.listRoleGrantInfo(userId);
	}
	
	/**
	 * 授权
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "grant",method = { RequestMethod.POST}, produces = "application/json")
	public Dto grant(@RequestParam Map<String,Object> inMap){
		return userService.grant(Dtos.newDto(inMap));
	}
	
	/**
	 *  修改当前登录用户密码
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "updatePwd",method = { RequestMethod.POST}, produces = "application/json")
	public Dto updatePwd(@RequestParam Map<String,Object> inMap){
		return userService.updatePwd(Dtos.newDto(inMap));
	}
	
	/**
	 *  管理员重置用户密码
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "resetPwd",method = { RequestMethod.POST}, produces = "application/json")
	public Dto resetPwd(@RequestParam Map<String,Object> inMap){
		return userService.resetPwd(Dtos.newDto(inMap));
	}
}
