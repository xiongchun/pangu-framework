package org.g4studio.core.mvc.xstruts.action;

import org.g4studio.core.mvc.xstruts.config.ForwardConfig;

public class ActionForward extends ForwardConfig {
	
	/**
	 * <p>
	 * Construct a new instance with default values.
	 * </p>
	 */
	public ActionForward() {
		this(null, false);
	}

	/**
	 * <p>
	 * Construct a new instance with the specified path.
	 * </p>
	 * 
	 * @param path
	 *            Path for this instance
	 */
	public ActionForward(String path) {
		this(path, false);
	}

	/**
	 * <p>
	 * Construct a new instance with the specified <code>path</code> and
	 * <code>redirect</code> flag.
	 * </p>
	 * 
	 * @param path
	 *            Path for this instance
	 * @param redirect
	 *            Redirect flag for this instance
	 */
	public ActionForward(String path, boolean redirect) {
		super();
		setName(null);
		setPath(path);
		setRedirect(redirect);
	}

	/**
	 * <p>
	 * Construct a new instance with the specified <code>name</code>,
	 * <code>path</code> and <code>redirect</code> flag.
	 * </p>
	 * 
	 * @param name
	 *            Name of this instance
	 * @param path
	 *            Path for this instance
	 * @param redirect
	 *            Redirect flag for this instance
	 */
	public ActionForward(String name, String path, boolean redirect) {
		super();
		setName(name);
		setPath(path);
		setRedirect(redirect);
	}

	/**
	 * <p>
	 * Construct a new instance with the specified values.
	 * </p>
	 * 
	 * @param name
	 *            Name of this forward
	 * @param path
	 *            Path to which control should be forwarded or redirected
	 * @param redirect
	 *            Should we do a redirect?
	 * @param module
	 *            Module prefix, if any
	 */
	public ActionForward(String name, String path, boolean redirect, String module) {
		super();
		setName(name);
		setPath(path);
		setRedirect(redirect);
		setModule(module);
	}

	/**
	 * <p>
	 * Construct a new instance based on the values of another ActionForward.
	 * </p>
	 * 
	 * @param copyMe
	 *            An ActionForward instance to copy
	 * @since Struts 1.2.1
	 */
	public ActionForward(ActionForward copyMe) {
		this(copyMe.getName(), copyMe.getPath(), copyMe.getRedirect(), copyMe.getModule());
	}
}
