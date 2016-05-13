package cn.osworks.aos.web.tag.tld;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.core.velocity.VelocityHelper;


/**
 * <b>标签描述文件生成器</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-06
 */
@SuppressWarnings("all")
public class TldBuilder {

	private static Log log = LogFactory.getLog(TldBuilder.class);

	enum BaseTagCons {
		BaseTagSupport, ExtTagSupport, ComponentTagSupport, ContainerTagSupport, PanelTagSupport, FormPanelTagSupport, ButtonTagSupport, FormItemTagSupport
	}

	private static Map<String, TagVO> baseTagMap = new HashMap<String, TagVO>();

	private static Map<String, TagVO> tagMap = new HashMap<String, TagVO>();

	public static void main(String[] args) {
		parseBaseTag();
		parseTag();
		buildTag();
	}

	private static void parseBaseTag() {
		try {
			SAXReader reader = new SAXReader();
			InputStream is = TldBuilder.class.getResourceAsStream(TldResource.EXT_TLD_BASE_XML);
			Document document = reader.read(is);
			Element elRoot = document.getRootElement();
			Iterator<Element> tags = elRoot.elementIterator();
			// Tag循环
			while (tags.hasNext()) {
				TagVO tagVO = new TagVO();
				Element elTag = (Element) tags.next();
				String name = elTag.attribute("name").getText();
				String parent = elTag.attribute("parent").getText();
				tagVO.setName(name);
				tagVO.setParent(parent);
				Iterator<Element> tagattrs = elTag.elementIterator();
				// TagAttribute循环
				List<TagAttributeVO> tagAttributeVOs = new ArrayList<TagAttributeVO>();
				while (tagattrs.hasNext()) {
					TagAttributeVO tagAttributeVO = new TagAttributeVO();
					Element elTagAttribute = (Element) tagattrs.next();
					String attr_name = elTagAttribute.attribute("name").getText();
					String attr_required = elTagAttribute.attribute("required").getText();
					String attr_description = elTagAttribute.element("description").getTextTrim();
					tagAttributeVO.setName(attr_name);
					tagAttributeVO.setRequired(attr_required);
					tagAttributeVO.setDescription(attr_description);
					tagAttributeVOs.add(tagAttributeVO);
				}
				tagVO.setTagAttributeVOs(tagAttributeVOs);
				baseTagMap.put(name, tagVO);
			}
		} catch (Exception e) {
			throw new AOSException("解析标签基类配置文件出错.", e);
		}
		if (log.isDebugEnabled()) {
			log.debug("解析标签基类配置文件成功");
		}
		// 合并标签属性,处理继承关系。
		// 注意：调用顺序不能变.继承关系决定调用关系
		doExtTagSupport();
		doComponentTagSupport();
		doContainerTagSupport();
		doPanelTagSupport();
		doFormPanelTagSupport();
		doButtonTagSupport();
		doFormItemTagSupport();

		if (log.isDebugEnabled()) {
			log.debug("标签基类属性合并成功");
		}
	}

