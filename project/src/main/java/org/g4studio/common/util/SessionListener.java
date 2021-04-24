package org.g4studio.common.util;

import java.util.Hashtable;
import java.util.Iterator;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.dao.Reader;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.MonitorService;
import org.g4studio.system.common.dao.vo.UserInfoVo;

/**
 * Session监听器 完成对Seesion会话资源的实时监控
 * 
 * @author 熊春
 * @since 2010-09-03
 * @see HttpSessionBindingListener
 */
public class SessionListener implements HttpSessionListener {
	
	private static Log log = LogFactory.getLog(SessionListener.class);
	
	// 集合对象，保存session对象的引用
	static Hashtable ht = new Hashtable();

	/**
	 * 实现HttpSessionListener接口，完成session创建事件控制
	 * 说明：此时的Session状态为无效会话，只有用户成功登录系统后才将此Session写入EAHTTPSESSION表作为有效SESSION来管理
	 */
	public void sessionCreated(HttpSessionEvent event) {
		//HttpSession session = arg0.getSession();
		//ht.put(session.getId(), session);
		//log.info("创建了一个Session连接:" + session.getId() + " " + Util.getCurrentTime());
	}

	/**
	 * 实现HttpSessionListener接口，完成session销毁事件控制
	 */
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		if (session == null) return;
		SessionContainer sessionContainer =  (SessionContainer)session.getAttribute("SessionContainer");
		if (sessionContainer == null) return;
		sessionContainer.setUserInfo(null); //配合RequestFilter进行拦截
		sessionContainer.cleanUp();
		MonitorService monitorService = (MonitorService)SpringBeanLoader.getSpringBean("monitorService");
		Dto dto = new BaseDto();
		dto.put("sessionid", session.getId());
		monitorService.deleteHttpSession(dto);
		ht.remove(session.getId());
		log.info("销毁了一个Session连接:" + session.getId() + " " + G4Utils.getCurrentTime());
	}
	
	/**
	 * 增加一个有效Session
	 * @param session
	 */
	static public void addSession(HttpSession session, UserInfoVo userInfo) {
		ht.put(session.getId(), session);
		Reader g4Reader = (Reader)SpringBeanLoader.getSpringBean("g4Reader");
		MonitorService monitorService = (MonitorService)SpringBeanLoader.getSpringBean("monitorService");
		UserInfoVo usInfo = (UserInfoVo)g4Reader.queryForObject("Monitor.queryHttpSessionsByID", session.getId());
		if(G4Utils.isEmpty(usInfo)){
			monitorService.saveHttpSession(userInfo);
		}
	}

	/**
	 * 返回全部session对象集合
	 * @return
	 */
	static public Iterator getSessions() {
		return ht.values().iterator();
	}

	/**
	 * 依据session id返回指定的session对象
	 * @param sessionId
	 * @return
	 */
	static public HttpSession getSessionByID(String sessionId) {
		return (HttpSession) ht.get(sessionId);
	}
}
