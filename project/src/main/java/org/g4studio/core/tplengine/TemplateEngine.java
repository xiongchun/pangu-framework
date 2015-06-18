package org.g4studio.core.tplengine;

import java.io.StringWriter;

import org.g4studio.core.metatype.Dto;

/**
 * 模板引擎接口
 * @author XiongChun
 * @since 2009-07-26
 */
public interface TemplateEngine {
	/**
	 * 驱动模板
	 * @param pTemplate 模板对象
	 * @param pDto 合并参数集合(将模板中所需变量全部压入Dto)
	 * @return 引擎驱动后的StringWriter对象
	 */
	public StringWriter mergeTemplate(DefaultTemplate pTemplate, Dto pDto);
	
}
