package com.gitee.myclouds.system.module.org;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.WebContext;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.wrapper.Dtos;

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
		return orgService.list(Dtos.newDto(inMap));
	}
	
	/**
	 * 查询实体
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String,Object> inMap){
		return orgService.get(Dtos.newDto(inMap).getInteger("id"));
	}
	
	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "add", produces = "application/json")
	public OutVO add(@RequestBody Map<String,Object> inMap, HttpServletRequest request){
		UserVO userVO = webContext.getUserVO(request);
		return orgService.add(Dtos.newDto(inMap), userVO);
	}
	
	/**
	 * 修改
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "update", produces = "application/json")
	public OutVO update(@RequestBody Map<String,Object> inMap){
		return orgService.update(Dtos.newDto(inMap));
	}
	
	/**
	 * 删除
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "delete", produces = "application/json")
	public OutVO delete(@RequestBody Map<String,Object> inMap){
		return orgService.delete(MapUtil.getInt(inMap, "id"));
	}
	
	/**
	 *查询组织树（返回树数据模型）
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String, Object> inMap){
		return orgService.listOrgTree(Dtos.newDto(inMap));
	}
	
}
