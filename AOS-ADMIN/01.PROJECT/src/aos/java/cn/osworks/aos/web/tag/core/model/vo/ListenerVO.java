package cn.osworks.aos.web.tag.core.model.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>监听器值对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class ListenerVO extends VO {
	
	private static final long serialVersionUID = 1L;
	
	private String fn;
	
	private String delay;
	
	//事件是否只响应一次
	private String single;
	
	private String event;
	
	private String any;

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

	public String getAny() {
		return any;
	}

	public void setAny(String any) {
		this.any = any;
	}

}
