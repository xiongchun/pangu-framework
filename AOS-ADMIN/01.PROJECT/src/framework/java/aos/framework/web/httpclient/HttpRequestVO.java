package aos.framework.web.httpclient;

import java.io.File;
import java.io.Serializable;
import java.util.Map;

/**
 * HTTP请求值对象
 * 
 * @author xiongchun
 *
 */
public class HttpRequestVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 构造
	 */
	public HttpRequestVO(){
		setRequestMethod(AOSHttpClient.REQUEST_METHOD.POST);
	}
	
	/**
	 * 构造
	 */
	public HttpRequestVO(String pUrl){
		setUri(pUrl);
		setRequestMethod(AOSHttpClient.REQUEST_METHOD.POST);
	}
	
	/**
	 * 构造
	 * 
	 * @param pUrl
	 * @param pParamMap
	 */
	public HttpRequestVO(String pUrl, Map<String, String> paramMap){
		setUri(pUrl);
		setParamMap(paramMap);
		setRequestMethod(AOSHttpClient.REQUEST_METHOD.POST);
	}
	
	/**
	 * 构造
	 * 
	 * @param pUrl
	 * @param paramMap
	 * @param headMap
	 */
	public HttpRequestVO(String pUrl, Map<String, String> paramMap, Map<String, String> headMap){
		setUri(pUrl);
		setParamMap(paramMap);
		setHeadMap(headMap);
		setRequestMethod(AOSHttpClient.REQUEST_METHOD.POST);
	}
	
	/**
	 * 请求路径地址
	 */
	private String uri;
	
	/**
	 * 请求参数
	 */
	private Map<String, String> paramMap;
	
	/**
	 * 头对象
	 */
	private Map<String, String> headMap;
	
	/**
	 * 请求上传文件参数参数
	 */
	private Map<String, File> fileMap;
	
	/**
	 * 请求类型
	 */
	private String requestMethod;

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public Map<String, String> getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map<String, String> paramMap) {
		this.paramMap = paramMap;
	}

	public String getRequestMethod() {
		return requestMethod;
	}

	public void setRequestMethod(String requestMethod) {
		this.requestMethod = requestMethod;
	}

	public Map<String, File> getFileMap() {
		return fileMap;
	}

	public void setFileMap(Map<String, File> fileMap) {
		this.fileMap = fileMap;
	}

	public Map<String, String> getHeadMap() {
		return headMap;
	}

	public void setHeadMap(Map<String, String> headMap) {
		this.headMap = headMap;
	}
}
