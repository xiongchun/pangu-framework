package com.gitee.myclouds.system.module.module;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.mymodule.MyModuleEntity;

import cn.hutool.core.map.MapUtil;

/**
 * 资源模块 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/module")
public class ModuleController {

	@Autowired
	private ModuleService moduleService;

	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		List<MyModuleEntity> myModuleEntitys = moduleService.list(Dtos.newDto(inMap));
		outVO.setData(myModuleEntitys).setCount(myModuleEntitys.size());
		return outVO;
	}

	/**
	 * 查询修改数据
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		Dto dto = Dtos.newDto();
		MyModuleEntity myModuleEntity = moduleService.get(MapUtil.getInt(inMap, "id"));
		MyModuleEntity parentModuleEntity = moduleService.get(myModuleEntity.getParent_id());
		MyUtil.copyProperties(myModuleEntity, dto);
		if (MyUtil.isNotEmpty(parentModuleEntity)) {
			dto.put("parent_name", parentModuleEntity.getName());
		}else {
			dto.put("parent_name", "无");
		}
		outVO.setData(dto);
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
		moduleService.add(Dtos.newDto(inMap));
		outVO.setMsg("资源模块新增成功");
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
		moduleService.update(Dtos.newDto(inMap));
		outVO.setMsg("资源模块修改成功");
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
		moduleService.delete(MapUtil.getInt(inMap, "id"));
		outVO.setMsg("资源模块修改成功");
		return outVO;
	}

	/**
	 * 查询资源树（返回树数据模型）
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		outVO.setData(moduleService.listModuleTree(Dtos.newDto(inMap)));
		return outVO;
	}

}
