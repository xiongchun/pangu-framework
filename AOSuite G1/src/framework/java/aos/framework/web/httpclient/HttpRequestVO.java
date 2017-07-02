package aos.framework.web.httpclient;

import java.io.File;
import java.io.Serializable;
import java.util.Map;

import com.google.common.collect.Maps;

/**
 * HTTP请求值对象
 * 
 * @author xiongchun
 *
 */
public class HttpRequestVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
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
	
	/**
	 * 请求JSON实体数据
	 */
	private String JsonEntityData;
	
	/**
	 * 创建连接超时时间
	 */
	private int connectionTimeout;
	
	/**
	 * 等待响应超时时间
	 */
	private int readTimeout;
	
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
	 * 快捷设置头信息
	 * 
	 * @param type
	 * @param value
	 */
	public void addHeader(String type, String value){
		if (headMap == null) {
			headMap = Maps.newHashMap();
		}
		headMap.put(type, value);
	}
	
	/**
	 * 设置Json实体数据
	 * 
	 * @param jsonEntityData
	 */
	public void setJsonEntityData(String jsonEntityData) {
		//直接提交Json实体
		addHeader("Content-type", "application/json");
		//将参数Map设为null，这种情况下paramMap是无用的
		setParamMap(null);
		JsonEntityData = jsonEntityData;
	}

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

	public String getJsonEntityData() {
		return JsonEntityData;
	}

	public int getReadTimeout() {
		return readTimeout;
	}

	public void setReadTimeout(int readTimeout) {
		this.readTimeout = readTimeout;
	}

	public int getConnectionTimeout() {
		return connectionTimeout;
	}

	public void setConnectionTimeout(int connectionTimeout) {
		this.connectionTimeout = connectionTimeout;
	}
}
