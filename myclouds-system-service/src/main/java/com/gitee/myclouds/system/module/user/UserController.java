package com.gitee.myclouds.system.module.user;

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
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.myorg.MyOrgEntity;
import com.gitee.myclouds.system.domain.myuser.MyUserEntity;
import com.gitee.myclouds.system.module.org.OrgService;

import cn.hutool.core.map.MapUtil;

/**
 * 用户管理 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/user")
public class UserController {

	@Autowired
	private UserService userService;
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
	public OutVO list(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		PageVO pageVO = userService.list(Dtos.newPageDto(inMap));
		outVO.setData(pageVO.getList()).setCount(pageVO.getCount());
		return outVO;
	}

	/**
	 * 修改页面数据初始化
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "get", produces = "application/json")
	public OutVO get(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		MyUserEntity myUserEntity = userService.get(MapUtil.getInt(inMap, "id"));
		MyOrgEntity orgEntity = orgService.get(myUserEntity.getOrg_id());
		Dto dto = Dtos.newDto();
		MyUtil.copyProperties(myUserEntity, dto);
		if (MyUtil.isNotEmpty(orgEntity)) {
			dto.put("org_name", orgEntity.getName());
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
	public OutVO add(@RequestBody Map<String, Object> inMap, HttpServletRequest request) {
		OutVO outVO = new OutVO(0);
		UserVO userVO = webContext.getUserVO(request);
		userService.add(Dtos.newDto(inMap), userVO);
		outVO.setMsg("用户新增成功");
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
		userService.update(Dtos.newDto(inMap));
		outVO.setMsg("人员修改成功");
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
		userService.delete(MapUtil.getInt(inMap, "id"));
		outVO.setMsg("用户删除成功");
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
		userService.batchDelete(Dtos.newDto(inMap));
		outVO.setMsg("用户删除成功");
		return outVO;
	}

	/**
	 * 根据用户查询待授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	@PostMapping(value = "listToGrantRoles", produces = "application/json")
	public OutVO listToGrantRoles(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		List<Dto> toGrantList = userService.listToGrantRoles(MapUtil.getInt(inMap, "userId"));
		outVO.setData(toGrantList);
		return outVO;
	}

	/**
	 * 根据用户查询已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	@PostMapping(value = "listGrantedRoles", produces = "application/json")
	public OutVO listGrantedRoles(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		List<Dto> grantedList = userService.listGrantedRoles(MapUtil.getInt(inMap, "userId"));
		outVO.setData(grantedList);
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
		userService.grant(Dtos.newDto(inMap), userVO);
		outVO.setMsg("用户授权成功");
		return outVO;
	}

	/**
	 * 撤销
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "cancel", produces = "application/json")
	public OutVO cancel(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		userService.cancel(Dtos.newDto(inMap));
		outVO.setMsg("用户撤销授权成功");
		return outVO;
	}

	/**
	 * 管理员重置用户密码
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "resetPwd", produces = "application/json")
	public OutVO resetPwd(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		userService.resetPwd(Dtos.newDto(inMap));
		outVO.setMsg("重置密码成功");
		return outVO;
	}

	/**
	 * 查询组织树（返回树数据模型）
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listTree", produces = "application/json")
	public OutVO listTree(@RequestBody Map<String, Object> inMap) {
		OutVO outVO = new OutVO(0);
		List<TreeNodeVO> treeNodeVOs = orgService.listOrgTree(Dtos.newDto(inMap));
		outVO.setData(treeNodeVOs);
		return outVO;
	}
}
