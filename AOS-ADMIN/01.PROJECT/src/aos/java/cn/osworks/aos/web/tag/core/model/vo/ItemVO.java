package cn.osworks.aos.web.tag.core.model.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>Item子组件的值对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-06
 */
public class ItemVO extends VO{

	private static final long serialVersionUID = 1L;
	
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
