package aos.framework.core.utils;

import java.io.InputStream;
import java.util.Iterator;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.impl.HashDto;


/**
 * <b>XML配置参数读取工具类</b>
 * 
 * @author xiongchun
 */
@SuppressWarnings("rawtypes")
public class AOSCfgHandler {

	private static Logger log = LoggerFactory.getLogger(AOSCfgHandler.class);

	private static Dto parameterCacheDto = null;

	static {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (log.isDebugEnabled()) {
			log.debug("解析XML参数配置文件...");
		}
		parameterCacheDto = new HashDto();
		InputStream is = classLoader.getResourceAsStream("aos.cfg.xml");
		Document document = AOSXmlUtils.parse(is);
		Element elRoot = document.getRootElement();
		Iterator elIt = elRoot.elementIterator();
		while (elIt.hasNext()) {
			Element el = (Element) elIt.next();
			Attribute attrKey = el.attribute("key");
			String keyString = attrKey.getText();
			Attribute attrValue = el.attribute("value");
			String valueString = attrValue.getText();
			parameterCacheDto.put(keyString, valueString);
		}
	}

	/**
	 * 获取[applicationParam.xml]配置参数
	 * 
	 * @param pKey
	 * @return
	 */
	public static String getValue(String pKey) {
		String value = parameterCacheDto.getString(pKey);
		return value;
	}

}
