package org.g4studio.core.mvc.xstruts.util;

/**
 * Factory for <code>PropertyMessageResources</code> instances. The
 * configuration paramter for such instances is the base Java package name of
 * the resources entries from which our keys and values will be loaded.
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class PropertyMessageResourcesFactory extends MessageResourcesFactory {
	// --------------------------------------------------------- Public Methods

	/**
	 * Create and return a newly instansiated <code>MessageResources</code>.
	 * This method must be implemented by concrete subclasses.
	 * 
	 * @param config
	 *            Configuration parameter(s) for the requested bundle
	 */
	public MessageResources createResources(String config) {
		return new PropertyMessageResources(this, config, this.returnNull);
	}
}
