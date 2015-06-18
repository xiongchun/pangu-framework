package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/**
 * Not really sure what this is...it is not used internally
 */
public class XmlList implements List {

	private List list;

	/**
	 * Build a list from another list
	 * 
	 * @param list
	 *            - a base list
	 */
	public XmlList(List list) {
		this.list = list;
	}

	public int size() {
		return list.size();
	}

	public boolean isEmpty() {
		return list.isEmpty();
	}

	public boolean contains(Object o) {
		return list.contains(o);
	}

	public Iterator iterator() {
		return list.iterator();
	}

	public Object[] toArray() {
		return list.toArray();
	}

	public Object[] toArray(Object a[]) {
		return list.toArray(a);
	}

	public boolean add(Object o) {
		return list.add(o);
	}

	public boolean remove(Object o) {
		return list.remove(o);
	}

	public boolean containsAll(Collection c) {
		return list.containsAll(c);
	}

	public boolean addAll(Collection c) {
		return list.addAll(c);
	}

	public boolean addAll(int index, Collection c) {
		return list.addAll(index, c);
	}

	public boolean removeAll(Collection c) {
		return list.removeAll(c);
	}

	public boolean retainAll(Collection c) {
		return list.retainAll(c);
	}

	public void clear() {
		list.clear();
	}

	public Object get(int index) {
		return list.get(index);
	}

	public Object set(int index, Object element) {
		return list.set(index, element);
	}

	public void add(int index, Object element) {
		list.add(index, element);
	}

	public Object remove(int index) {
		return list.remove(index);
	}

	public int indexOf(Object o) {
		return list.indexOf(o);
	}

	public int lastIndexOf(Object o) {
		return list.lastIndexOf(o);
	}

	public ListIterator listIterator() {
		return list.listIterator();
	}

	public ListIterator listIterator(int index) {
		return list.listIterator(index);
	}

	public List subList(int fromIndex, int toIndex) {
		return list.subList(fromIndex, toIndex);
	}

	public String toString() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0, n = list.size(); i < n; i++) {
			buffer.append(list.get(i));
			buffer.append("\r\n");
		}
		return buffer.toString();
	}

}
