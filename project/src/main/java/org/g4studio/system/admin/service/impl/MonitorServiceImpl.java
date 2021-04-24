package org.g4studio.system.admin.service.impl;

import org.g4studio.common.service.impl.BaseServiceImpl;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.system.admin.service.MonitorService;
import org.g4studio.system.common.dao.vo.UserInfoVo;
import org.g4studio.system.common.util.idgenerator.IDHelper;

/**
 * 系统监控业务接口
 * 
 * @author OSWorks-XC
 * @since 2010-09-13
 */
public class MonitorServiceImpl extends BaseServiceImpl implements MonitorService {

	/**
	 * 保存一个HTTP会话
	 * 
	 * @param userInfo
	 */
	public void saveHttpSession(UserInfoVo userInfo) {
		g4Dao.insert("Monitor.saveHttpSession", userInfo);
	}

	/**
	 * 删除一个托管的会话连接
	 * 
	 * @param pSessionID
	 */
	public void deleteHttpSession(Dto dto) {
		g4Dao.delete("Monitor.deleteHttpSession", dto);
	}

	/**
	 * 创建一个事件
	 * 
	 * @param inDto
	 */
	public void saveEvent(Dto dto) {
		String eventid = IDHelper.getEventID();
		dto.put("eventid", eventid);
		g4Dao.insert("Monitor.saveEvent", dto);
	}

	/**
	 * 删除事件
	 * 
	 * @param inDto
	 */
	public Dto deleteEvent(Dto inDto) {
		if (inDto.getAsString("type").equalsIgnoreCase("reset")) {
			g4Dao.delete("Monitor.deleteEvent");
		} else {
			String[] checked = inDto.getAsString("strChecked").split(",");
			Dto dto = new BaseDto();
			for (int i = 0; i < checked.length; i++) {
				dto.put("eventid", checked[i]);
				g4Dao.delete("Monitor.deleteEvent", dto);
			}
		}
		return null;
	}

	/**
	 * 删除SpringBean监控记录
	 * 
	 * @param inDto
	 */
	public Dto deleteMonitorData(Dto inDto) {
		if (inDto.getAsString("type").equalsIgnoreCase("reset")) {
			g4Dao.delete("Monitor.deleteExceptionRecord");
		} else {
			String[] checked = inDto.getAsString("strChecked").split(",");
			Dto dto = new BaseDto();
			for (int i = 0; i < checked.length; i++) {
				dto.put("exceptionid", checked[i]);
				g4Dao.delete("Monitor.deleteExceptionRecord", dto);
			}
		}
		return null;
	}
	
	/**
	 * 删除JDBC监控记录
	 * 
	 * @param inDto
	 */
	public Dto deleteJDBCMonitorData(Dto inDto) {
		if (inDto.getAsString("type").equalsIgnoreCase("reset")) {
			g4Dao.delete("Monitor.deleteJdbcMonitorData");
		} else {
			String[] checked = inDto.getAsString("strChecked").split(",");
			Dto dto = new BaseDto();
			for (int i = 0; i < checked.length; i++) {
				dto.put("monitorid", checked[i]);
				g4Dao.delete("Monitor.deleteJdbcMonitorData", dto);
			}
		}
		return null;
	}

}
