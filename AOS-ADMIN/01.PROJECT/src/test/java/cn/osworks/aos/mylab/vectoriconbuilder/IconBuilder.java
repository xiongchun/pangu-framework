package cn.osworks.aos.mylab.vectoriconbuilder;

import java.io.File;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_iconMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_iconPO;

import com.google.common.collect.Lists;

/**
 * <b>初始化图标库主函数</b>
 * 
 * <p>可用图标大全界面的同步按钮代替
 * 
 * @author OSWorks-XC
 * @date 2014-10-22
 */
public class IconBuilder {

	/**
	 * 入口
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		importFileIcon();
		importVectorIcon();
	}
	
	/**
	 * 导入文件图标
	 */
	private static void importFileIcon(){
		String  path = "F:\\01.系统开发平台\\01.程序\\webapp\\static\\icon";
		Aos_sys_iconMapper aos_sys_iconMapper = (Aos_sys_iconMapper)AOSCxt.getBean("aos_sys_iconMapper");
		File dirFile = new File(path); 
		File[] files = dirFile.listFiles();
		for (File file : files) {
			if (file.isFile()) {
				String fileName = file.getName();
				Aos_sys_iconPO aos_sys_iconPO = new Aos_sys_iconPO();
				aos_sys_iconPO.setId_(AOSId.uuid());
				aos_sys_iconPO.setName_(fileName);
				aos_sys_iconPO.setType_("1");
				Aos_sys_iconPO existPO = aos_sys_iconMapper.selectByKey(fileName);
				if (AOSUtils.isEmpty(existPO)) {
					aos_sys_iconMapper.insert(aos_sys_iconPO);
				}
			}
		}
	}
	
	/**
	 * 导入矢量图标
	 */
	private static void importVectorIcon(){
		List<String> list = Lists.newArrayList();
		try {
			SAXReader reader = new SAXReader();
			InputStream is = IconBuilder.class.getResourceAsStream("awesome.xml");
			Document document = reader.read(is);
			Element elRoot = document.getRootElement();
			@SuppressWarnings("unchecked")
			Iterator<Element> elIt = elRoot.elementIterator();
			while (elIt.hasNext()) {
				Element el_li = (Element) elIt.next();
				String xmlString = el_li.asXML();
				AOSUtils.debug(xmlString);
				xmlString = StringUtils.substringBetween(xmlString, "class=\"fa ", "\"/>");
				list.add(xmlString);
			}
		} catch (Exception e) {
			throw new AOSException("解析XML矢量图标文件出错.", e);
		}	
		
		Aos_sys_iconMapper aos_sys_iconMapper = (Aos_sys_iconMapper)AOSCxt.getBean("aos_sys_iconMapper");
		for (String string : list) {
			Aos_sys_iconPO aos_sys_iconPO = new Aos_sys_iconPO();
			aos_sys_iconPO.setId_(AOSId.uuid());
			aos_sys_iconPO.setName_(string);
			aos_sys_iconPO.setType_(DicCons.VECTOR_ICON);
			Aos_sys_iconPO existPO = aos_sys_iconMapper.selectByKey(string);
			if (AOSUtils.isEmpty(existPO)) {
				aos_sys_iconMapper.insert(aos_sys_iconPO);
			}
		}
	}

}
