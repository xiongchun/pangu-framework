package org.g4studio.core.resource.support;

/**
 * MappingException
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public class ResourceConfig {

	private boolean cache;
	private String charset;

	private String mimeType;

	private String loaderName;
	private String oldPrefix;
	private String newPrefix;

	private String[] handlerNames;

	public ResourceConfig(String pLoaderName, String[] pHandlerNames) {
		this.loaderName = pLoaderName;
		this.handlerNames = pHandlerNames;
	}

	public ResourceConfig(String pLoaderName, String[] pHandlerNames, String pCharset, String pMimetype,
			String pOldPrefix, String pNewPrefix) {
		this.loaderName = pLoaderName;
		this.handlerNames = pHandlerNames;
		this.charset = pCharset;
		this.mimeType = pMimetype;
		this.oldPrefix = pOldPrefix;
		this.newPrefix = pNewPrefix;
	}

	public ResourceConfig(String pLoaderName, String[] pHandlerNames, String pCharset, String pMimetype,
			String pOldPrefix, String pNewPrefix, boolean pCache) {
		this.loaderName = pLoaderName;
		this.handlerNames = pHandlerNames;
		this.charset = pCharset;
		this.mimeType = pMimetype;
		this.oldPrefix = pOldPrefix;
		this.newPrefix = pNewPrefix;
		this.cache = pCache;

	}

	public String getCharset() {
		return charset;
	}

	public String[] getHandlerNames() {
		return handlerNames;
	}

	public String getLoaderName() {
		return loaderName;
	}

	public String getMimeType() {
		return mimeType;
	}

	public boolean isCache() {
		return cache;
	}

	public String getOldPrefix() {
		return oldPrefix;
	}

	public void setOldPrefix(String oldPrefix) {
		this.oldPrefix = oldPrefix;
	}

	public String getNewPrefix() {
		return newPrefix;
	}

	public void setNewPrefix(String newPrefix) {
		this.newPrefix = newPrefix;
	}
}
