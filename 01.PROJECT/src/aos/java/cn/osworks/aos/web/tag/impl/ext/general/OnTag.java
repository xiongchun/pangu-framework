package cn.osworks.aos.web.tag.impl.ext.general;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.core.model.vo.ListenerVO;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ExtTagSupport;


/**
 * <b>事件绑定标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-08
 */
public class OnTag extends ComponentTagSupport {

	private static final long serialVersionUID = 1L;

	private String fn;

	private String delay;

	// 事件是否只响应一次
	private String single;

	private String event;

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
		doPrepare();
		return SKIP_BODY;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		ExtTagSupport parentTag = (ExtTagSupport) getParent();
		ListenerVO listenerVO = new ListenerVO();
		listenerVO.setFn(getFn());
		listenerVO.setDelay(getDelay());
		listenerVO.setSingle(getSingle());
		listenerVO.setEvent(getEvent());
		listenerVO.setAny(AOSTagUtils.removeEndComma(getAny()));
		parentTag.addListener(listenerVO);
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	private void doClear() throws JspException {

	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getFn() {
		return fn;
	}

	public void setFn(String fn) {
		this.fn = fn;
	}

	public String getDelay() {
		return delay;
	}

	public void setDelay(String delay) {
		this.delay = delay;
	}

	public String getSingle() {
		return single;
	}

	public void setSingle(String single) {
		this.single = single;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

}
