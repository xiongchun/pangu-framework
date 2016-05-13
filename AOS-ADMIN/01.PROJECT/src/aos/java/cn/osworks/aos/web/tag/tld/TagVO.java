package cn.osworks.aos.web.tag.tld;

import java.util.ArrayList;
import java.util.List;

import cn.osworks.aos.core.typewrap.VO;


/**
 * <b>标签VO对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class TagVO extends VO {

	private static final long serialVersionUID = 1L;

	private String name;

	private String description;

	private String bodycontent;

	private String parent;

	private String tagclass;

	private List<TagAttributeVO> tagAttributeVOs = new ArrayList<TagAttributeVO>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBodycontent() {
		return bodycontent;
	}

	public void setBodycontent(String bodycontent) {
		this.bodycontent = bodycontent;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getTagclass() {
		return tagclass;
	}

	public void setTagclass(String tagclass) {
		this.tagclass = tagclass;
	}

	public List<TagAttributeVO> getTagAttributeVOs() {
		return tagAttributeVOs;
	}

	public void setTagAttributeVOs(List<TagAttributeVO> tagAttributeVOs) {
		this.tagAttributeVOs = tagAttributeVOs;
	}

}
