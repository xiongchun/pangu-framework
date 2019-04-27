package com.gitee.myclouds.gateway.hystrix;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;

import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * 熔断降级回退处理
 * <p> backend服务实例宕机，调用时间大于hystrix配置的超时时间都会触发熔断
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("fallback")
@Slf4j
public class FallbackController {

	/**
	 * 网关熔断降级的缺省回退逻辑
	 * 
	 * @return
	 */
	@RequestMapping("default")
	public Map<String, String> defaultFallback(){
		Map<String, String> outMap = Maps.newHashMap();
		outMap.put("timestamp", DateUtil.now());
		outMap.put("code", "-100");
		outMap.put("msg", "后台服务故障（网关熔断降级保护）...，请稍后再试。");
		log.info(JSON.toJSONString(outMap));
		return outMap;
	}
}
