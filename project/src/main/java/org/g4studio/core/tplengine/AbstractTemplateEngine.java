package org.g4studio.core.tplengine;

import java.io.StringWriter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.util.G4Constants;

/**
 * 模板引擎抽象基类
 * @author XiongChun
 * @since 2009-07-28
 * @see TemplateEngine
 */
public abstract class AbstractTemplateEngine implements TemplateEngine {
	
	private Log log = LogFactory.getLog(AbstractTemplateEngine.class);
	
	/**
	 * 驱动模板
	 * @param pTemplate 模板对象
	 * @param pDto 合并参数集合(将模板中所需变量全部压入Dto)
	 * @return writer引擎驱动后的StringWriter对象
	 */
	public StringWriter mergeTemplate(DefaultTemplate pTemplate, Dto dto) {
		StringWriter writer = null;
		if(pTemplate instanceof StringTemplate){
			writer = mergeStringTemplate(pTemplate, dto);
		}else if(pTemplate instanceof FileTemplate){
			writer = mergeFileTemplate(pTemplate, dto);
		}else{
			throw new IllegalArgumentException(G4Constants.Exception_Head + "不支持的模板" );
		}
		return writer;
	}
	
	/**
	 * 驱动字符串模板
	 * @param pTemplate 模板对象
	 * @return 返回StringWriter对象
	 * @param pDto 合并参数集合(将模板中所需变量全部压入Dto)
	 * @throws Exception 
	 */
	protected abstract StringWriter mergeStringTemplate(DefaultTemplate pTemplate, Dto pDto);
	
	/**
	 * 驱动文件模板
	 * @param pTemplate 模板对象
	 * @param pDto 合并参数集合(将模板中所需变量全部压入Dto)
	 * @return 返回StringWriter对象
	 * @throws Exception 
	 */
	protected abstract StringWriter mergeFileTemplate(DefaultTemplate pTemplate, Dto pDto);

}
