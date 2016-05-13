package cn.osworks.aos.demo.modules.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

/**
 * Http+Json接口
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "esb/http")
public class HttpController {
	
	/**
	 * 测试
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping(value = "post")
	public void post(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InputStream inputStream = request.getInputStream();
		 StringBuilder json = new StringBuilder();   
		 BufferedReader in = new BufferedReader(new InputStreamReader(inputStream,"UTF-8")); 
		    String inputLine = null; 
		    while ( (inputLine = in.readLine()) != null){ 
		      json.append(inputLine); 
		    } 
		    in.close();
		    System.out.println(json);
		Dto inDto = Dtos.newDto(request); 
		inDto.println();
		Dto outDto = Dtos.newOutDto();
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 测试
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "get")
	public void get(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request); 
		inDto.println();
		Dto outDto = Dtos.newOutDto();
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
}
