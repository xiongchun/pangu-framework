package org.g4studio.core.xml;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.util.G4Utils;

/**
 * XML常规格式通用处理器<br>
 * 
 * @author XiongChun
 * @since 2009-07-07
 */
public class XmlHelper {
	private static Log log = LogFactory.getLog(XmlHelper.class);

	/**
	 * 解析XML并将其节点元素压入Dto返回(基于节点值形式的XML格式)
	 * 
	 * @param pStrXml
	 *            待解析的XML字符串
	 * @return outDto 返回Dto
	 */
	public static final Dto parseXml2DtoBasedNode(String pStrXml) {
		Dto outDto = new BaseDto();
		String strTitle = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		Document document = null;
		try {
			if (pStrXml.indexOf("<?xml") < 0)
				pStrXml = strTitle + pStrXml;
			document = DocumentHelper.parseText(pStrXml);
		} catch (DocumentException e) {
			log.error("==开发人员请注意:==\n将XML格式的字符串转换为XML DOM对象时发生错误啦!" + "\n详细错误信息如下:");
			e.printStackTrace();
		}
		// 获取根节点
		Element elNode = document.getRootElement();
		// 遍历节点属性值将其压入Dto
		for (Iterator it = elNode.elementIterator(); it.hasNext();) {
			Element leaf = (Element) it.next();
			outDto.put(leaf.getName().toLowerCase(), leaf.getData());
		}
		return outDto;
	}

	/**
	 * 解析XML并将其节点元素压入Dto返回(基于节点值形式的XML格式)
	 * 
	 * @param pStrXml
	 *            待解析的XML字符串
	 * @param pXPath
	 *            节点路径(例如："//paralist/row" 则表示根节点paralist下的row节点的xPath路径)
	 * @return outDto 返回Dto
	 */
	public static final Dto parseXml2DtoBasedNode(String pStrXml, String pXPath) {
		Dto outDto = new BaseDto();
		String strTitle = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		Document document = null;
		try {
			if (pStrXml.indexOf("<?xml") < 0)
				pStrXml = strTitle + pStrXml;
			document = DocumentHelper.parseText(pStrXml);
		} catch (DocumentException e) {
			log.error("==开发人员请注意:==\n将XML格式的字符串转换为XML DOM对象时发生错误啦!" + "\n详细错误信息如下:");
			e.printStackTrace();
		}
		// 获取根节点
		Element elNode = document.getRootElement();
		// 遍历节点属性值将其压入Dto
		for (Iterator it = elNode.elementIterator(); it.hasNext();) {
			Element leaf = (Element) it.next();
			outDto.put(leaf.getName().toLowerCase(), leaf.getData());
		}
		return outDto;
	}

	/**
	 * 解析XML并将其节点元素压入Dto返回(基于属性值形式的XML格式)
	 * 
	 * @param pStrXml
	 *            待解析的XML字符串
	 * @param pXPath
	 *            节点路径(例如："//paralist/row" 则表示根节点paralist下的row节点的xPath路径)
	 * @return outDto 返回Dto
	 */
	public static final Dto parseXml2DtoBasedProperty(String pStrXml, String pXPath) {
		Dto outDto = new BaseDto();
		String strTitle = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		Document document = null;
		try {
			if (pStrXml.indexOf("<?xml") < 0)
				pStrXml = strTitle + pStrXml;
			document = DocumentHelper.parseText(pStrXml);
		} catch (DocumentException e) {
			log.error("==开发人员请注意:==\n将XML格式的字符串转换为XML DOM对象时发生错误啦!" + "\n详细错误信息如下:");
			e.printStackTrace();
		}
		// 根据Xpath搜索节点
		Element elRoot = (Element) document.selectSingleNode(pXPath);
		// 遍历节点属性值将其压入Dto
		for (Iterator it = elRoot.attributeIterator(); it.hasNext();) {
			Attribute attribute = (Attribute) it.next();
			outDto.put(attribute.getName().toLowerCase(), attribute.getData());
		}
		return outDto;
	}

	/**
	 * 将Dto转换为符合XML标准规范格式的字符串(基于节点值形式)
	 * 
	 * @param dto
	 *            传入的Dto对象
	 * @param pRootNodeName
	 *            根结点名
	 * @return string 返回XML格式字符串
	 */
	public static final String parseDto2Xml(Dto pDto, String pRootNodeName) {
		if (G4Utils.isEmpty(pDto)) {
			log.warn("传入的DTO对象为空,请确认");
			return "<root />";
		}
		Document document = DocumentHelper.createDocument();
		// 增加一个根元素节点
		document.addElement(pRootNodeName);
		Element root = document.getRootElement();
		Iterator keyIterator = pDto.keySet().iterator();
		while (keyIterator.hasNext()) {
			String key = (String) keyIterator.next();
			String value = pDto.getAsString(key);
			Element leaf = root.addElement(key);
			leaf.setText(value);
		}
		// 将XML的头声明信息截去
		String outXml = document.asXML().substring(39);
		return outXml;
	}

