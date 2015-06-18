package org.g4studio.core.orm.xibatis.sqlmap.engine.exchange;

import java.util.List;
import java.util.Map;

import org.g4studio.core.orm.xibatis.sqlmap.engine.type.DomTypeMarker;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.TypeHandlerFactory;

/**
 * Factory for DataExchange objects
 */
public class DataExchangeFactory {

	private final DataExchange domDataExchange;
	private final DataExchange listDataExchange;
	private final DataExchange mapDataExchange;
	private final DataExchange primitiveDataExchange;
	private final DataExchange complexDataExchange;

	private TypeHandlerFactory typeHandlerFactory;

	/**
	 * Constructor for the factory
	 * 
	 * @param typeHandlerFactory
	 *            - a type handler factory for the factory
	 */
	public DataExchangeFactory(TypeHandlerFactory typeHandlerFactory) {
		this.typeHandlerFactory = typeHandlerFactory;
		domDataExchange = new DomDataExchange(this);
		listDataExchange = new ListDataExchange(this);
		mapDataExchange = new ComplexDataExchange(this);
		primitiveDataExchange = new PrimitiveDataExchange(this);
		complexDataExchange = new ComplexDataExchange(this);
	}

	/**
	 * Getter for the type handler factory
	 * 
	 * @return - the type handler factory
	 */
	public TypeHandlerFactory getTypeHandlerFactory() {
		return typeHandlerFactory;
	}

	/**
	 * Get a DataExchange object for the passed in Class
	 * 
	 * @param clazz
	 *            - the class to get a DataExchange object for
	 * @return - the DataExchange object
	 */
	public DataExchange getDataExchangeForClass(Class clazz) {
		DataExchange dataExchange = null;
		if (clazz == null) {
			dataExchange = complexDataExchange;
		} else if (DomTypeMarker.class.isAssignableFrom(clazz)) {
			dataExchange = domDataExchange;
		} else if (List.class.isAssignableFrom(clazz)) {
			dataExchange = listDataExchange;
		} else if (Map.class.isAssignableFrom(clazz)) {
			dataExchange = mapDataExchange;
		} else if (typeHandlerFactory.getTypeHandler(clazz) != null) {
			dataExchange = primitiveDataExchange;
		} else {
			dataExchange = new JavaBeanDataExchange(this);
		}
		return dataExchange;
	}

}
