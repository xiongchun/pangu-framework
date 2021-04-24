package org.g4studio.core.orm.xibatis.sqlmap.engine.config;

import java.util.Iterator;

import org.g4studio.core.orm.xibatis.common.beans.ClassInfo;
import org.g4studio.core.orm.xibatis.common.beans.Probe;
import org.g4studio.core.orm.xibatis.common.beans.ProbeFactory;
import org.g4studio.core.orm.xibatis.common.resources.Resources;
import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;
import org.g4studio.core.orm.xibatis.sqlmap.client.extensions.TypeHandlerCallback;
import org.g4studio.core.orm.xibatis.sqlmap.engine.accessplan.AccessPlanFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheModel;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.fifo.FifoCacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.lru.LruCacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.memory.MemoryCacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.datasource.DbcpDataSourceFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.datasource.JndiDataSourceFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.datasource.SimpleDataSourceFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapClientImpl;
import org.g4studio.core.orm.xibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.Discriminator;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.result.ResultObjectFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.statement.MappedStatement;
import org.g4studio.core.orm.xibatis.sqlmap.engine.scope.ErrorContext;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.TransactionManager;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.external.ExternalTransactionConfig;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.jdbc.JdbcTransactionConfig;
import org.g4studio.core.orm.xibatis.sqlmap.engine.transaction.jta.JtaTransactionConfig;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.CustomTypeHandler;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.DomCollectionTypeMarker;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.DomTypeMarker;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.TypeHandler;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.TypeHandlerFactory;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.XmlCollectionTypeMarker;
import org.g4studio.core.orm.xibatis.sqlmap.engine.type.XmlTypeMarker;

public class SqlMapConfiguration {
	private static final Probe PROBE = ProbeFactory.getProbe();
	private ErrorContext errorContext;
	private SqlMapExecutorDelegate delegate;
	private TypeHandlerFactory typeHandlerFactory;
	private SqlMapClientImpl client;
	private Integer defaultStatementTimeout;

	public SqlMapConfiguration() {
		errorContext = new ErrorContext();
		delegate = new SqlMapExecutorDelegate();
		typeHandlerFactory = delegate.getTypeHandlerFactory();
		client = new SqlMapClientImpl(delegate);
		registerDefaultTypeAliases();
	}

	public TypeHandlerFactory getTypeHandlerFactory() {
		return typeHandlerFactory;
	}

	public ErrorContext getErrorContext() {
		return errorContext;
	}

	public SqlMapClientImpl getClient() {
		return client;
	}

	public SqlMapExecutorDelegate getDelegate() {
		return delegate;
	}

	public void setClassInfoCacheEnabled(boolean classInfoCacheEnabled) {
		errorContext.setActivity("setting class info cache enabled/disabled");
		ClassInfo.setCacheEnabled(classInfoCacheEnabled);
	}

	public void setLazyLoadingEnabled(boolean lazyLoadingEnabled) {
		errorContext.setActivity("setting lazy loading enabled/disabled");
		client.getDelegate().setLazyLoadingEnabled(lazyLoadingEnabled);
	}

	public void setStatementCachingEnabled(boolean statementCachingEnabled) {
		errorContext.setActivity("setting statement caching enabled/disabled");
		client.getDelegate().setStatementCacheEnabled(statementCachingEnabled);
	}

	public void setCacheModelsEnabled(boolean cacheModelsEnabled) {
		errorContext.setActivity("setting cache models enabled/disabled");
		client.getDelegate().setCacheModelsEnabled(cacheModelsEnabled);
	}

	public void setEnhancementEnabled(boolean enhancementEnabled) {
		errorContext.setActivity("setting enhancement enabled/disabled");
		try {
			enhancementEnabled = enhancementEnabled
					&& Resources.classForName("net.sf.cglib.proxy.InvocationHandler") != null;
		} catch (ClassNotFoundException e) {
			enhancementEnabled = false;
		}
		client.getDelegate().setEnhancementEnabled(enhancementEnabled);
		AccessPlanFactory.setBytecodeEnhancementEnabled(enhancementEnabled);
	}

	public void setUseColumnLabel(boolean useColumnLabel) {
		client.getDelegate().setUseColumnLabel(useColumnLabel);
	}

