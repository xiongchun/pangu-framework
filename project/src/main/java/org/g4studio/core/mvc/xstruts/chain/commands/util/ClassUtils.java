package org.g4studio.core.mvc.xstruts.chain.commands.util;

/**
 * <p>
 * Utility methods to load application classes and create instances.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-12 13:01:44 -0500 (Sat, 12 Nov 2005) $
 */
public final class ClassUtils {
	// ---------------------------------------------------------- Static Methods

	/**
	 * <p>
	 * Return the <code>Class</code> object for the specified fully qualified
	 * class name, from this web application's class loader.
	 * 
	 * @param className
	 *            Fully qualified class name
	 * @throws ClassNotFoundException
	 *             if the specified class cannot be loaded
	 */
	public static Class getApplicationClass(String className) throws ClassNotFoundException {
		if (className == null) {
			throw new NullPointerException("getApplicationClass called with null className");
		}

		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

		if (classLoader == null) {
			classLoader = ClassUtils.class.getClassLoader();
		}

		return (classLoader.loadClass(className));
	}

	/**
	 * <p>
	 * Return a new instance of the specified fully qualified class name, after
	 * loading the class (if necessary) from this web application's class
	 * loader.
	 * </p>
	 * 
	 * @param className
	 *            Fully qualified class name
	 * @throws ClassNotFoundException
	 *             if the specified class cannot be loaded
	 * @throws IllegalAccessException
	 *             if this class is not concrete
	 * @throws InstantiationException
	 *             if this class has no zero-arguments constructor
	 */
	public static Object getApplicationInstance(String className) throws ClassNotFoundException,
			IllegalAccessException, InstantiationException {
		return (getApplicationClass(className).newInstance());
	}
}
