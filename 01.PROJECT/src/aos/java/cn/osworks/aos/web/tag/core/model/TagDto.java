package cn.osworks.aos.web.tag.core.model;

import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.web.tag.core.resources.TagResources;

/**
 * <b>标签库专用的数据传输对象</b> 
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-06
 */
public class TagDto extends HashDto{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 构造函数
	 * 
	 * <p>这里可以做一些模版文件上使用的公用变量的初始化
	 */
	public TagDto(){
		//VM文件根路径
		put("vmpath", TagResources.BASEPATH_TAG);
	}
}
