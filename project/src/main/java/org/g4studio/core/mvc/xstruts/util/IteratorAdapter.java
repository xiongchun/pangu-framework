package org.g4studio.core.mvc.xstruts.util;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 * Utility method for converting Enumeration to an Iterator class. If you
 * attempt to remove() an Object from the iterator, it will throw an
 * UnsupportedOperationException. Added for use by TagLib so Enumeration can be
 * supported
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class IteratorAdapter implements Iterator {
	private Enumeration e;

	public IteratorAdapter(Enumeration e) {
		this.e = e;
	}

	public boolean hasNext() {
		return e.hasMoreElements();
	}

	public Object next() {
		if (!e.hasMoreElements()) {
			throw new NoSuchElementException("IteratorAdaptor.next() has no more elements");
		}

		return e.nextElement();
	}

	public void remove() {
		throw new UnsupportedOperationException("Method IteratorAdaptor.remove() not implemented");
	}
}
