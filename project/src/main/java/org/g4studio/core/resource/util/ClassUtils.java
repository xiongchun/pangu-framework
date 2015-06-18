package org.g4studio.core.resource.util;

import java.io.InputStream;

/**
 * ClassUtils
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-1-10
 */
public class ClassUtils {

	/**
	 * Utility class; cannot be instantiated.
	 */
	private ClassUtils() {
	}

	/**
	 * Return the specified class. Checks the ThreadContext classloader first,
	 * then uses the System classloader. Should replace all calls to
	 * <code>Class.forName( claz )</code> (which only calls the System class
	 * loader) when the class might be in a different classloader (e.g. in a
	 * webapp).
	 * 
	 * @param clazz
	 *            the name of the class to instantiate
	 * @return the requested Class object
	 * @throws ClassNotFoundException
	 */
	public static Class getClass(String clazz) throws ClassNotFoundException {
		/**
		 * Use the Thread context classloader if possible
		 */
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		if (loader != null) {
			try {
				return Class.forName(clazz, true, loader);
			} catch (ClassNotFoundException E) {
				/**
				 * If not found with ThreadContext loader, fall thru to try
				 * System classloader below (works around bug in ant).
				 */
			}
		}
		/**
		 * Thread context classloader isn't working out, so use system loader.
		 */
		return Class.forName(clazz);
	}

	/**
	 * Return a new instance of the given class. Checks the ThreadContext
	 * classloader first, then uses the System classloader. Should replace all
	 * calls to <code>Class.forName( claz ).newInstance()</code> (which only
	 * calls the System class loader) when the class might be in a different
	 * classloader (e.g. in a webapp).
	 * 
	 * @param clazz
	 *            the name of the class to instantiate
	 * @return an instance of the specified class
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static Object getNewInstance(String clazz) throws ClassNotFoundException, IllegalAccessException,
			InstantiationException {
		return getClass(clazz).newInstance();
	}

	/**
	 * Finds a resource with the given name. Checks the Thread Context
	 * classloader, then uses the System classloader. Should replace all calls
	 * to <code>Class.getResourceAsString</code> when the resource might come
	 * from a different classloader. (e.g. a webapp).
	 * 
	 * @param claz
	 *            Class to use when getting the System classloader (used if no
	 *            Thread Context classloader available or fails to get
	 *            resource).
	 * @param name
	 *            name of the resource
	 * @return InputStream for the resource.
	 */
	public static InputStream getResourceAsStream(Class claz, String name) {
		InputStream result = null;

		/**
		 * remove leading slash so path will work with classes in a JAR file
		 */
		while (name.startsWith("/")) {
			name = name.substring(1);
		}

		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

		if (classLoader == null) {
			classLoader = claz.getClassLoader();
			result = classLoader.getResourceAsStream(name);
		} else {
			result = classLoader.getResourceAsStream(name);

			/**
			 * for compatibility with texen / ant tasks, fall back to old method
			 * when resource is not found.
			 */

			if (result == null) {
				classLoader = claz.getClassLoader();
				if (classLoader != null)
					result = classLoader.getResourceAsStream(name);
			}
		}

		return result;

	}

}
