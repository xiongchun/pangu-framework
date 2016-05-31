package cn.osworks.aos.core.asset;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.*;
import org.dom4j.io.SAXReader;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * <b>XML资料格式参考处理类，基于dom4j实现</b>
 *
 * @author OSWorks-XC
 * @date 2009-10-06
 */
@SuppressWarnings("all")
public class AOSXmlUtils {

    private static Log log = LogFactory.getLog(AOSXmlUtils.class);

    private static String errMsg = "XML资料格式转换出错.";

    /**
     * 将InputStream输入流解析为Document对象
     *
     * @param pStrXml
     * @return
     */
    public static Document parse(InputStream inputStreamXml) {
        SAXReader saxReader = new SAXReader();
        Document document = null;
        try {
            document = saxReader.read(inputStreamXml);
        } catch (DocumentException e) {
            throw new AOSException(errMsg, e);
        }
        return document;
    }

    /**
     * 将Xml字符串解析为Document对象
     *
     * @param pStrXml
     * @return
     */
    public static Document parse(String pStrXml) {
        String strTitle = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        Document document = null;
        try {
            if (pStrXml.indexOf("<?xml") < 0)
                pStrXml = strTitle + pStrXml;
            document = DocumentHelper.parseText(pStrXml);
        } catch (DocumentException e) {
            throw new AOSException(errMsg, e);
        }
        return document;
    }

    /**
     * 解析XML并将其节点元素压入Dto返回(基于节点值形式的XML格式)
     *
     * @param pStrXml 待解析的XML字符串
     * @return outDto 返回Dto
     */
    public static final Dto toDtoFromNodeXml(String pStrXml) {
        Dto outDto = new HashDto();
        Document document = parse(pStrXml);
        Element elNode = document.getRootElement();
        for (Iterator it = elNode.elementIterator(); it.hasNext(); ) {
            Element leaf = (Element) it.next();
            outDto.put(leaf.getName().toLowerCase(), leaf.getData());
        }
        return outDto;
    }

    /**
     * 解析XML并将其节点元素压入Dto返回(基于节点值形式的XML格式)
     *
     * @param pStrXml 待解析的XML字符串
     * @param pXPath  节点路径(例如："//paralist/row" 则表示根节点paralist下的row节点的xPath路径)
     * @return outDto 返回Dto
     */
    public static final Dto toDtoFromNodeXml(String pStrXml, String pXPath) {
        Dto outDto = new HashDto();
        Document document = parse(pStrXml);
        Element elNode = (Element) document.selectSingleNode(pXPath);
        for (Iterator it = elNode.elementIterator(); it.hasNext(); ) {
            Element leaf = (Element) it.next();
            outDto.put(leaf.getName().toLowerCase(), leaf.getData());
        }
        return outDto;
    }

    /**
     * 解析XML并将其节点元素压入Dto返回(基于属性值形式的XML格式)
     *
     * @param pStrXml 待解析的XML字符串
     * @param pXPath  节点路径(例如："//paralist/row" 则表示根节点paralist下的row节点的xPath路径)
     * @return outDto 返回Dto
     */
    public static final Dto toDtoFromPropertyXml(String pStrXml, String pXPath) {
        Dto outDto = new HashDto();
        Document document = parse(pStrXml);
        Element elNode = (Element) document.selectSingleNode(pXPath);
        for (Iterator it = elNode.attributeIterator(); it.hasNext(); ) {
            Attribute attribute = (Attribute) it.next();
            outDto.put(attribute.getName().toLowerCase(), attribute.getData());
        }
        return outDto;
    }

    /**
     * 将Dto转换为符合XML标准规范格式的字符串(基于节点值形式)
     *
     * @param dto           传入的Dto对象
     * @param pRootNodeName 根结点名
     * @return string 返回XML格式字符串
     */
    public static final String toNodeXmlFromDto(Dto pDto, String pRootNodeName) {
        if (AOSUtils.isEmpty(pDto)) {
            log.warn("传入的DTO对象为空,请确认");
            return "<root />";
        }
        Document document = DocumentHelper.createDocument();
        document.addElement(pRootNodeName);
        Element root = document.getRootElement();
        Iterator keyIterator = pDto.keySet().iterator();
        while (keyIterator.hasNext()) {
            String key = (String) keyIterator.next();
            String value = pDto.getString(key);
            Element leaf = root.addElement(key);
            leaf.setText(value);
        }
        String outXml = document.asXML().substring(39);
        return outXml;
    }

    /**
     * 将Dto转换为符合XML标准规范格式的字符串(基于属性值形式)
     *
     * @param pDto           传入的Dto对象
     * @param pRootNodeName  根节点名
     * @param pFirstNodeName 一级节点名
     * @return string 返回XML格式字符串
     */
    public static final String toPropertyXmlFromDto(Dto pDto, String pRootNodeName, String pFirstNodeName) {
        if (AOSUtils.isEmpty(pDto)) {
            log.warn("传入的DTO对象为空,请确认");
            return "<root />";
        }
        Document document = DocumentHelper.createDocument();
        document.addElement(pRootNodeName);
        Element root = document.getRootElement();
        root.addElement(pFirstNodeName);
        Element firstEl = (Element) document.selectSingleNode("/" + pRootNodeName + "/" + pFirstNodeName);
        Iterator keyIterator = pDto.keySet().iterator();
        while (keyIterator.hasNext()) {
            String key = (String) keyIterator.next();
            String value = pDto.getString(key);
            firstEl.addAttribute(key, value);
        }
        String outXml = document.asXML().substring(39);
        return outXml;
    }

    /**
     * 将List数据类型转换为符合XML格式规范的字符串(基于节点属性值的方式)
     *
     * @param pList          传入的List数据(List对象可以是Dto、VO、PO的属性集)
     * @param pRootNodeName  根节点名称
     * @param pFirstNodeName 行节点名称
     * @return string 返回XML格式字符串
     */
    public static final String toPropertyXmlFromList(List pList, String pRootNodeName, String pFirstNodeName) {
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
     * @param pList          传入的List数据(List对象可以是Dto、VO、PO的属性集)
     * @param pRootNodeName  根节点名称
     * @param pFirstNodeName 行节点名称
     * @return string 返回XML格式字符串
     */
    public static final String toNodeXmlFromList(List pList, String pRootNodeName, String pFirstNodeName) {
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
     * @param pStrXml 传入的符合XML格式规范的字符串
     * @return list 返回List对象
     */
    public static final List toListFromPropertyXml(String pStrXml) {
        List lst = new ArrayList();
        Document document = parse(pStrXml);
        Element elRoot = document.getRootElement();
        Iterator elIt = elRoot.elementIterator();
        while (elIt.hasNext()) {
            Element el = (Element) elIt.next();
            Iterator attrIt = el.attributeIterator();
            Dto dto = new HashDto();
            while (attrIt.hasNext()) {
                Attribute attribute = (Attribute) attrIt.next();
                dto.put(attribute.getName().toLowerCase(), attribute.getData());
            }
            lst.add(dto);
        }
        return lst;
    }

}
