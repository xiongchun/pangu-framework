package com.gitee.myclouds.system.module.role;

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
import com.gitee.myclouds.base.vo.PageVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.wrapper.Dtos;

import cn.hutool.core.map.MapUtil;

/**
 * 角色 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	@Autowired
	private WebContext webContext;

	/**
	 * 查询列表
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "list", produces = "application/json")
	public OutVO list(@RequestBody Map<String, Object> inMap, HttpServletRequest request) {
		OutVO outVO = new OutVO(0);
		UserVO userVO = webContext.getUserVO(request);
		PageVO pageVO = roleService.list(Dtos.newPageDto(inMap), userVO);
		outVO.setData(pageVO.getList()).setCount(pageVO.getCount());
		return outVO;
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
		outVO.setData(roleService.get(MapUtil.getInt(inMap, "id")));
		return outVO;
	}

	/**
	 * 新增
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "add", produces = "application/json")
	public OutVO add(@RequestBody Map<String, Object> inMap, HttpServletRequest request) {
		OutVO outVO = new OutVO(0);
		UserVO userVO = webContext.getUserVO(request);
		roleService.add(Dtos.newDto(inMap), userVO);
		outVO.setMsg("角色新增成功");
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
		roleService.update(Dtos.newDto(inMap));
		outVO.setMsg("角色修改成功");
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
		roleService.delete(MapUtil.getInt(inMap, "id"));
		outVO.setMsg("角色删除成功");
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
		roleService.batchDelete(Dtos.newDto(inMap));
		outVO.setMsg("角色删除成功");
		return outVO;
	}

	/**
	 * 查询授权树
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		List<TreeNodeVO> treeNodeVOs = roleService.listGrantTree(MapUtil.getInt(inMap, "id"));
		outVO.setData(treeNodeVOs);
		return outVO;
	}

	/**
	 * 授权
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "grant", produces = "application/json")
	public OutVO grant(@RequestBody Map<String, Object> inMap, HttpServletRequest request) {
		OutVO outVO = new OutVO(0);
		UserVO userVO = webContext.getUserVO(request);
		roleService.grant(Dtos.newDto(inMap), userVO);
		outVO.setMsg("角色授权成功");
		return outVO;
	}

}
