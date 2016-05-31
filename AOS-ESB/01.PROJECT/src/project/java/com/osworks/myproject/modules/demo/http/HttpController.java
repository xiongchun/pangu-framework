package com.osworks.myproject.modules.demo.http;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.osworks.myproject.common.dao.po.Demo_accountPO;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

/**
 * 演示模块
 * 
 * @author xiongchun
 *
 */
@Controller
@RequestMapping(value = "demo/http")
public class HttpController {

	@Autowired
	private HttpService httpService;
	
	/**
	 * 数据查询接口
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "listAccounts")
	public void listAccounts(HttpServletRequest request, HttpServletResponse response){
		Dto outDto = Dtos.newOutDto();
		try {
			//Dto inDto = Dtos.newDto(request);
			List<Demo_accountPO> accountPOs = httpService.listAccounts();
			outDto.put("result", accountPOs);
		} catch (Exception e) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("数据查询失败!");
			outDto.setTraceMsg(e.getMessage());
			e.printStackTrace();
		}
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 数据查询接口
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "getAccount")
	public void getAccount(HttpServletRequest request, HttpServletResponse response){
		Dto outDto = Dtos.newOutDto();
		try {
			//Dto inDto = Dtos.newDto(request);
			Dto resultDto  = httpService.getAccount();
			outDto.put("result", resultDto);
		} catch (Exception e) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("数据查询失败!");
			outDto.setTraceMsg(e.getMessage());
			e.printStackTrace();
		}
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 常规文本信息HTTP接口
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "save")
	public void save(HttpServletRequest request, HttpServletResponse response){
		Dto outDto = Dtos.newOutDto();
		try {
			Dto inDto = Dtos.newDto(request);
			outDto = httpService.save(inDto);
		} catch (Exception e) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("数据保存失败!");
			outDto.setTraceMsg(e.getMessage());
			e.printStackTrace();
		}
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 文件上传HTTP接口
	 * 
	 * @param myFile1
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "upload")
	public void upload(
			@RequestParam(value = "myFile1", required = true) MultipartFile myFile1,
			@RequestParam(value = "myFile2", required = false) MultipartFile myFile2, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto outDto = Dtos.newOutDto();
		try {
			Dto inDto = Dtos.newDto(request);
			inDto.put("myFile1", myFile1);
			inDto.put("myFile2", myFile2);
			outDto = httpService.upload(inDto);
			outDto.setAppMsg("文件上传成功!");
		} catch (Exception e) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("文件上传失败");
			outDto.setTraceMsg(e.getMessage());
			e.printStackTrace();
		}
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
}
