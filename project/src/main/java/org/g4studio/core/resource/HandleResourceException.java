package org.g4studio.core.resource;

/**
 * HandleResourceException
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-01
 */
public class HandleResourceException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public HandleResourceException() {
		super("处理异常");
	}

	public HandleResourceException(String message, Throwable cause) {
		super(message, cause);
	}

	public HandleResourceException(String message) {
		super(message);
	}

	public HandleResourceException(Throwable cause) {
		super(cause);
	}

}
