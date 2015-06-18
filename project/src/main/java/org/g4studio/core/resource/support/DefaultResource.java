package org.g4studio.core.resource.support;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.g4studio.core.resource.Resource;

/**
 * DefaultResource
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public class DefaultResource implements Resource {

	private static final long serialVersionUID = 1L;

	/**
	 * 资源mimeType
	 */
	private String mimeType;

	/**
	 * 编码类型
	 */
	private String charset;

	/**
	 * 上次修改时间
	 */
	private long lastModified;

	/**
	 * 资源uri
	 */
	private final String uri;

	/**
	 * 是否经过gzip压缩
	 */
	private boolean gzip = false;

	/**
	 * 资源数据
	 */
	private final byte[] data;
	/**
	 * 已经过处理的数据
	 */
	private byte[] treatedData;// 初始化值为data

	private String resourceCode = null;

	public DefaultResource(String pUri, byte[] pData) {
		this.uri = pUri;
		this.data = pData;
		treatedData = new byte[pData.length];
		for (int i = 0; i < pData.length; i++) {
			treatedData[i] = pData[i];
		}
		resourceCode = null;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	private static MessageDigest md = null;
	static {
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			throw new java.lang.RuntimeException("不支持MD5算法!", e);
		}
	}
	private final static char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
			'E', 'F' };

	private static String bytesToHex(byte[] bytes) {
		StringBuffer sb = new StringBuffer();
		int t;
		for (int i = 0; i < 16; i++) {// 16 == bytes.length;

			t = bytes[i];
			if (t < 0)
				t += 256;
			sb.append(hexDigits[(t >>> 4)]);
			sb.append(hexDigits[(t % 16)]);
		}
		return sb.toString();
	}

	private String getMD5Code(byte[] pDatas) {
		if (pDatas == null) {
			return null;
		}
		byte[] messageDigest = md.digest(pDatas);
		BigInteger number = new BigInteger(1, messageDigest); // prepend a zero
																// to get a
																// "proper" MD5
																// hash value
		StringBuffer sb = new StringBuffer(48);
		sb.append(number.toString(16));
		return sb.toString();
		// return bytesToHex(result);
	}

	public String getResourceCode() {
		if (resourceCode == null) {
			resourceCode = getMD5Code(this.treatedData);
		} else {
			;
		}
		return resourceCode;
	}

	public String getUri() {
		return uri;
	}

	public byte[] getData() {
		return data;
	}

	public long getLastModified() {
		return lastModified;
	}

	public void setLastModified(long pLastModified) {
		lastModified = pLastModified;
	}

	public boolean isGzip() {
		return gzip;
	}

	public void setGzip(boolean gzip) {
		this.gzip = gzip;
	}

	public byte[] getTreatedData() {
		return treatedData;
	}

	public void setTreatedData(byte[] treatedData) {
		this.treatedData = treatedData;
		resourceCode = null;
	}

}