	private static void doExtTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.BaseTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.ExtTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.ExtTagSupport.toString(), curTag);
	}

	private static void doComponentTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.ExtTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.ComponentTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.ComponentTagSupport.toString(), curTag);
	}

	private static void doContainerTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.ComponentTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.ContainerTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.ContainerTagSupport.toString(), curTag);
	}

	private static void doPanelTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.ContainerTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.PanelTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.PanelTagSupport.toString(), curTag);
	}

	private static void doFormPanelTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.PanelTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.FormPanelTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.FormPanelTagSupport.toString(), curTag);
	}

	private static void doButtonTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.ComponentTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.ButtonTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.ButtonTagSupport.toString(), curTag);
	}

	private static void doFormItemTagSupport() {
		TagVO parentTag = (TagVO) baseTagMap.get(BaseTagCons.ComponentTagSupport.toString());
		List<TagAttributeVO> parentAttributrVOs = parentTag.getTagAttributeVOs();
		TagVO curTag = (TagVO) baseTagMap.get(BaseTagCons.FormItemTagSupport.toString());
		List<TagAttributeVO> curAttributrVOs = curTag.getTagAttributeVOs();
		curAttributrVOs.addAll(parentAttributrVOs);
		curTag.setTagAttributeVOs(curAttributrVOs);
		baseTagMap.put(BaseTagCons.FormItemTagSupport.toString(), curTag);
	}

	private static void parseTag() {

		try {
			SAXReader reader = new SAXReader();
			InputStream is = TldBuilder.class.getResourceAsStream(TldResource.EXT_TLD_XML);
			Document document = reader.read(is);
			Element elRoot = document.getRootElement();
			Iterator<Element> tags = elRoot.elementIterator();
			// Tag循环
			while (tags.hasNext()) {
				TagVO tagVO = new TagVO();
				Element elTag = (Element) tags.next();
				String name = elTag.attribute("name").getText();
				String parent = elTag.attribute("parent").getText();
				String bodycontent = elTag.attribute("bodycontent").getText();
				String tagclass = elTag.attribute("tagclass").getText();
				String description = elTag.attribute("description").getText();
				tagVO.setName(name);
				tagVO.setParent(parent);
				tagVO.setBodycontent(bodycontent);
				tagVO.setTagclass(tagclass);
				tagVO.setDescription(description);
				Iterator<Element> tagattrs = elTag.elementIterator();
				// TagAttribute循环
				List<TagAttributeVO> tagAttributeVOs = new ArrayList<TagAttributeVO>();
				while (tagattrs.hasNext()) {
					TagAttributeVO tagAttributeVO = new TagAttributeVO();
					Element elTagAttribute = (Element) tagattrs.next();
					String attr_name = elTagAttribute.attribute("name").getText();
					String attr_required = elTagAttribute.attribute("required").getText();
					Attribute attribute_rewrite = (Attribute) elTagAttribute.attribute("rewrite");
					// 这个属性有的没配置，所以这里需要处理
					String attr_rewrite = null;
					if (attribute_rewrite != null) {
						attr_rewrite = attribute_rewrite.getText();
					}
					String attr_description = elTagAttribute.element("description").getTextTrim();
					tagAttributeVO.setName(attr_name);
					tagAttributeVO.setRequired(attr_required);
					tagAttributeVO.setRewrite(attr_rewrite);
					tagAttributeVO.setDescription(attr_description);
					tagAttributeVOs.add(tagAttributeVO);
				}
				tagVO.setTagAttributeVOs(tagAttributeVOs);

				tagMap.put(name, tagVO);
			}
		} catch (Exception e) {
			throw new AOSException("解析标签配置文件出错.", e);
		}
		if (log.isDebugEnabled()) {
			log.debug("解析标签配置文件成功");
		}

		doTagAttribute();

		if (log.isDebugEnabled()) {
			log.debug("标签属性合并成功");
		}
	}

	/**
	 * 合并标签属性,处理继承关系
	 */
	private static void doTagAttribute() {
		Iterator keyIterator = tagMap.keySet().iterator();
		// 关键点在于子标签覆盖父标签属性
		while (keyIterator.hasNext()) {
			String key = (String) keyIterator.next();
			TagVO tagVO = tagMap.get(key);
			String parent = tagVO.getParent();
			// 如果有继承关系,则做标签合并操作(合并1：父没有子有 合并 2:父有子有删除父)
			/**
			 * 修正bug：父有子有的情况不能将父的删除，否则多个子的时候，后面的子将继承不到被删除的属性。通过构造临时变量。
			 */
			if (AOSUtils.isNotEmpty(parent)) {
				// 父标签属性集合
				List<TagAttributeVO> parentTagAttributeVOs = geTagAttributeVOsByTagName(parent);
				// 子标签属性集合
				List<TagAttributeVO> curAttributeVOs = tagVO.getTagAttributeVOs();
				List<TagAttributeVO> delAttributeVOs = new ArrayList<TagAttributeVO>();
				// 此循环生成父标签中需要被删除的对象集
				for (TagAttributeVO tagAttributeVO : curAttributeVOs) {
					String rewrite = tagAttributeVO.getRewrite();
					if (rewrite != null && rewrite.equals("true")) {
						String name = tagAttributeVO.getName();
						for (TagAttributeVO tagAttributeVO2 : parentTagAttributeVOs) {
							if (name.equalsIgnoreCase(tagAttributeVO2.getName())) {
								delAttributeVOs.add(tagAttributeVO2);
							}
						}
					}
				}
				List<TagAttributeVO> tempParemtAttributeVOs = new ArrayList<TagAttributeVO>();
				tempParemtAttributeVOs.addAll(parentTagAttributeVOs);
				// 此循环剔除父标签属性集合中被子标签覆盖的属性
				for (TagAttributeVO tagAttributeVO : delAttributeVOs) {
					// parentTagAttributeVOs.remove(tagAttributeVO);
					tempParemtAttributeVOs.remove(tagAttributeVO);
				}
				// 父+子标签属性集合(合并+覆盖)
				List<TagAttributeVO> newAttributeVOs = new ArrayList<TagAttributeVO>();
				newAttributeVOs.addAll(tempParemtAttributeVOs);
				newAttributeVOs.addAll(curAttributeVOs);
				// 替换原有子标签属性集合
				tagVO.setTagAttributeVOs(newAttributeVOs);
				// 替换容器中的子标签
				tagMap.put(key, tagVO);
			}
		}

	}

	private static List<TagAttributeVO> geTagAttributeVOsByTagName(String nameString) {
		TagVO tagVO = baseTagMap.get(nameString);
		return tagVO.getTagAttributeVOs();
	}

	private static void buildTag() {
		List<TagVO> tagVOs = new ArrayList<TagVO>();
		Iterator keyIterator = tagMap.keySet().iterator();
		while (keyIterator.hasNext()) {
			String key = (String) keyIterator.next();
			TagVO tagVO = tagMap.get(key);
			tagVOs.add(tagVO);
		}
		Dto vmDto = new HashDto();
		vmDto.put("tagVOs", tagVOs);
		StringWriter writer = VelocityHelper.mergeFileTemplate(TldResource.EXT_TLD_VM, vmDto);
		try {
			String outpathString = System.getProperty("user.dir");
			outpathString = outpathString + "\\webapp\\WEB-INF\\tld\\aos.tld";
			FileOutputStream out = new FileOutputStream(outpathString);
			out.write(writer.toString().getBytes());
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// DEBUG
		for (TagVO tagVO : tagVOs) {
			System.out.println(tagVO.getName() + " <" + tagVO.getTagclass() + ">");
			System.out.println("=========================");
			List<TagAttributeVO> tagAttributeVOs = tagVO.getTagAttributeVOs();
			System.out.println("##属性个数=" + tagAttributeVOs.size());
			for (TagAttributeVO tagAttributeVO : tagAttributeVOs) {
				System.out.println("**" + tagAttributeVO.getName());
			}
		}
		System.out.println("=========================");
		System.out.println(writer.toString());
		if (log.isDebugEnabled()) {
			log.debug("tld文件生成成功");
		}
	}

}
