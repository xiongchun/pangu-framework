package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.g4studio.core.orm.xibatis.common.beans.ClassInfo;
import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;
import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.StatementScope;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.DomTypeMarker;

/**
 * An automatic result map for simple stuff
 */
public class AutoResultMap extends ResultMap {

	/**
	 * Constructor to pass in the SqlMapExecutorDelegate
	 * Map Key值被强制转换为小写形式 XiongChun 修改
	 * 
	 * @param delegate
	 *            - the delegate
	 */
	public AutoResultMap(SqlMapExecutorDelegate delegate, boolean allowRemapping) {
		super(delegate);
		this.allowRemapping = allowRemapping;
	}

	public synchronized Object[] getResults(StatementScope statementScope, ResultSet rs) throws SQLException {
		if (allowRemapping || getResultMappings() == null) {
			initialize(rs);
		}
		return super.getResults(statementScope, rs);
	}

	public Object setResultObjectValues(StatementScope statementScope, Object resultObject, Object[] values) {
		// synchronization is only needed when remapping is enabled
		if (allowRemapping) {
			synchronized (this) {
				return super.setResultObjectValues(statementScope, resultObject, values);
			}
		}
		return super.setResultObjectValues(statementScope, resultObject, values);
	}

	private void initialize(ResultSet rs) {
		if (getResultClass() == null) {
			throw new SqlMapException("The automatic ResultMap named " + this.getId()
					+ " had a null result class (not allowed).");
		} else if (Map.class.isAssignableFrom(getResultClass())) {
			initializeMapResults(rs);
		} else if (getDelegate().getTypeHandlerFactory().getTypeHandler(getResultClass()) != null) {
			initializePrimitiveResults(rs);
		} else if (DomTypeMarker.class.isAssignableFrom(getResultClass())) {
			initializeXmlResults(rs);
		} else {
			initializeBeanResults(rs);
		}
	}

	private void initializeBeanResults(ResultSet rs) {
		try {
			ClassInfo classInfo = ClassInfo.getInstance(getResultClass());
			String[] propertyNames = classInfo.getWriteablePropertyNames();

			Map propertyMap = new HashMap();
			for (int i = 0; i < propertyNames.length; i++) {
				propertyMap.put(propertyNames[i].toUpperCase(java.util.Locale.ENGLISH), propertyNames[i]);
			}

			List resultMappingList = new ArrayList();
			ResultSetMetaData rsmd = rs.getMetaData();
			for (int i = 0, n = rsmd.getColumnCount(); i < n; i++) {
				String columnName = getColumnIdentifier(rsmd, i + 1).toLowerCase();
				String upperColumnName = columnName.toUpperCase(java.util.Locale.ENGLISH);
				String matchedProp = (String) propertyMap.get(upperColumnName);
				Class type = null;
				if (matchedProp == null) {
					Probe p = ProbeFactory.getProbe(this.getResultClass());
					try {
						type = p.getPropertyTypeForSetter(this.getResultClass(), columnName);
					} catch (Exception e) {
						// TODO - add logging to this class?
					}
				} else {
					type = classInfo.getSetterType(matchedProp);
				}
				if (type != null || matchedProp != null) {
					ResultMapping resultMapping = new ResultMapping();
					resultMapping.setPropertyName((matchedProp != null ? matchedProp : columnName));
					resultMapping.setColumnName(columnName);
					resultMapping.setColumnIndex(i + 1);
					resultMapping.setTypeHandler(getDelegate().getTypeHandlerFactory().getTypeHandler(type)); // map
																												// SQL
																												// to
																												// JDBC
																												// type
					resultMappingList.add(resultMapping);
				}
			}
			setResultMappingList(resultMappingList);

		} catch (SQLException e) {
			throw new RuntimeException("Error automapping columns. Cause: " + e);
		}

	}

	private void initializeXmlResults(ResultSet rs) {
		try {
			List resultMappingList = new ArrayList();
			ResultSetMetaData rsmd = rs.getMetaData();
			for (int i = 0, n = rsmd.getColumnCount(); i < n; i++) {
				String columnName = getColumnIdentifier(rsmd, i + 1).toLowerCase();
				ResultMapping resultMapping = new ResultMapping();
				resultMapping.setPropertyName(columnName);
				resultMapping.setColumnName(columnName);
				resultMapping.setColumnIndex(i + 1);
				resultMapping.setTypeHandler(getDelegate().getTypeHandlerFactory().getTypeHandler(String.class));
				resultMappingList.add(resultMapping);
			}
			setResultMappingList(resultMappingList);
		} catch (SQLException e) {
			throw new RuntimeException("Error automapping columns. Cause: " + e);
		}
	}

	private void initializeMapResults(ResultSet rs) {
		try {
			List resultMappingList = new ArrayList();
			ResultSetMetaData rsmd = rs.getMetaData();
			for (int i = 0, n = rsmd.getColumnCount(); i < n; i++) {
				String columnName = getColumnIdentifier(rsmd, i + 1).toLowerCase();
				ResultMapping resultMapping = new ResultMapping();
				resultMapping.setPropertyName(columnName);
				resultMapping.setColumnName(columnName);
				resultMapping.setColumnIndex(i + 1);
				resultMapping.setTypeHandler(getDelegate().getTypeHandlerFactory().getTypeHandler(Object.class));
				resultMappingList.add(resultMapping);
			}

			setResultMappingList(resultMappingList);

		} catch (SQLException e) {
			throw new RuntimeException("Error automapping columns. Cause: " + e);
		}
	}

	private void initializePrimitiveResults(ResultSet rs) {
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			String columnName = getColumnIdentifier(rsmd, 1).toLowerCase();
			ResultMapping resultMapping = new ResultMapping();
			resultMapping.setPropertyName(columnName);
			resultMapping.setColumnName(columnName);
			resultMapping.setColumnIndex(1);
			resultMapping.setTypeHandler(getDelegate().getTypeHandlerFactory().getTypeHandler(getResultClass()));

			List resultMappingList = new ArrayList();
			resultMappingList.add(resultMapping);

			setResultMappingList(resultMappingList);

		} catch (SQLException e) {
			throw new RuntimeException("Error automapping columns. Cause: " + e);
		}
	}

	private String getColumnIdentifier(ResultSetMetaData rsmd, int i) throws SQLException {
		if (delegate.isUseColumnLabel()) {
			return rsmd.getColumnLabel(i);
		} else {
			return rsmd.getColumnName(i);
		}
	}

}
