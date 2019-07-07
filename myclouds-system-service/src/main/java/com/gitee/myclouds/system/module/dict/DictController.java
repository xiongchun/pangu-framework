package com.gitee.myclouds.system.module.dict;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.base.vo.PageVO;
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
	public OutVO list(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		PageVO pageVO = dictService.list(Dtos.newPageDto(inMap));
		return outVO.setData(pageVO.getList()).setCount(pageVO.getCount());
	}

	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		outVO.setData(dictService.get(MapUtil.getInt(inMap, "id")));
		return outVO;
	}

	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "add", produces = "application/json")
	public OutVO add(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		dictService.add(Dtos.newDto(inMap));
		outVO.setMsg("数据字典新增成功");
		return outVO;
	}

	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", produces = "application/json")
	public OutVO update(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		dictService.update(Dtos.newDto(inMap));
		outVO.setMsg("数据字典修改成功");
		return outVO;
	}

	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", produces = "application/json")
	public OutVO delete(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		dictService.delete(MapUtil.getInt(inMap, "id"));
		outVO.setMsg("数据字典删除成功");
		return outVO;
	}

	/**
	 * 批量删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "batchDelete", produces = "application/json")
	public OutVO batchDelete(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		dictService.batchDelete(MapUtil.getStr(inMap, "ids"));
		outVO.setMsg("数据字典删除成功");
		return outVO;
	}

}
