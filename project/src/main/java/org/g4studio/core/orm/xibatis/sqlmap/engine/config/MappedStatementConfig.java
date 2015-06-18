package org.g4studio.core.orm.xibatis.sqlmap.engine.config;

import java.sql.ResultSet;
import java.util.Arrays;
import java.util.List;

import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;
import org.g4studio.core.orm.xibatis.common.resources.Resources;
import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheModel;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapClientImpl;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.InlineParameterMapParser;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.AutoResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.Sql;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.SqlText;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.dynamic.DynamicSql;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.simple.SimpleDynamicSql;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql.stat.StaticSql;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement.CachingStatement;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement.InsertStatement;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement.MappedStatement;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement.SelectKeyStatement;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.ErrorContext;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.TypeHandlerFactory;

public class MappedStatementConfig {
	private static final Probe PROBE = ProbeFactory.getProbe();
	private static final InlineParameterMapParser PARAM_PARSER = new InlineParameterMapParser();
	private ErrorContext errorContext;
	private SqlMapClientImpl client;
	private TypeHandlerFactory typeHandlerFactory;
	private MappedStatement mappedStatement;
	private MappedStatement rootStatement;

	MappedStatementConfig(SqlMapConfiguration config, String id, MappedStatement statement, SqlSource processor,
			String parameterMapName, Class parameterClass, String resultMapName, String[] additionalResultMapNames,
			Class resultClass, Class[] additionalResultClasses, String cacheModelName, String resultSetType,
			Integer fetchSize, boolean allowRemapping, Integer timeout, Integer defaultStatementTimeout,
			String xmlResultName) {
		this.errorContext = config.getErrorContext();
		this.client = config.getClient();
		SqlMapExecutorDelegate delegate = client.getDelegate();
		this.typeHandlerFactory = config.getTypeHandlerFactory();
		errorContext.setActivity("parsing a mapped statement");
		errorContext.setObjectId(id + " statement");
		errorContext.setMoreInfo("Check the result map name.");
		if (resultMapName != null) {
			statement.setResultMap(client.getDelegate().getResultMap(resultMapName));
			if (additionalResultMapNames != null) {
				for (int i = 0; i < additionalResultMapNames.length; i++) {
					statement.addResultMap(client.getDelegate().getResultMap(additionalResultMapNames[i]));
				}
			}
		}
		errorContext.setMoreInfo("Check the parameter map name.");
		if (parameterMapName != null) {
			statement.setParameterMap(client.getDelegate().getParameterMap(parameterMapName));
		}
		statement.setId(id);
		statement.setResource(errorContext.getResource());
		if (resultSetType != null) {
			if ("FORWARD_ONLY".equals(resultSetType)) {
				statement.setResultSetType(new Integer(ResultSet.TYPE_FORWARD_ONLY));
			} else if ("SCROLL_INSENSITIVE".equals(resultSetType)) {
				statement.setResultSetType(new Integer(ResultSet.TYPE_SCROLL_INSENSITIVE));
			} else if ("SCROLL_SENSITIVE".equals(resultSetType)) {
				statement.setResultSetType(new Integer(ResultSet.TYPE_SCROLL_SENSITIVE));
			}
		}
		if (fetchSize != null) {
			statement.setFetchSize(fetchSize);
		}

		// set parameter class either from attribute or from map (make sure to
		// match)
		ParameterMap parameterMap = statement.getParameterMap();
		if (parameterMap == null) {
			statement.setParameterClass(parameterClass);
		} else {
			statement.setParameterClass(parameterMap.getParameterClass());
		}

		// process SQL statement, including inline parameter maps
		errorContext.setMoreInfo("Check the SQL statement.");
		Sql sql = processor.getSql();
		setSqlForStatement(statement, sql);

		// set up either null result map or automatic result mapping
		ResultMap resultMap = (ResultMap) statement.getResultMap();
		if (resultMap == null && resultClass == null) {
			statement.setResultMap(null);
		} else if (resultMap == null) {
			resultMap = buildAutoResultMap(allowRemapping, statement, resultClass, xmlResultName);
			statement.setResultMap(resultMap);
			if (additionalResultClasses != null) {
				for (int i = 0; i < additionalResultClasses.length; i++) {
					statement.addResultMap(buildAutoResultMap(allowRemapping, statement, additionalResultClasses[i],
							xmlResultName));
				}
			}

		}
		statement.setTimeout(defaultStatementTimeout);
		if (timeout != null) {
			try {
				statement.setTimeout(timeout);
			} catch (NumberFormatException e) {
				throw new SqlMapException("Specified timeout value for statement " + statement.getId()
						+ " is not a valid integer");
			}
		}
		errorContext.setMoreInfo(null);
		errorContext.setObjectId(null);
		statement.setSqlMapClient(client);
		if (cacheModelName != null && cacheModelName.length() > 0 && client.getDelegate().isCacheModelsEnabled()) {
			CacheModel cacheModel = client.getDelegate().getCacheModel(cacheModelName);
			mappedStatement = new CachingStatement(statement, cacheModel);
		} else {
			mappedStatement = statement;
		}
		rootStatement = statement;
		delegate.addMappedStatement(mappedStatement);
	}

