package org.g4studio.core.mvc.xstruts.config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.util.RequestUtils;

/**
 * A factory interface for creating {@link ModuleConfig}s.
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 * @see ModuleConfig
 */
public abstract class ModuleConfigFactory {
	/**
	 * The Java class to be used for <code>ModuleConfigFactory</code> instances.
	 */
	protected static Class clazz = null;

	/**
	 * Commons Logging instance.
	 */
	private static final Log LOG = LogFactory.getLog(ModuleConfigFactory.class);

	/**
	 * The fully qualified class name to be used for
	 * <code>ModuleConfigFactory</code> instances.
	 */
	protected static String factoryClass = "org.g4studio.core.mvc.xstruts.config.impl.DefaultModuleConfigFactory";

	/**
	 * Create and return a newly instansiated {@link ModuleConfig}. This method
	 * must be implemented by concrete subclasses.
	 * 
	 * @param prefix
	 *            Module prefix for Configuration
	 */
	public abstract ModuleConfig createModuleConfig(String prefix);

	// ------------------------------------------------------ Static Properties

	/**
	 * The fully qualified class name that is used for
	 * <code>ModuleConfigFactory</code> instances.
	 * 
	 * @return class name that is used for <code>ModuleConfigFactory</code>
	 *         instances
	 */
	public static String getFactoryClass() {
		return (ModuleConfigFactory.factoryClass);
	}

	/**
	 * Set the fully qualified class name that is used for
	 * <code>ModuleConfigFactory</code> instances.
	 * 
	 * @param factoryClass
	 *            name that is used for <code>ModuleConfigFactory</code>
	 *            instances
	 */
	public static void setFactoryClass(String factoryClass) {
		ModuleConfigFactory.factoryClass = factoryClass;
		ModuleConfigFactory.clazz = null;
	}

	// --------------------------------------------------------- Static Methods

	/**
	 * Create and return a <code>ModuleConfigFactory</code> instance of the
	 * appropriate class, which can be used to create customized
	 * <code>ModuleConfig</code> instances. If no such factory can be created,
	 * return <code>null</code> instead.
	 */
	public static ModuleConfigFactory createFactory() {
		ModuleConfigFactory factory = null;

		try {
			if (clazz == null) {
				clazz = RequestUtils.applicationClass(factoryClass);
			}

			factory = (ModuleConfigFactory) clazz.newInstance();
		} catch (ClassNotFoundException e) {
			LOG.error("ModuleConfigFactory.createFactory()", e);
		} catch (InstantiationException e) {
			LOG.error("ModuleConfigFactory.createFactory()", e);
		} catch (IllegalAccessException e) {
			LOG.error("ModuleConfigFactory.createFactory()", e);
		}

		return factory;
	}
}
