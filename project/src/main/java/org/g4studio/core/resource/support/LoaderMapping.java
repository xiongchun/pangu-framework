package org.g4studio.core.resource.support;

import org.g4studio.core.resource.ResourceException;
import org.g4studio.core.resource.ResourceLoader;

/**
 * LoaderMapping
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public interface LoaderMapping {
	public ResourceLoader mapping(String pName) throws ResourceException;
}
