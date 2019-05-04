package com.gitee.myclouds.system.module.dict;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 数据字典 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/dict")
public class DictController {
	
	@Autowired
	private DictService dictService;
	
	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "list",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String list(@RequestParam Map<String,Object> inMap){
		return dictService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "get",method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json")
	public String get(@RequestParam Integer id){
		return dictService.get(id);
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "save",method = { RequestMethod.POST}, produces = "application/json")
	public Dto save(@RequestParam Map<String,Object> inMap){
		return dictService.save(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "update",method = { RequestMethod.POST}, produces = "application/json")
	public Dto update(@RequestParam Map<String,Object> inMap){
		return dictService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "delete",method = { RequestMethod.POST}, produces = "application/json")
	public Dto delete(@RequestParam Map<String,Object> inMap){
		return dictService.delete(Dtos.newDto(inMap));
	}
	
}
