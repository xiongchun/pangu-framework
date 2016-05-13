package cn.osworks.aos.core.exception;

import java.io.InputStream;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;


/**
 * <b>异常信息参数配置加载类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-08-27
 */
@SuppressWarnings("rawtypes")
public class ExceptionInfoUtil {

	private static Log log = LogFactory.getLog(ExceptionInfoUtil.class);

	private static Dto parameterCacheDto = null;

	static {
		try {
			if (log.isDebugEnabled()) {
				log.debug("解析XML异常参数配置文件...");
			}
			parameterCacheDto = new HashDto();
			SAXReader reader = new SAXReader();
			InputStream is = ExceptionInfoUtil.class.getResourceAsStream("exceptionInfo.xml");
			Document document = reader.read(is);
			Element elRoot = document.getRootElement();
			Iterator elIt = elRoot.elementIterator();
			while (elIt.hasNext()) {
				Element el = (Element) elIt.next();
				Attribute attrKey = el.attribute("id");
				String id = attrKey.getText();
				Attribute attrInfo = el.attribute("info");
				String info = attrInfo.getText();
				Attribute attrSuggest = el.attribute("suggest");
				String suggest = attrSuggest.getText();
				ExceptionVO exceptionVO = new ExceptionVO();
				exceptionVO.setId(id);
				exceptionVO.setInfo(info);
				exceptionVO.setSuggest(suggest);
				parameterCacheDto.put(id, exceptionVO);
			}
		} catch (Exception e) {
			throw new AOSException("解析XML异常参数配置文件出错.", e);
		}
	}

	/**
	 * 获取异常配置参数
	 * 
	 * @param pKey
	 * @return
	 */
	public static ExceptionVO getExceptionInfo(String errID) {
		ExceptionVO vo = (ExceptionVO) parameterCacheDto.get(errID);
		return vo;
	}

	public static void main(String[] args) {

	}

}
