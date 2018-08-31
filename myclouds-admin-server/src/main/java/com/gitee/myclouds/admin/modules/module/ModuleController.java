package com.gitee.myclouds.admin.modules.module;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 资源模块 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("module")
public class ModuleController {

	@Autowired
	private ModuleService moduleService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "list",method = { RequestMethod.POST}, produces = "application/json")
	public String list(@RequestParam Map<String,Object> inMap){
		return moduleService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "get",method = { RequestMethod.POST }, produces = "application/json")
	public String get(@RequestParam Integer id){
		return moduleService.get(id);
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "save",method = { RequestMethod.POST}, produces = "application/json")
	public Dto save(@RequestParam Map<String,Object> inMap){
		return moduleService.save(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "update",method = { RequestMethod.POST}, produces = "application/json")
	public Dto update(@RequestParam Map<String,Object> inMap){
		return moduleService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "delete",method = { RequestMethod.POST}, produces = "application/json")
	public Dto delete(@RequestParam Map<String,Object> inMap){
		return moduleService.delete(Dtos.newDto(inMap));
	}
	
	/**
	 *查询资源树
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "listModuleTree",method = { RequestMethod.POST}, produces = "application/json")
	public String listOrgTree(@RequestParam Map<String,Object> inMap){
		return moduleService.listModuleTree(Dtos.newDto(inMap));
	}
	
}
