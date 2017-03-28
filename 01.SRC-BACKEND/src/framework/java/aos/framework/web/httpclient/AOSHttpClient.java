package aos.framework.web.httpclient;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MIME;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import aos.framework.core.utils.AOSUtils;

/**
 * Http客户端
 * 
 * @author xiongchun
 *
 */
public class AOSHttpClient {

	/**
	 * 请求类型
	 */
	public static final class REQUEST_METHOD {
		public static final String POST = "POST";
		public static final String GET = "GET";
	}

	/**
	 * 发起请求（兼容Get和Post）
	 * <p>
	 * 兼容参数以K-V表单方式提交和以JSON方式提交(设置"Content-type", "application/json"即可)
	 * 
	 * @return
	 */
	@SuppressWarnings("all")
	public static HttpResponseVO execute(HttpRequestVO httpRequestVO) {
		HttpResponseVO httpResponseVO = new HttpResponseVO();
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			RequestBuilder requestBuilder = null;
			if (StringUtils.equalsIgnoreCase(httpRequestVO.getRequestMethod(), REQUEST_METHOD.POST)) {
				requestBuilder = RequestBuilder.post().setUri(new URI(httpRequestVO.getUri()));
			} else {
				requestBuilder = RequestBuilder.get().setUri(new URI(httpRequestVO.getUri()));
			}
			Map<String, String> paramMap = httpRequestVO.getParamMap();
			if (AOSUtils.isNotEmpty(paramMap)) {
				Iterator<String> keyIterator = (Iterator) paramMap.keySet().iterator();
				while (keyIterator.hasNext()) {
					String key = (String) keyIterator.next();
					String value = paramMap.get(key);
					requestBuilder.addParameter(key, value);
				}
			}

			// 提交JSON
			if (httpRequestVO.getJsonEntityData() != null) {
				HttpEntity entity = new StringEntity(httpRequestVO.getJsonEntityData(), "utf-8");
				requestBuilder.setEntity(entity);
			}

			// 创建连接超时时间(缺省值：3s)
			int connectionTimeout = httpRequestVO.getConnectionTimeout() == 0 ? 3 * 1000 : httpRequestVO.getConnectionTimeout();
			// 等待响应超时时间(缺省值：30s)
			int readTimeout = httpRequestVO.getReadTimeout() == 0 ? 30 * 1000 : httpRequestVO.getReadTimeout();
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(readTimeout)
					.setConnectTimeout(connectionTimeout).build();
			HttpUriRequest httpUriRequest = requestBuilder.setConfig(requestConfig).build();
			Map<String, String> headMap = httpRequestVO.getHeadMap();
			if (AOSUtils.isNotEmpty(headMap)) {
				Iterator<String> headIterator = (Iterator) headMap.keySet().iterator();
				while (headIterator.hasNext()) {
					String key = (String) headIterator.next();
					String value = headMap.get(key);
					httpUriRequest.addHeader(key, value);
				}
			}

			CloseableHttpResponse httpResponse = null;
			try {
				httpResponse = httpclient.execute(httpUriRequest);
				int status = httpResponse.getStatusLine().getStatusCode();
				httpResponseVO.setStatus(String.valueOf(status));
				HttpEntity entity = httpResponse.getEntity();
				String outString = entity != null ? EntityUtils.toString(entity, "utf-8") : null;
				httpResponseVO.setOut(outString);
				if (entity != null) {
					EntityUtils.consume(entity);
				}
			} finally {
				if (httpResponse != null) {
					httpResponse.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			try {
				if (httpclient != null) {
					httpclient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return httpResponseVO;
	}

	/**
	 * 发起文件上传请求
	 * 
	 * @return
	 */
	@SuppressWarnings("all")
	public static HttpResponseVO upload(HttpRequestVO httpRequestVO) {
		HttpResponseVO httpResponseVO = new HttpResponseVO();
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			HttpPost httppost = new HttpPost(httpRequestVO.getUri());
			MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder.create();
			// mode 和 charset组合解决上传文件名中文乱码问题
			multipartEntityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE).setCharset(Charset.forName("UTF-8"));
			ContentType textContent = ContentType.create("text/plain", MIME.UTF8_CHARSET);
			Map<String, String> paramMap = httpRequestVO.getParamMap();
			if (AOSUtils.isNotEmpty(paramMap)) {
				Iterator<String> keyIterator = (Iterator) paramMap.keySet().iterator();
				while (keyIterator.hasNext()) {
					String key = (String) keyIterator.next();
					String value = paramMap.get(key);
					multipartEntityBuilder.addTextBody(key, value, textContent);
				}
			}
			Map<String, File> fileMap = httpRequestVO.getFileMap();
			if (AOSUtils.isNotEmpty(fileMap)) {
				Iterator<String> keyIteratorFileMap = (Iterator) fileMap.keySet().iterator();
				while (keyIteratorFileMap.hasNext()) {
					String key = (String) keyIteratorFileMap.next();
					FileBody fileBody = new FileBody(fileMap.get(key));
					multipartEntityBuilder.addPart(key, fileBody);
				}
			}
			HttpEntity httpEntity = multipartEntityBuilder.build();
			httppost.setEntity(httpEntity);
			CloseableHttpResponse httpResponse = null;
			try {
				httpResponse = httpclient.execute(httppost);
				int status = httpResponse.getStatusLine().getStatusCode();
				httpResponseVO.setStatus(String.valueOf(status));
				HttpEntity entity = httpResponse.getEntity();
				String outString = entity != null ? EntityUtils.toString(entity, "utf-8") : null;
				httpResponseVO.setOut(outString);
				if (entity != null) {
					EntityUtils.consume(entity);
				}
			} finally {
				httpResponse.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return httpResponseVO;
	}
}
