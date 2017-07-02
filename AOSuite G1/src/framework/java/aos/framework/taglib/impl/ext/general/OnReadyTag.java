package aos.framework.taglib.impl.ext.general;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import com.google.common.collect.Lists;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.JSCompressor;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.BaseTagSupport;


/**
 * <b>Ext Body标签实现类</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2014-03-06
 */
public class OnReadyTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	// 缺省情况下，扩展组件会根据所引用到的扩展标签自动启用扩展，但也可以通过此属性在没有使用扩展标签的情况下启用扩展组件的资源依赖。
	// 后续标签给此标签实例赋值，在这个标签的开始标签处理方法doStartTag里是获取不到的。所以我将doStartTag做的事放到了doEndTag去做。合并后一起输出。
	private String ux = "";
	public String statusBar;
	private String pagingMemoryProxy;
	private String iframe;
	private String dataView;
	private String toggle;
	private String key; //页面标识，用于界面组件授权使用

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {

	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {

		return EVAL_BODY_BUFFERED;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		// 开始标签逻辑处理
		// 后续标签给此标签实例赋值，在这个标签的开始标签处理方法doStartTag里是获取不到的。所以我将doStartTag做的事放到了doEndTag去做。合并后一起输出。
		doPrepare();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		String preventDefault = AOSCxt.getParam("prevent_rightclick");
		tagDto.put("preventDefault", preventDefault);
		tagDto.put("statusBar", getStatusBar());
		tagDto.put("pagingMemoryProxy", getPagingMemoryProxy());
		tagDto.put("iframe", getIframe());
		tagDto.put("dataView", getDataView());
		tagDto.put("toggle", getToggle());
		tagDto.put("run_mode", AOSCxt.getParam("run_mode"));
		tagDto.put("msgtarget", AOSCxt.getParam("msgtarget"));
		// 标签ux属性可以强制引入依赖
		// 缺省情况下，扩展组件会根据所引用到的扩展标签自动启用扩展，但也可以通过此属性在没有使用扩展标签的情况下启用扩展组件的资源依赖。
		if (AOSUtils.isNotEmpty(ux)) {
			String[] uxs = ux.split(",");
			for (String uxkey : uxs) {
				tagDto.put(uxkey, TRUE);
			}
		}
		String jspStringStart = mergeFileTemplate(EXTVM + "onreadyStartTag.vm", tagDto);

		// 标签体处理
		String bodyContent = getBodyContent().getString();
		// 去除JSP中用以标记脚本的<script>标记，使得在onready标签内部任何地方都可以插入一段脚本
		bodyContent = bodyContent.replace("<script type=\"text/javascript\">", "");
		bodyContent = bodyContent.replace("<script>", "");
		bodyContent = bodyContent.replace("</script>", "");

		// 结束标签逻辑处理
		String jspStringEnd = mergeEndTpl();
		String outString = jspStringStart + bodyContent + jspStringEnd;

		// 压缩|格式化字符串
		// TODO 压缩性能测试
		outString = JSCompressor.compress(outString);
		try {
			pageContext.getOut().write(outString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 合并结束时的模版
	 * 
	 */
	private String mergeEndTpl() {
		Dto tagDto = new TagDto();
		//UI组件授权
		if (AOSUtils.isNotEmpty(getKey())) {
			//TODO 
			tagDto.put("elementVOs", Lists.newArrayList());
		}
		String jspStringEnd = mergeFileTemplate(EXTVM + "onreadyEndTag.vm", tagDto);
		return jspStringEnd;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	private void doClear() throws JspException {
		setUx(null);
		setStatusBar(null);
		setPagingMemoryProxy(null);
		setIframe(null);
		setDataView(null);
		setToggle(null);
		
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getUx() {
		return ux;
	}

	public void setUx(String ux) {
		this.ux = ux;
	}

	public String getPagingMemoryProxy() {
		return pagingMemoryProxy;
	}

	public void setPagingMemoryProxy(String pagingMemoryProxy) {
		this.pagingMemoryProxy = pagingMemoryProxy;
	}

	public String getIframe() {
		return iframe;
	}

	public void setIframe(String iframe) {
		this.iframe = iframe;
	}

	public String getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(String statusBar) {
		this.statusBar = statusBar;
	}

	public String getDataView() {
		return dataView;
	}

	public void setDataView(String dataView) {
		this.dataView = dataView;
	}

	public String getToggle() {
		return toggle;
	}

	public void setToggle(String toggle) {
		this.toggle = toggle;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
