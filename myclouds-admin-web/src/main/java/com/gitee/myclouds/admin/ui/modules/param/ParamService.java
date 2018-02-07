package com.gitee.myclouds.admin.ui.modules.param;

import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 键值参数FeignClient客户端
 * 
 * @author xiongchun
 *
 */
@Service
@FeignClient(value = "myadmin-service")
public interface ParamService {
	
	@RequestMapping(value = "/param/list",method = RequestMethod.POST)
	String getParams(@RequestParam("inMap") Map<String,Object> inMap);
}
