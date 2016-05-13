package cn.osworks.aos.system.modules.service.log;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.system.dao.mapper.Aos_log_sessionMapper;
import cn.osworks.aos.system.dao.po.Aos_log_sessionPO;

/**
 * <b>日志服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class LogService {

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_log_sessionMapper aos_log_sessionMapper;

	/**
	 * 获取当前容器会话集合
	 * 
	 * @param qDto
	 */
	public List<Aos_log_sessionPO> listSessions(Dto qDto) {
		qDto.setOrder("create_time_ desc");
		List<Aos_log_sessionPO> outList = sqlDao.list("Log.listSessionsPage", qDto);
		return outList;
	}

	/**
	 * 保存会话日志对象
	 * 
	 * @param aos_log_sessionPO
	 */
	public void saveSessionLog(Aos_log_sessionPO aos_log_sessionPO) {
		if (AOSUtils.isEmpty(aos_log_sessionMapper.selectByKey(aos_log_sessionPO.getId_()))) {
			aos_log_sessionPO.setCreate_time_(AOSUtils.getDateTime());
			aos_log_sessionPO.setOwner_(AOSUtils.getHostName() + ":" + aos_log_sessionPO.getOwner_());
			if (!StringUtils.equals(AOSCons.JDBC_EXECUTE_ONLYREAD, AOSXmlOptionsHandler.getValue("jdbc_execute"))) {
				aos_log_sessionMapper.insert(aos_log_sessionPO);
			}
		}
	}

	/**
	 * 删除会话日志对象
	 * 
	 * @param sessionID
	 */
	public void deleteSessionLog(String sessionId) {
		if (!StringUtils.equals(AOSCons.JDBC_EXECUTE_ONLYREAD, AOSXmlOptionsHandler.getValue("jdbc_execute"))) {
			aos_log_sessionMapper.deleteByKey(sessionId);
		}
	}

	/**
	 * 批量重置会话日志
	 * 
	 * @param sessionID
	 */
	public void deleteSessionLogs(Dto inDto) {
		if (!StringUtils.equals(AOSCons.JDBC_EXECUTE_ONLYREAD, AOSXmlOptionsHandler.getValue("jdbc_execute"))) {
			sqlDao.delete("Log.deleteSessionLogs",inDto);
		}
	}
}
