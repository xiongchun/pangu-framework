package cn.osworks.aos.web.tag.core.model.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>Render后附加组件的值对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class AfterRenderRegisterVO extends VO{

	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


}