	/**
	 * 将Dto转换为符合XML标准规范格式的字符串(基于属性值形式)
	 * 
	 * @param pDto
	 *            传入的Dto对象
	 * @param pRootNodeName
	 *            根节点名
	 * @param pFirstNodeName
	 *            一级节点名
	 * @return string 返回XML格式字符串
	 */
	public static final String parseDto2Xml(Dto pDto, String pRootNodeName, String pFirstNodeName) {
		if (G4Utils.isEmpty(pDto)) {
			log.warn("传入的DTO对象为空,请确认");
			return "<root />";
		}
		Document document = DocumentHelper.createDocument();
		// 增加一个根元素节点
		document.addElement(pRootNodeName);
		Element root = document.getRootElement();
		root.addElement(pFirstNodeName);
		Element firstEl = (Element) document.selectSingleNode("/" + pRootNodeName + "/" + pFirstNodeName);
		Iterator keyIterator = pDto.keySet().iterator();
		while (keyIterator.hasNext()) {
			String key = (String) keyIterator.next();
			String value = pDto.getAsString(key);
			firstEl.addAttribute(key, value);
		}
		// 将XML的头声明信息丢去
		String outXml = document.asXML().substring(39);
		return outXml;
	}

	/**
	 * 将List数据类型转换为符合XML格式规范的字符串(基于节点属性值的方式)
	 * 
	 * @param pList
	 *            传入的List数据(List对象可以是Dto、VO、Domain的属性集)
	 * @param pRootNodeName
	 *            根节点名称
	 * @param pFirstNodeName
	 *            行节点名称
	 * @return string 返回XML格式字符串
	 */
	public static final String parseList2Xml(List pList, String pRootNodeName, String pFirstNodeName) {
		Document document = DocumentHelper.createDocument();
		Element elRoot = document.addElement(pRootNodeName);
		for (int i = 0; i < pList.size(); i++) {
			Dto dto = (Dto) pList.get(i);
			Element elRow = elRoot.addElement(pFirstNodeName);
			Iterator it = dto.entrySet().iterator();
			while (it.hasNext()) {
				Dto.Entry entry = (Dto.Entry) it.next();
				elRow.addAttribute((String) entry.getKey(), String.valueOf(entry.getValue()));
			}
		}
		String outXml = document.asXML().substring(39);
		return outXml;
	}

	/**
	 * 将List数据类型转换为符合XML格式规范的字符串(基于节点值的方式)
	 * 
	 * @param pList
	 *            传入的List数据(List对象可以是Dto、VO、Domain的属性集)
	 * @param pRootNodeName
	 *            根节点名称
	 * @param pFirstNodeName
	 *            行节点名称
	 * @return string 返回XML格式字符串
	 */
	public static final String parseList2XmlBasedNode(List pList, String pRootNodeName, String pFirstNodeName) {
		Document document = DocumentHelper.createDocument();
		Element output = document.addElement(pRootNodeName);
		for (int i = 0; i < pList.size(); i++) {
			Dto dto = (Dto) pList.get(i);
			Element elRow = output.addElement(pFirstNodeName);
			Iterator it = dto.entrySet().iterator();
			while (it.hasNext()) {
				Dto.Entry entry = (Dto.Entry) it.next();
				Element leaf = elRow.addElement((String) entry.getKey());
				leaf.setText(String.valueOf(entry.getValue()));
			}
		}
		String outXml = document.asXML().substring(39);
		return outXml;
	}

	/**
	 * 将XML规范的字符串转为List对象(XML基于节点属性值的方式)
	 * 
	 * @param pStrXml
	 *            传入的符合XML格式规范的字符串
	 * @return list 返回List对象
	 */
	public static final List parseXml2List(String pStrXml) {
		List lst = new ArrayList();
		String strTitle = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		Document document = null;
		try {
			if (pStrXml.indexOf("<?xml") < 0)
				pStrXml = strTitle + pStrXml;
			document = DocumentHelper.parseText(pStrXml);
		} catch (DocumentException e) {
			log.error("==开发人员请注意:==\n将XML格式的字符串转换为XML DOM对象时发生错误啦!" + "\n详细错误信息如下:");
			e.printStackTrace();
		}
		// 获取到根节点
		Element elRoot = document.getRootElement();
		// 获取根节点的所有子节点元素
		Iterator elIt = elRoot.elementIterator();
		while (elIt.hasNext()) {
			Element el = (Element) elIt.next();
			Iterator attrIt = el.attributeIterator();
			Dto dto = new BaseDto();
			while (attrIt.hasNext()) {
				Attribute attribute = (Attribute) attrIt.next();
				dto.put(attribute.getName().toLowerCase(), attribute.getData());
			}
			lst.add(dto);
		}
		return lst;
	}
}