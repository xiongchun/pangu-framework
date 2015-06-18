package org.g4studio.core.resource.support;

import org.g4studio.core.resource.ResourceException;
import org.g4studio.core.resource.ResourceHandler;

/**
 * HandlerMapping
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public interface HandlerMapping {

	public ResourceHandler mapping(String pName) throws ResourceException;

}
