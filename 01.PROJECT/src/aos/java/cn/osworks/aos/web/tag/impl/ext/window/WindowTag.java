package cn.osworks.aos.web.tag.impl.ext.window;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.PanelTagSupport;


/**
 * <b>Window标签实现类</b>
 * 
 * 
 * @author OSWorks-XC
 * @since 6.0
// * @date 2014-03-06
 */
public class WindowTag extends PanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String maximizable;

	private String maximized;

	private String minimizable;

	private String headerPosition;

	private String modal;

	private String draggable;

	private String animateTarget;

	private String opacity; // 窗口透明度 0-1

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.WINDOW);
		resetListenerContainer();
		resetObjInContainerTag();
		if (AOSUtils.isEmpty(getConstrain())) {
			setConstrain(TRUE);
		}
		// 设置closeAction缺省属性
		if (AOSUtils.isEmpty(getCloseAction())) {
			setCloseAction("hide");
		}
		// 设置closeAction缺省属性
		if (AOSUtils.isEmpty(getModal())) {
			setModal(TRUE);
		}

		// 设置窗口透明度
		if (AOSUtils.isNotEmpty(getOpacity())) {
			BigDecimal opacityBigDecimal = new BigDecimal(opacity);
			if (opacityBigDecimal.doubleValue() > 1) {
				throw new AOSException(6, "opacity");
			}
			BigDecimal alpha = opacityBigDecimal.multiply(new BigDecimal(100));
			String opacityString = "opacity: '{0}', filter: 'alpha(opacity={1})'";
			opacityString = AOSUtils.merge(opacityString, getOpacity(), alpha.intValue());
			if (AOSUtils.isEmpty(getStyle())) {
				setStyle(opacityString);
			} else {
				String myStyleString = getStyle() + "," + opacityString;
				setStyle(myStyleString);
			}
		}

		// 不该重设,高度宽度随内部组件而自适应
		// 设置缺省width
		// if (AppUtils.isEmpty(getWidth())) {
		// setWidth("600");
		// }

		// 设置缺省height
		// if (AppUtils.isEmpty(getHeight())) {
		// setHeight("400");
		// }
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		doCenterIt();
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("maximizable", getMaximizable());
		tagDto.put("maximized", getMaximized());
		tagDto.put("minimizable", getMinimizable());
		tagDto.put("headerPosition", getHeaderPosition());
		tagDto.put("modal", getModal());
		tagDto.put("draggable", getDraggable());
		tagDto.put("animateTarget", getAnimateTarget());
		// 覆盖父类属性
		if (!StringUtils.equals(getFrame(), TRUE)) {
			tagDto.put("bodyStyle", AOSTagUtils.getMyStyleOrBodyStye(getBodyStyle()));
		}
		String jspString = mergeFileTemplate(EXTVM + "windowTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		// Items组件处理
		addCur2ParentItems();
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	public void doClear() throws JspException {
		super.doClear();
		setId(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getMaximizable() {
		return maximizable;
	}

	public void setMaximizable(String maximizable) {
		this.maximizable = maximizable;
	}

	public String getMaximized() {
		return maximized;
	}

	public void setMaximized(String maximized) {
		this.maximized = maximized;
	}

	public String getMinimizable() {
		return minimizable;
	}

	public void setMinimizable(String minimizable) {
		this.minimizable = minimizable;
	}

	public String getHeaderPosition() {
		return headerPosition;
	}

	public void setHeaderPosition(String headerPosition) {
		this.headerPosition = headerPosition;
	}

	public String getModal() {
		return modal;
	}

	public void setModal(String modal) {
		this.modal = modal;
	}

	public String getDraggable() {
		return draggable;
	}

	public void setDraggable(String draggable) {
		this.draggable = draggable;
	}

	public String getAnimateTarget() {
		return animateTarget;
	}

	public void setAnimateTarget(String animateTarget) {
		this.animateTarget = animateTarget;
	}

	public String getOpacity() {
		return opacity;
	}

	public void setOpacity(String opacity) {
		this.opacity = opacity;
	}

}
