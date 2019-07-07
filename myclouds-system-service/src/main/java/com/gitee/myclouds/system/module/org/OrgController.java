package com.gitee.myclouds.system.module.org;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.WebContext;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.mymodule.MyModuleEntity;
import com.gitee.myclouds.system.domain.myorg.MyOrgEntity;

import cn.hutool.core.map.MapUtil;

/**
 * 组织机构 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/org")
public class OrgController {

	@Autowired
	private OrgService orgService;
	@Autowired
	private WebContext webContext;

	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestBody Map<String, Object> inMap){
		OutVO outVO = new OutVO(0);
		List<MyModuleEntity> myModuleEntitys = orgService.list(Dtos.newDto(inMap));
		outVO.setData(myModuleEntitys).setCount(myModuleEntitys.size());
		return outVO;
	}
	
	/**
	 * 修改页面数据初始化
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		Dto dto = Dtos.newDto();
		MyOrgEntity myOrgEntity = orgService.get(MapUtil.getInt(inMap, "id"));
		MyOrgEntity parentOrgEntity = orgService.get(myOrgEntity.getParent_id());
		MyUtil.copyProperties(myOrgEntity, dto);
		if (MyUtil.isNotEmpty(parentOrgEntity)) {
			dto.put("parent_name", parentOrgEntity.getName());
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
	public OutVO add(@RequestBody Map<String,Object> inMap, HttpServletRequest request){
		OutVO outVO = new OutVO(0);
		UserVO userVO = webContext.getUserVO(request);
		orgService.add(Dtos.newDto(inMap), userVO);
		outVO.setMsg("组织新增成功");
		return outVO;
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", produces = "application/json")
	public OutVO update(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		orgService.update(Dtos.newDto(inMap));
		outVO.setMsg("组织修改成功");
		return outVO;
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", produces = "application/json")
	public OutVO delete(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		orgService.delete(MapUtil.getInt(inMap, "id"));
		outVO.setMsg("组织删除成功");
		return outVO;
	}
	
	/**
	 *查询组织树（返回树数据模型）
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String, Object> inMap){
		OutVO outVO = new OutVO(0);
		List<TreeNodeVO> treeNodeVOs = orgService.listOrgTree(Dtos.newDto(inMap));
		outVO.setData(treeNodeVOs);
		return outVO;
	}
	
}
