package org.g4studio.core.resource;

/**
 * LoadResoruceException
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-20
 */
public class LoadResoruceException extends ResourceException {

	private static final long serialVersionUID = 1L;

	public LoadResoruceException() {
		super("导入资源异常");
	}

	public LoadResoruceException(String message, Throwable cause) {
		super(message, cause);
	}

	public LoadResoruceException(String message) {
		super(message);
	}

	public LoadResoruceException(Throwable cause) {
		super(cause);
	}

}