	public void setSelectKeyStatement(SqlSource processor, String resultClassName, String keyPropName,
			boolean runAfterSQL, String type) {
		if (rootStatement instanceof InsertStatement) {
			InsertStatement insertStatement = ((InsertStatement) rootStatement);
			Class parameterClass = insertStatement.getParameterClass();
			errorContext.setActivity("parsing a select key");
			SelectKeyStatement selectKeyStatement = new SelectKeyStatement();
			resultClassName = typeHandlerFactory.resolveAlias(resultClassName);
			Class resultClass = null;

			// get parameter and result maps
			selectKeyStatement.setSqlMapClient(client);
			selectKeyStatement.setId(insertStatement.getId() + "-SelectKey");
			selectKeyStatement.setResource(errorContext.getResource());
			selectKeyStatement.setKeyProperty(keyPropName);
			selectKeyStatement.setRunAfterSQL(runAfterSQL);
			// process the type (pre or post) attribute
			if (type != null) {
				selectKeyStatement.setRunAfterSQL("post".equals(type));
			}
			try {
				if (resultClassName != null) {
					errorContext.setMoreInfo("Check the select key result class.");
					resultClass = Resources.classForName(resultClassName);
				} else {
					if (keyPropName != null && parameterClass != null) {
						resultClass = PROBE.getPropertyTypeForSetter(parameterClass,
								selectKeyStatement.getKeyProperty());
					}
				}
			} catch (ClassNotFoundException e) {
				throw new SqlMapException("Error.  Could not set result class.  Cause: " + e, e);
			}
			if (resultClass == null) {
				resultClass = Object.class;
			}

			// process SQL statement, including inline parameter maps
			errorContext.setMoreInfo("Check the select key SQL statement.");
			Sql sql = processor.getSql();
			setSqlForStatement(selectKeyStatement, sql);
			ResultMap resultMap;
			resultMap = new AutoResultMap(client.getDelegate(), false);
			resultMap.setId(selectKeyStatement.getId() + "-AutoResultMap");
			resultMap.setResultClass(resultClass);
			resultMap.setResource(selectKeyStatement.getResource());
			selectKeyStatement.setResultMap(resultMap);
			errorContext.setMoreInfo(null);
			insertStatement.setSelectKeyStatement(selectKeyStatement);
		} else {
			throw new SqlMapException("You cant set a select key statement on statement named " + rootStatement.getId()
					+ " because it is not an InsertStatement.");
		}
	}

	private void setSqlForStatement(MappedStatement statement, Sql sql) {
		if (sql instanceof DynamicSql) {
			statement.setSql(sql);
		} else {
			applyInlineParameterMap(statement, sql.getSql(null, null));
		}
	}

	private void applyInlineParameterMap(MappedStatement statement, String sqlStatement) {
		String newSql = sqlStatement;
		errorContext.setActivity("building an inline parameter map");
		ParameterMap parameterMap = statement.getParameterMap();
		errorContext.setMoreInfo("Check the inline parameters.");
		if (parameterMap == null) {
			ParameterMap map;
			map = new ParameterMap(client.getDelegate());
			map.setId(statement.getId() + "-InlineParameterMap");
			map.setParameterClass(statement.getParameterClass());
			map.setResource(statement.getResource());
			statement.setParameterMap(map);
			SqlText sqlText = PARAM_PARSER.parseInlineParameterMap(client.getDelegate().getTypeHandlerFactory(),
					newSql, statement.getParameterClass());
			newSql = sqlText.getText();
			List mappingList = Arrays.asList(sqlText.getParameterMappings());
			map.setParameterMappingList(mappingList);
		}
		Sql sql;
		if (SimpleDynamicSql.isSimpleDynamicSql(newSql)) {
			sql = new SimpleDynamicSql(client.getDelegate(), newSql);
		} else {
			sql = new StaticSql(newSql);
		}
		statement.setSql(sql);

	}

	private ResultMap buildAutoResultMap(boolean allowRemapping, MappedStatement statement, Class firstResultClass,
			String xmlResultName) {
		ResultMap resultMap;
		resultMap = new AutoResultMap(client.getDelegate(), allowRemapping);
		resultMap.setId(statement.getId() + "-AutoResultMap");
		resultMap.setResultClass(firstResultClass);
		resultMap.setXmlName(xmlResultName);
		resultMap.setResource(statement.getResource());
		return resultMap;
	}

	public MappedStatement getMappedStatement() {
		return mappedStatement;
	}
}
