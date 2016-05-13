package cn.osworks.aos.web.tag.impl.ext.general;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.dao.vo.ElementVO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.web.tag.asset.JSCompressor;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;


/**
 * <b>Ext Body标签实现类</b>
 * 
 * @author OSWorks-XC
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
	private String treePicker;
	private String dataView;
	private String toggle;
	private String elAuth = TRUE; // 是否启用页面元素授权机制

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
		String preventDefault = WebCxt.getCfgOfDB("prevent_rightclick_");
		tagDto.put("preventDefault", preventDefault);
		tagDto.put("statusBar", getStatusBar());
		tagDto.put("pagingMemoryProxy", getPagingMemoryProxy());
		tagDto.put("iframe", getIframe());
		tagDto.put("treePicker", getTreePicker());
		tagDto.put("dataView", getDataView());
		tagDto.put("toggle", getToggle());
		tagDto.put("run_mode_", WebCxt.getCfgOfDB("run_mode_"));
		tagDto.put("msgtarget_", WebCxt.getCfgOfDB("msgtarget_"));
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
		if (elAuth.equalsIgnoreCase(TRUE)) {
			UserInfoVO userInfoVO = WebCxt.getUserInfo(pageContext.getSession());
			if (AOSUtils.isNotEmpty(userInfoVO)) {
				HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
				//一级菜单的主页面所属的页面元素其page_id_同module_id_。
				Dto inDto = Dtos.newDto();
				inDto.put("user_id_", userInfoVO.getId_());
				String module_id_ = request.getParameter(AOSCons.MODULE_ID_KEY);
				String page_id_ = request.getParameter(AOSCons.PAGE_ID_KEY);
				inDto.put("module_id_", module_id_);
				inDto.put("page_id_", page_id_);
				SystemService systemService = (SystemService) AOSCxt.getBean("systemService");
				inDto.put("is_tag_", AOSCons.YES); //和权限预览区分标识
				List<ElementVO> elementVOs = systemService.getElementsOfUser(inDto);
				tagDto.put("elementVOs", elementVOs);
			}
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
		setTreePicker(null);
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

	public String getTreePicker() {
		return treePicker;
	}

	public void setTreePicker(String treePicker) {
		this.treePicker = treePicker;
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

	public String getElAuth() {
		return elAuth;
	}

	public void setElAuth(String elAuth) {
		this.elAuth = elAuth;
	}

}