	public void setForceMultipleResultSetSupport(boolean forceMultipleResultSetSupport) {
		client.getDelegate().setForceMultipleResultSetSupport(forceMultipleResultSetSupport);
	}

	public void setDefaultStatementTimeout(Integer defaultTimeout) {
		errorContext.setActivity("setting default timeout");
		if (defaultTimeout != null) {
			try {
				defaultStatementTimeout = defaultTimeout;
			} catch (NumberFormatException e) {
				throw new SqlMapException("Specified defaultStatementTimeout is not a valid integer");
			}
		}
	}

	public void setTransactionManager(TransactionManager txManager) {
		delegate.setTxManager(txManager);
	}

	public void setResultObjectFactory(ResultObjectFactory rof) {
		delegate.setResultObjectFactory(rof);
	}

	public void newTypeHandler(Class javaType, String jdbcType, Object callback) {
		try {
			errorContext.setActivity("building a building custom type handler");
			TypeHandlerFactory typeHandlerFactory = client.getDelegate().getTypeHandlerFactory();
			TypeHandler typeHandler;
			if (callback instanceof TypeHandlerCallback) {
				typeHandler = new CustomTypeHandler((TypeHandlerCallback) callback);
			} else if (callback instanceof TypeHandler) {
				typeHandler = (TypeHandler) callback;
			} else {
				throw new RuntimeException("The object '" + callback
						+ "' is not a valid implementation of TypeHandler or TypeHandlerCallback");
			}
			errorContext.setMoreInfo("Check the javaType attribute '" + javaType
					+ "' (must be a classname) or the jdbcType '" + jdbcType + "' (must be a JDBC type name).");
			if (jdbcType != null && jdbcType.length() > 0) {
				typeHandlerFactory.register(javaType, jdbcType, typeHandler);
			} else {
				typeHandlerFactory.register(javaType, typeHandler);
			}
		} catch (Exception e) {
			throw new SqlMapException("Error registering occurred.  Cause: " + e, e);
		}
		errorContext.setMoreInfo(null);
		errorContext.setObjectId(null);
	}

	public CacheModelConfig newCacheModelConfig(String id, CacheController controller, boolean readOnly,
			boolean serialize) {
		return new CacheModelConfig(this, id, controller, readOnly, serialize);
	}

	public ParameterMapConfig newParameterMapConfig(String id, Class parameterClass) {
		return new ParameterMapConfig(this, id, parameterClass);
	}

	public ResultMapConfig newResultMapConfig(String id, Class resultClass, String groupBy, String extended,
			String xmlName) {
		return new ResultMapConfig(this, id, resultClass, groupBy, extended, xmlName);
	}

	public MappedStatementConfig newMappedStatementConfig(String id, MappedStatement statement, SqlSource processor,
			String parameterMapName, Class parameterClass, String resultMapName, String[] additionalResultMapNames,
			Class resultClass, Class[] additionalResultClasses, String resultSetType, Integer fetchSize,
			boolean allowRemapping, Integer timeout, String cacheModelName, String xmlResultName) {
		return new MappedStatementConfig(this, id, statement, processor, parameterMapName, parameterClass,
				resultMapName, additionalResultMapNames, resultClass, additionalResultClasses, cacheModelName,
				resultSetType, fetchSize, allowRemapping, timeout, defaultStatementTimeout, xmlResultName);
	}

	public void finalizeSqlMapConfig() {
		wireUpCacheModels();
		bindResultMapDiscriminators();
	}

	TypeHandler resolveTypeHandler(TypeHandlerFactory typeHandlerFactory, Class clazz, String propertyName,
			Class javaType, String jdbcType) {
		return resolveTypeHandler(typeHandlerFactory, clazz, propertyName, javaType, jdbcType, false);
	}

