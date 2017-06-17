package aos.framework.taglib.impl.app;

import aos.framework.core.typewrap.Dto;
import aos.framework.taglib.impl.BaseTagSupport;

/**
 * <b>App标签基类</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2014-02-06
 */
public class AppTagSupport extends BaseTagSupport{

	private static final long serialVersionUID = 1L;

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto){
		super.pkgProperties(tagDto);
		return tagDto;
	}
}
