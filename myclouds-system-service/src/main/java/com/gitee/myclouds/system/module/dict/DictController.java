package com.gitee.myclouds.system.module.dict;

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
	@PostMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestBody Map<String, Object> inMap){
		return dictService.list(Dtos.newPageDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String,Object> inMap){
		return dictService.get(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "add", produces = "application/json")
	public OutVO add(@RequestBody Map<String,Object> inMap){
		return dictService.add(Dtos.newDto(inMap));
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", produces = "application/json")
	public OutVO update(@RequestBody Map<String,Object> inMap){
		return dictService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", produces = "application/json")
	public OutVO delete(@RequestBody Map<String,Object> inMap){
		return dictService.delete(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 * 批量删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "batchDelete", produces = "application/json")
	public OutVO batchDelete(@RequestBody Map<String,Object> inMap){
		return dictService.batchDelete(Dtos.newDto(inMap));
	}
	
	/**
	 * 测试
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "test", produces = "application/json")
	public OutVO test(@RequestBody Map<String,Object> inMap){
		System.out.println(inMap);
		return new OutVO(-2).setMsg("这是错误提示信息");
	}
	
}
