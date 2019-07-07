package com.gitee.myclouds.system.module.home;

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
 * 首页 服务发布
 * 
 * @author xiongchun
 * 
 */
@RestController
@RequestMapping("admin/system/home")
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	/**
	 * 初始化首页框架
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "init", produces = "application/json")
	public OutVO init(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		outVO.setData(homeService.init(MapUtil.getInt(inMap, "userId")));
		return outVO;
		
	}
	
	/**
	 *  修改当前登录用户密码
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "updatePwd", produces = "application/json")
	public OutVO updatePwd(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		homeService.updatePwd(Dtos.newDto(inMap));
		outVO.setMsg("密码修改成功");
		return outVO; 
	}
	
	/**
	 * 根据类型查询字典分组
	 * <p>页面下拉选择框使用
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "listDict", produces = "application/json")
	public OutVO listDict(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		outVO.setData(homeService.listDictByType(MapUtil.getStr(inMap, "type")));
		return outVO;
	}
}
