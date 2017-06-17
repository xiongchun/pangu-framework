package aos.framework.taglib.core.model.vo;

import aos.framework.core.typewrap.VO;

/**
 * <b>Item子组件的值对象</b>
 * 
 * @author xiongchun
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
