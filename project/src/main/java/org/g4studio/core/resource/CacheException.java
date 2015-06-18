package org.g4studio.core.resource;

/**
 * CacheException
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-01
 */
public class CacheException extends ResourceException {

	private static final long serialVersionUID = 1L;

	public CacheException() {
		super("cache异常!");
	}

	public CacheException(String message, Throwable cause) {
		super(message, cause);
	}

	public CacheException(String message) {
		super(message);
	}

	public CacheException(Throwable cause) {
		super(cause);
	}

}
