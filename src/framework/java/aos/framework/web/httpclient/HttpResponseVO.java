package aos.framework.web.httpclient;

import java.io.Serializable;

/**
 * HTTP请求响应值对象
 * 
 * @author xiongchun
 *
 */
public class HttpResponseVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//HTTP请求状态码
	private String status;
	
	//HTTP返回值
	private String out;
    
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOut() {
		return out;
	}

	public void setOut(String out) {
		this.out = out;
	}
	
	
}
