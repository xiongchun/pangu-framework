package com.osworks.test.testcase;

import java.io.File;
import java.util.Map;

import com.google.common.collect.Maps;

import cn.osworks.aos.web.httpclient.AOSHttpClient;
import cn.osworks.aos.web.httpclient.HttpRequestVO;
import cn.osworks.aos.web.httpclient.HttpResponseVO;

/**
 * HttpClient测试
 * 
 * @author xiongchun
 *
 */
public class HttpClientTest {

	public static void main(String[] args) {
		//doPost();
		//doGet();
		doUpload();
	}
	
	/**
	 * POST请求
	 */
	public static void doPost() {
		Map<String, String> inMap = Maps.newHashMap();
		inMap.put("name_", "熊春");
		inMap.put("age_", "30");
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aos-esb/demo/http/save.jhtml", inMap);
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}
	
	/**
	 * GET请求
	 */
	public static void doGet() {
		Map<String, String> inMap = Maps.newHashMap();
		inMap.put("name_", "熊春");
		inMap.put("age_", "30");
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aos-esb/demo/http/save.jhtml", inMap);
		httpRequestVO.setRequestMethod(AOSHttpClient.REQUEST_METHOD.GET);
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}
	
	/**
	 * 上传文件POST请求
	 */
	public static void doUpload() {
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aos-esb/demo/http/upload.jhtml");
		Map<String, String> inMap = Maps.newHashMap();
		inMap.put("name_", "熊春");
		inMap.put("age_", "30");
		httpRequestVO.setParamMap(inMap);
		Map<String, File> fileMap = Maps.newHashMap();
		fileMap.put("myFile1", new File("c:/测试01.jpg"));
		fileMap.put("myFile2", new File("c:/测试01.jpg"));
		httpRequestVO.setFileMap(fileMap);
		HttpResponseVO httpResponseVO = AOSHttpClient.upload(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}

}
