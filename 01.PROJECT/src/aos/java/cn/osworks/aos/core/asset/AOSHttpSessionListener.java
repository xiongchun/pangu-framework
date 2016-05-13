package cn.osworks.aos.core.asset;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.system.modules.service.log.LogService;

/**
 * 会话监听器实现
 * 
 * @author OSWorks-XC
 * @date 2016-10-06
 */
public class AOSHttpSessionListener implements HttpSessionListener {

	private static Log log = LogFactory.getLog(AOSHttpSessionListener.class);

	/**
	 * 会话创建监听
	 * 
	 * 说明：此时的Session状态为无效会话。
	 */
	public void sessionCreated(HttpSessionEvent event) {

	}

	/**
	 * 实现HttpSessionListener接口，完成session销毁事件控制
	 */
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		if (AOSUtils.isEmpty(session)){
			return;
		}
		String sessionId = session.getId();
		session.removeAttribute(AOSCons.USERINFOKEY);
		session.invalidate();
		LogService logService = (LogService)AOSBeanLoader.getSpringBean("logService");
		logService.deleteSessionLog(sessionId);
		if (log.isInfoEnabled()) {
			log.info(AOSCons.CONSOLE_FLAG1 + "销毁了一个Session连接：" + sessionId + "。 " + AOSUtils.getDateTimeStr());
		}
	}

}
