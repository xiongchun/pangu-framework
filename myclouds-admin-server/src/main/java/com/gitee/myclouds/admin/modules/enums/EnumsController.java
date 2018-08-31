package com.gitee.myclouds.admin.modules.enums;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 枚举参数 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("enums")
public class EnumsController {
	
	@Autowired
	private EnumsService enumsService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "list",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String list(@RequestParam Map<String,Object> inMap){
		return enumsService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "get",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String get(@RequestParam Integer id){
		return enumsService.get(id);
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "save",method = { RequestMethod.POST}, produces = "application/json")
	public Dto save(@RequestParam Map<String,Object> inMap){
		return enumsService.save(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "update",method = { RequestMethod.POST}, produces = "application/json")
	public Dto update(@RequestParam Map<String,Object> inMap){
		return enumsService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "delete",method = { RequestMethod.POST}, produces = "application/json")
	public Dto delete(@RequestParam Map<String,Object> inMap){
		return enumsService.delete(Dtos.newDto(inMap));
	}
	
}
