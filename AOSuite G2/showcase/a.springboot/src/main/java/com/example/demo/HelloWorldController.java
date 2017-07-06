package com.example.demo;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.mapper.UserMapper;
import com.google.common.collect.Maps;

@RestController
public class HelloWorldController {
	
	private static Logger log = LoggerFactory.getLogger(HelloWorldController.class);
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Value("${spring.redis.host}")
	private String profileActive;
	
	@RequestMapping("/hello/{name}")
	public Map<String,Object> sayHello(@PathVariable String name){
		Map<String,Object> map = Maps.newHashMap();
		map.put("name", "mv");
		map.put("age", 18.01);
		map.put("birthday", new Date());
		map.put("title", "女神");
		log.debug("测试日志输出：" + map.toString());
		//UserEntity userEntity = userMapper.selectByKey(1); 
		//System.out.println(JSON.toJSON(userEntity));
		Map<String, Object> map2 = userMapper.selectMapByKey(1);
		System.out.println(map2);
		Map<String, Object> map3 = sqlSession.selectOne("com.example.demo.mapper.UserMapper.selectMapByKey", 1);
		System.out.println(map3);
		System.out.println(profileActive);
		return map;
	}
	
	@GetMapping("testSession")
	public String testSession(HttpSession httpSession){
		String juid = httpSession.getId();
		Map<String, Object> map = Maps.newHashMap();
		map.put("a", "莫雯");
		map.put("b", "18");
		httpSession.setAttribute("key1", map);
		return juid;
	}
	
	@GetMapping("testSession2")
	public Map<String, Object> testSession2(HttpSession httpSession){
		Map<String, Object> map = (Map<String, Object>)httpSession.getAttribute("key1");
		return map;
	}
}
