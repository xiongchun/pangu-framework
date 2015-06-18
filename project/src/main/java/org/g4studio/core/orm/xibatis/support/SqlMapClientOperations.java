package org.g4studio.core.orm.xibatis.support;

import java.util.List;
import java.util.Map;

import org.g4studio.core.orm.xibatis.common.util.PaginatedList;
import org.g4studio.core.orm.xibatis.sqlmap.client.event.RowHandler;
import org.springframework.dao.DataAccessException;

/**
 * Interface that specifies a basic set of iBATIS SqlMapClient operations,
 * implemented by {@link SqlMapClientTemplate}. Not often used, but a useful
 * option to enhance testability, as it can easily be mocked or stubbed.
 * 
 * <p>
 * Defines SqlMapClientTemplate's convenience methods that mirror methods. Users
 * are strongly encouraged to read the iBATIS javadocs for details on the
 * semantics of those methods.
 * 
 * @author Juergen Hoeller
 * @since 24.02.2004
 * @see SqlMapClientTemplate
 */
public interface SqlMapClientOperations {

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Object queryForObject(String statementName) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Object queryForObject(String statementName, Object parameterObject) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Object queryForObject(String statementName, Object parameterObject, Object resultObject) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	List queryForList(String statementName) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	List queryForList(String statementName, Object parameterObject) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	List queryForList(String statementName, int skipResults, int maxResults) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	List queryForList(String statementName, Object parameterObject, int skipResults, int maxResults)
			throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	void queryWithRowHandler(String statementName, RowHandler rowHandler) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	void queryWithRowHandler(String statementName, Object parameterObject, RowHandler rowHandler)
			throws DataAccessException;

	/**
	 * @deprecated as of iBATIS 2.3.0
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	PaginatedList queryForPaginatedList(String statementName, int pageSize) throws DataAccessException;

	/**
	 * @deprecated as of iBATIS 2.3.0
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	PaginatedList queryForPaginatedList(String statementName, Object parameterObject, int pageSize)
			throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Map queryForMap(String statementName, Object parameterObject, String keyProperty) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Map queryForMap(String statementName, Object parameterObject, String keyProperty, String valueProperty)
			throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Object insert(String statementName) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	Object insert(String statementName, Object parameterObject) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	int update(String statementName) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	int update(String statementName, Object parameterObject) throws DataAccessException;

	/**
	 * Convenience method provided by Spring: execute an update operation with
	 * an automatic check that the update affected the given required number of
	 * rows.
	 * 
	 * @param statementName
	 *            the name of the mapped statement
	 * @param parameterObject
	 *            the parameter object
	 * @param requiredRowsAffected
	 *            the number of rows that the update is required to affect
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	void update(String statementName, Object parameterObject, int requiredRowsAffected) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	int delete(String statementName) throws DataAccessException;

	/**
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	int delete(String statementName, Object parameterObject) throws DataAccessException;

	/**
	 * Convenience method provided by Spring: execute a delete operation with an
	 * automatic check that the delete affected the given required number of
	 * rows.
	 * 
	 * @param statementName
	 *            the name of the mapped statement
	 * @param parameterObject
	 *            the parameter object
	 * @param requiredRowsAffected
	 *            the number of rows that the delete is required to affect
	 * @throws org.springframework.dao.DataAccessException
	 *             in case of errors
	 */
	void delete(String statementName, Object parameterObject, int requiredRowsAffected) throws DataAccessException;

}
