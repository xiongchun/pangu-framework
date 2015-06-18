package org.g4studio.core.resource;

import java.io.Serializable;

/**
 * Resource
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-20
 */
public interface Resource extends Serializable {

	/**
	 * 字符集名称, 如:GBK ,UTF-8
	 * 
	 * @return
	 */
	public String getCharset();

	/**
	 * mimetype, 如：text/html
	 * 
	 * @return
	 */
	public String getMimeType();

	/**
	 * 资源uri.可以理解为资源的主键，唯一标识符
	 * 
	 * @return
	 */
	public String getUri();

	/**
	 * 资源的2进制数据,原始数据，未经过处理的
	 * 
	 * @return
	 */
	public byte[] getData();

	/**
	 * 已经过处理的数据
	 * 
	 * @return
	 */
	public byte[] getTreatedData();

	public void setTreatedData(byte[] pData);

	/**
	 * 资源的上次修改时间
	 * 
	 * @return
	 */
	public long getLastModified();

	public String getResourceCode();

	/**
	 * 是否经过gzip压缩
	 * 
	 * @return
	 */
	public boolean isGzip();

	public void setGzip(boolean gzip);
}
