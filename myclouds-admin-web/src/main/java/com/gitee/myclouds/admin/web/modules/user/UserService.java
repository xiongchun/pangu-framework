package com.gitee.myclouds.admin.web.modules.user;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 用户FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myadmin-service")
public interface UserService {

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/user/list",method = RequestMethod.POST)
	String list(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 新增
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/user/save",method = RequestMethod.POST)
	Map<String, Object> save(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 删除
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/user/delete",method = RequestMethod.POST)
	Map<String, Object> delete(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 根据用户查询待授权角色列表和已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/user/listRoleGrantInfo",method = RequestMethod.POST)
	List<Map<String, Object>> listRoleGrantInfo(@RequestParam("userId") Integer userId);
	
	/**
	 * 授权
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/user/grant",method = RequestMethod.POST)
	Map<String, Object> grant(@RequestParam("inDto") Map<String,Object> inDto);
	
	/**
	 * 修改当前登录用户密码
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/user/updatePwd",method = RequestMethod.POST)
	Map<String, Object> updatePwd(@RequestParam("inDto") Map<String,Object> inDto);
	
}
