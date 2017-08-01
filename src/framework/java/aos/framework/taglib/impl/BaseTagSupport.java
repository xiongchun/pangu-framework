package aos.framework.taglib.impl;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.AOSTagUtils;

/**
 * <b>标签实现基类(含Ext标签和App标签)</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2014-02-06
 */
public class BaseTagSupport extends XTagSupport {

	private static final long serialVersionUID = 1L;

	private String id;

	private String any;

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		tagDto.put("cxt", getContextpath());
		tagDto.put("id", getMyId());
		tagDto.put("any", AOSTagUtils.removeEndComma(getAny()));
		return tagDto;
	}

	/**
	 * 如果JSP未设置，则自动生成ID
	 */
	public String getMyId() {
		if (AOSUtils.isEmpty(id)) {
			id = "_id_" + AOSTagUtils.getUUID4Tag();
		}
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setAny(String any) {
		this.any = any;
	}

	public String getAny() {
		return any;
	}

}
