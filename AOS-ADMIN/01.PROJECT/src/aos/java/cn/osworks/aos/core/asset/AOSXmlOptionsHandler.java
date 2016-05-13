package cn.osworks.aos.core.asset;

import java.io.InputStream;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;


/**
 * <b>XML配置参数读取工具类</b>
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("rawtypes")
public class AOSXmlOptionsHandler {

	private static Log log = LogFactory.getLog(AOSXmlOptionsHandler.class);

	private static Dto parameterCacheDto = null;

	static {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (log.isDebugEnabled()) {
			log.debug("解析XML参数配置文件...");
		}
		parameterCacheDto = new HashDto();
		InputStream is = classLoader.getResourceAsStream("misc/aos.options.xml");
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
