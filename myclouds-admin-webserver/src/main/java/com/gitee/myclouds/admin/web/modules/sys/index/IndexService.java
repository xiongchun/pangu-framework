package com.gitee.myclouds.admin.web.modules.sys.index;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gitee.myclouds.common.vo.MenuVO;

/**
 * 首页 FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myclouds-admin-server")
public interface IndexService {
	
	/**
	 * 查询用户菜单列表
	 * 
	 * @param inDto
	 * @return
	 */
	@RequestMapping(value = "/index/listMenus",method = RequestMethod.POST)
	List<MenuVO> listMenus(@RequestParam("inDto") Map<String,Object> inDto);
}
