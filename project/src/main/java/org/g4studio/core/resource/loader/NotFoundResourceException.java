package org.g4studio.core.resource.loader;

import org.g4studio.core.resource.ResourceException;

/**
 * NotFoundResourceException
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-3
 */
public class NotFoundResourceException extends ResourceException {

	private static final long serialVersionUID = 1L;

	public NotFoundResourceException() {
		super();
	}

	public NotFoundResourceException(String message, Throwable cause) {
		super(message, cause);
	}

	public NotFoundResourceException(String message) {
		super(message);
	}

	public NotFoundResourceException(Throwable cause) {
		super(cause);
	}

}