	TypeHandler resolveTypeHandler(TypeHandlerFactory typeHandlerFactory, Class clazz, String propertyName,
			Class javaType, String jdbcType, boolean useSetterToResolve) {
		TypeHandler handler;
		if (clazz == null) {
			// Unknown
			handler = typeHandlerFactory.getUnkownTypeHandler();
		} else if (DomTypeMarker.class.isAssignableFrom(clazz)) {
			// DOM
			handler = typeHandlerFactory.getTypeHandler(String.class, jdbcType);
		} else if (java.util.Map.class.isAssignableFrom(clazz)) {
			// Map
			if (javaType == null) {
				handler = typeHandlerFactory.getUnkownTypeHandler(); // BUG
																		// 1012591
																		// -
																		// typeHandlerFactory.getTypeHandler(java.lang.Object.class,
																		// jdbcType);
			} else {
				handler = typeHandlerFactory.getTypeHandler(javaType, jdbcType);
			}
		} else if (typeHandlerFactory.getTypeHandler(clazz, jdbcType) != null) {
			// Primitive
			handler = typeHandlerFactory.getTypeHandler(clazz, jdbcType);
		} else {
			// JavaBean
			if (javaType == null) {
				if (useSetterToResolve) {
					Class type = PROBE.getPropertyTypeForSetter(clazz, propertyName);
					handler = typeHandlerFactory.getTypeHandler(type, jdbcType);
				} else {
					Class type = PROBE.getPropertyTypeForGetter(clazz, propertyName);
					handler = typeHandlerFactory.getTypeHandler(type, jdbcType);
				}
			} else {
				handler = typeHandlerFactory.getTypeHandler(javaType, jdbcType);
			}
		}
		return handler;
	}

	private void registerDefaultTypeAliases() {
		// TRANSACTION ALIASES
		typeHandlerFactory.putTypeAlias("JDBC", JdbcTransactionConfig.class.getName());
		typeHandlerFactory.putTypeAlias("JTA", JtaTransactionConfig.class.getName());
		typeHandlerFactory.putTypeAlias("EXTERNAL", ExternalTransactionConfig.class.getName());

		// DATA SOURCE ALIASES
		typeHandlerFactory.putTypeAlias("SIMPLE", SimpleDataSourceFactory.class.getName());
		typeHandlerFactory.putTypeAlias("DBCP", DbcpDataSourceFactory.class.getName());
		typeHandlerFactory.putTypeAlias("JNDI", JndiDataSourceFactory.class.getName());

		// CACHE ALIASES
		typeHandlerFactory.putTypeAlias("FIFO", FifoCacheController.class.getName());
		typeHandlerFactory.putTypeAlias("LRU", LruCacheController.class.getName());
		typeHandlerFactory.putTypeAlias("MEMORY", MemoryCacheController.class.getName());
		// use a string for OSCache to avoid unnecessary loading of properties
		// upon init
		typeHandlerFactory.putTypeAlias("OSCACHE", "org.g4studio.core.orm.xibatis.sqlmap.engine.cache.oscache.OSCacheController");

		// TYPE ALIASEs
		typeHandlerFactory.putTypeAlias("dom", DomTypeMarker.class.getName());
		typeHandlerFactory.putTypeAlias("domCollection", DomCollectionTypeMarker.class.getName());
		typeHandlerFactory.putTypeAlias("xml", XmlTypeMarker.class.getName());
		typeHandlerFactory.putTypeAlias("xmlCollection", XmlCollectionTypeMarker.class.getName());
	}

	private void wireUpCacheModels() {
		// Wire Up Cache Models
		Iterator cacheNames = client.getDelegate().getCacheModelNames();
		while (cacheNames.hasNext()) {
			String cacheName = (String) cacheNames.next();
			CacheModel cacheModel = client.getDelegate().getCacheModel(cacheName);
			Iterator statementNames = cacheModel.getFlushTriggerStatementNames();
			while (statementNames.hasNext()) {
				String statementName = (String) statementNames.next();
				MappedStatement statement = client.getDelegate().getMappedStatement(statementName);
				if (statement != null) {
					statement.addExecuteListener(cacheModel);
				} else {
					throw new RuntimeException("Could not find statement named '" + statementName
							+ "' for use as a flush trigger for the cache model named '" + cacheName + "'.");
				}
			}
		}
	}

	private void bindResultMapDiscriminators() {
		// Bind discriminators
		Iterator names = delegate.getResultMapNames();
		while (names.hasNext()) {
			String name = (String) names.next();
			ResultMap rm = delegate.getResultMap(name);
			Discriminator disc = rm.getDiscriminator();
			if (disc != null) {
				disc.bindSubMaps();
			}
		}
	}

}
