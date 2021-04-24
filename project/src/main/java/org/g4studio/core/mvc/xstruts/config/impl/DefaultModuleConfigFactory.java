package org.g4studio.core.mvc.xstruts.config.impl;

import java.io.Serializable;

import org.g4studio.core.mvc.xstruts.config.ModuleConfig;
import org.g4studio.core.mvc.xstruts.config.ModuleConfigFactory;

/**
 * <p>
 * A factory for creating {@link ModuleConfig} instances.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:45:39 -0400 (Sat, 07 May 2005) $
 * @see ModuleConfig
 * @see ModuleConfigFactory
 */
public class DefaultModuleConfigFactory extends ModuleConfigFactory implements Serializable {
	// --------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Create and return a newly instansiated {@link ModuleConfig}. This method
	 * must be implemented by concrete subclasses.
	 * </p>
	 * 
	 * @param prefix
	 *            Module prefix for Configuration
	 */
	public ModuleConfig createModuleConfig(String prefix) {
		return new ModuleConfigImpl(prefix);
	}
}
