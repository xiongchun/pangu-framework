package org.g4studio.core.web.report.fcf;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.g4studio.core.metatype.Dto;

/**
 * FlashReport数据包装类
 * 
 * @author XiongChun
 * @since 2010-10-13
 */
public class FcfDataMapper {
	private static Log log = LogFactory.getLog(FcfDataMapper.class);
	
	/**
	 * 简单图数据包装
	 * @param pList 数据集合
	 * @param configDto 配置对象
	 * @return String
	 */
    public static final String toFcfXmlData(List pList, GraphConfig pGraphConfig){
		Document document = DocumentHelper.createDocument();
		document.setXMLEncoding("GB2312");
		Element elRoot = document.addElement("graph");
		Iterator configIterator = pGraphConfig.entrySet().iterator();
		while (configIterator.hasNext()) {
			Dto.Entry entry = (Dto.Entry)configIterator.next();
			elRoot.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
		}
		for(int i = 0; i < pList.size(); i++){
			Element elRow = elRoot.addElement("set");
			Set set = (Set)pList.get(i);
			Iterator it = set.entrySet().iterator();
			while(it.hasNext()){
				Dto.Entry entry = (Dto.Entry)it.next();
				elRow.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
			}
		}
		String outXml = document.asXML().replaceAll("\n", "");
		return outXml.replace('"', '\'');
    }
    
    /**
     * 将简单图数据对象压入request
	 * @param pList 数据集合
	 * @param configDto 配置对象
     * @param request
     
    public static final void setReportData2Request(List pList, GraphConfig pGraphConfig, HttpServletRequest request){
    	
    }
    */
    
    /**
     * 组合图数据包装
     * @param pList
     * @param configDto
     * @param pCategoriesConfig
     * @return
     */
    public static final String toFcfXmlData(List pList, GraphConfig pGraphConfig, CategoriesConfig pCategoriesConfig){
		Document document = DocumentHelper.createDocument();
		document.setXMLEncoding("GB2312");
		Element elRoot = document.addElement("graph");
		Iterator configIterator = pGraphConfig.entrySet().iterator();
		while (configIterator.hasNext()) {
			Dto.Entry entry = (Dto.Entry)configIterator.next();
			elRoot.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
		}
		Element elcategories = elRoot.addElement("categories");
		Iterator categoriesIterator = pCategoriesConfig.entrySet().iterator();
		while (categoriesIterator.hasNext()) {
			Dto.Entry entry = (Dto.Entry)categoriesIterator.next();
			elcategories.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
		}
		for (int k = 0; k < pCategoriesConfig.getCategories().size(); k++) {
			Element elcategorie = elcategories.addElement("category");
			Categorie categorie = (Categorie)pCategoriesConfig.getCategories().get(k);
			Iterator categorieIterator = categorie.entrySet().iterator();
			while(categorieIterator.hasNext()){
				Dto.Entry entry = (Dto.Entry)categorieIterator.next();
				elcategorie.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
			}
		}
		for(int i = 0; i < pList.size(); i++){
			Element elRow = elRoot.addElement("dataset");
			DataSet ds = (DataSet)pList.get(i);
			Iterator it = ds.entrySet().iterator();
			while(it.hasNext()){
				Dto.Entry entry = (Dto.Entry)it.next();
				elRow.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
			}
			for (int j = 0; j < ds.getData().size(); j++) {
				Element elSet = elRow.addElement("set");
				Set set = (Set)ds.getData().get(j);
				Iterator setIterator = set.entrySet().iterator();
				while(setIterator.hasNext()){
					Dto.Entry entry = (Dto.Entry)setIterator.next();
					elSet.addAttribute((String)entry.getKey(), String.valueOf(entry.getValue()));
				}
			}
		}
		String outXml = document.asXML().replaceAll("\n", "");
		return outXml.replace('"', '\'');
    }
}
