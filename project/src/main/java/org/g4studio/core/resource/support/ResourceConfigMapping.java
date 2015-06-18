package org.g4studio.core.resource.support;

import org.g4studio.core.resource.ResourceException;

/**
 * ResourceConfigMapping
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public interface ResourceConfigMapping {
	public ResourceConfig mapping(String pUri) throws ResourceException;
}
