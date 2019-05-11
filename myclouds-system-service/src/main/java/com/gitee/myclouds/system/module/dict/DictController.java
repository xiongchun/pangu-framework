package com.gitee.myclouds.system.module.dict;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
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
	@RequestMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestParam Map<String, Object> inMap){
		return dictService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "get", consumes="application/json", produces = "application/json")
	public OutVO get(@RequestBody Integer id){
		return dictService.get(id);
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "save", consumes="application/json", produces = "application/json")
	public OutVO save(@RequestBody Map<String,Object> inMap){
		return dictService.save(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", consumes="application/json", produces = "application/json")
	public OutVO update(@RequestBody Map<String,Object> inMap){
		return dictService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", consumes="application/json", produces = "application/json")
	public OutVO delete(@RequestBody Map<String,Object> inMap){
		return dictService.delete(Dtos.newDto(inMap));
	}
	
}
