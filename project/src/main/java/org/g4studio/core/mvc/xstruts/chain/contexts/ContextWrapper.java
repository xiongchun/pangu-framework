package org.g4studio.core.mvc.xstruts.chain.contexts;

import org.apache.commons.chain.Context;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

/**
 * <p>
 * Provide a base class for any Context Implementation which is primarily
 * intended for use in a subchain.
 * </p>
 * <p>
 * Classes which extend <code>ContextWrapper</code> may implement typesafe
 * property methods which also leave their values in the underlying context.
 * </p>
 */
public class ContextWrapper implements Context {
	private Context base;

	/**
	 * <p>
	 * Instantiate object as a composite around the given Context.
	 * </p>
	 * 
	 * @param context
	 *            Context instance to wrap
	 */
	public ContextWrapper(Context context) {
		this.base = context;
	}

	/**
	 * Provide the underlying Context for this composite.
	 * 
	 * @return The undelrying Context
	 */
	protected Context getBaseContext() {
		return this.base;
	}

	// -------------------------------
	// Map interface methods
	// -------------------------------
	public Set entrySet() {
		return this.base.entrySet();
	}

	public Set keySet() {
		return this.base.keySet();
	}

	public Collection values() {
		return this.base.values();
	}

	public void clear() {
		this.base.clear();
	}

	public void putAll(Map map) {
		// ISSUE: Should we check this call to putAll?
		this.base.putAll(map);
	}

	public Object remove(Object key) {
		return this.base.remove(key);
	}

	public Object put(Object key, Object value) {
		// ISSUE: Should we check this call to put?
		return this.base.put(key, value);
	}

	public Object get(Object key) {
		return this.base.get(key);
	}

	public boolean containsValue(Object o) {
		return this.base.containsValue(o);
	}

	public boolean containsKey(Object o) {
		return this.base.containsKey(o);
	}

	public boolean isEmpty() {
		return this.base.isEmpty();
	}

	public int size() {
		return this.base.size();
	}
}
