package org.g4studio.core.resource;

/**
 * ResourceLoader
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-20
 */
public interface ResourceLoader {

	/**
	 * 获取资源上次修改时间
	 * 
	 * @param pUri
	 * @return
	 */
	public long getLastModified(String pUri);

	/**
	 * @param pUri
	 *            资源标识符
	 * @return 资源对象
	 * @throws Exception
	 *             装载资源失败
	 */
	public Resource load(final String pUri) throws LoadResoruceException;
}
