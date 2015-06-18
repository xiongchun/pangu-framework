package org.g4studio.core.id;

/**
 * CreatePrefixException
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see IDException
 */
public class CreatePrefixException extends IDException {

	private static final long serialVersionUID = 1L;

	public CreatePrefixException() {
		super();
	}

	public CreatePrefixException(String message, Throwable cause) {
		super(message, cause);
	}

	public CreatePrefixException(String message) {
		super(message);
	}

	public CreatePrefixException(Throwable cause) {
		super(cause);
	}
}
