package org.g4studio.core.id;

/**
 * IDException
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see RuntimeException
 */
public class IDException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public IDException() {
		super("ID异常!");
	}

	public IDException(String message, Throwable cause) {
		super(message, cause);
	}

	public IDException(String message) {
		super(message);
	}

	public IDException(Throwable cause) {
		super(cause);
	}

}
