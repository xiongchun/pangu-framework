package aos.test.testcase;

import java.io.File;
import java.util.Map;

import com.google.common.collect.Maps;

import aos.framework.web.httpclient.AOSHttpClient;
import aos.framework.web.httpclient.HttpRequestVO;
import aos.framework.web.httpclient.HttpResponseVO;

/**
 * HttpClient测试
 * 
 * @author xiongchun
 *
 */
public class HttpClientTest {

	public static void main(String[] args) {
		//doPost();
		doGet();
		// doUpload();
		//doPost2();
	}

	/**
	 * POST请求 以K-V参数形式提交请求
	 */
	public static void doPost() {
		Map<String, String> inMap = Maps.newHashMap();
		inMap.put("name", "熊春");
		inMap.put("age", "30");
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aosuite/api/creditCard/register",
				inMap);
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		// 响应内容
		httpResponseVO.getOut();
		// Http状态码 (注意和业务状态码区分)
		httpResponseVO.getStatus();
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());

	}

	/**
	 * POST请求 以JSON参数形式提交请求
	 * (接口实现和接口调用是配套的，详见接口实现：api/creditCard/register2.jhtml)
	 */
	public static void doPost2() {
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aosuite/api/creditCard/register2");
		httpRequestVO.setJsonEntityData("{\"mobile_\":\"18616786188\",\"name_\":\"熊春\"}");
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}

	/**
	 * GET请求
	 */
	public static void doGet() {
		Map<String, String> inMap = Maps.newHashMap();
		inMap.put("name", "熊春");
		inMap.put("age", "30");
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aosuite/api/creditCard/info/1000", inMap);
		httpRequestVO.setRequestMethod(AOSHttpClient.REQUEST_METHOD.GET);
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}

	/**
	 * 上传文件POST请求
	 */
	public static void doUpload() {
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/aosuite/demo/http/uploadhtm");
		Map<String, String> inMap = Maps.newHashMap();
		inMap.put("name", "熊春");
		inMap.put("age", "30");
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
