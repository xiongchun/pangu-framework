package org.g4studio.core.orm.xibatis.sqlmap.engine.builder.xml;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.g4studio.core.orm.xibatis.common.resources.Resources;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * Offline entity resolver for the iBATIS DTDs
 */
public class SqlMapClasspathEntityResolver implements EntityResolver {

	private static final String SQL_MAP_CONFIG_DTD = "org/g4studio/core/orm/xibatis/sqlmap/engine/builder/xml/sql-map-config-2.dtd";
	private static final String SQL_MAP_DTD = "org/g4studio/core/orm/xibatis/sqlmap/engine/builder/xml/sql-map-2.dtd";

	private static final Map doctypeMap = new HashMap();

	static {
		doctypeMap.put("http://www.ibatis.com/dtd/sql-map-config-2.dtd".toUpperCase(), SQL_MAP_CONFIG_DTD);
		doctypeMap.put("http://ibatis.apache.org/dtd/sql-map-config-2.dtd".toUpperCase(), SQL_MAP_CONFIG_DTD);
		doctypeMap.put("-//iBATIS.com//DTD SQL Map Config 2.0//EN".toUpperCase(), SQL_MAP_CONFIG_DTD);
		doctypeMap.put("-//ibatis.apache.org//DTD SQL Map Config 2.0//EN".toUpperCase(), SQL_MAP_CONFIG_DTD);

		doctypeMap.put("http://www.ibatis.com/dtd/sql-map-2.dtd".toUpperCase(), SQL_MAP_DTD);
		doctypeMap.put("http://ibatis.apache.org/dtd/sql-map-2.dtd".toUpperCase(), SQL_MAP_DTD);
		doctypeMap.put("-//iBATIS.com//DTD SQL Map 2.0//EN".toUpperCase(), SQL_MAP_DTD);
		doctypeMap.put("-//ibatis.apache.org//DTD SQL Map 2.0//EN".toUpperCase(), SQL_MAP_DTD);
	}

	/**
	 * Converts a public DTD into a local one
	 * 
	 * @param publicId
	 *            Unused but required by EntityResolver interface
	 * @param systemId
	 *            The DTD that is being requested
	 * @return The InputSource for the DTD
	 * @throws SAXException
	 *             If anything goes wrong
	 */
	public InputSource resolveEntity(String publicId, String systemId) throws SAXException {

		if (publicId != null)
			publicId = publicId.toUpperCase();
		if (systemId != null)
			systemId = systemId.toUpperCase();

		InputSource source = null;
		try {
			String path = (String) doctypeMap.get(publicId);
			source = getInputSource(path, source);
			if (source == null) {
				path = (String) doctypeMap.get(systemId);
				source = getInputSource(path, source);
			}
		} catch (Exception e) {
			throw new SAXException(e.toString());
		}
		return source;
	}

	private InputSource getInputSource(String path, InputSource source) {
		if (path != null) {
			InputStream in = null;
			try {
				in = Resources.getResourceAsStream(path);
				source = new InputSource(in);
			} catch (IOException e) {
				// ignore, null is ok
			}
		}
		return source;
	}

}
