package org.g4studio.core.mvc.xstruts.mock;

import java.util.Enumeration;
import java.util.Iterator;

/**
 * <p>
 * General purpose <code>Enumeration</code> wrapper around an
 * <code>Iterator</code> specified to our controller.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class MockEnumeration implements Enumeration {
	protected Iterator iterator;

	public MockEnumeration(Iterator iterator) {
		this.iterator = iterator;
	}

	public boolean hasMoreElements() {
		return (iterator.hasNext());
	}

	public Object nextElement() {
		return (iterator.next());
	}
}
