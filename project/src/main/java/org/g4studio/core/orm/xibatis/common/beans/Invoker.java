package org.g4studio.core.orm.xibatis.common.beans;

import java.lang.reflect.InvocationTargetException;

public interface Invoker {
	String getName();

	Object invoke(Object target, Object[] args) throws IllegalAccessException, InvocationTargetException;
}
