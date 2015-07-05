package cn.osworks.aos.system.modules.service.bpm;

import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.core.dao.SqlDao;

/**
 * BPM服务
 * 
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class BpmService {

	@Autowired
	private SqlDao sqlDao;

	@Autowired
	private TaskService taskService;

	/**
	 * 签收任务
	 * 
	 * @param task_id_
	 *            任务ID
	 * @param user_id_
	 *            用户ID
	 */
	public void claim(String task_id_, String user_id_) {
		taskService.claim(task_id_, user_id_);
	}

	/**
	 * 反签收任务
	 * 
	 * @param id_
	 *            任务ID
	 * @return
	 */
	public void unclaim(String id_) {
		taskService.unclaim(id_);
		sqlDao.update("Bpm.update_claim_time_when_unclaim", id_);
	}
}
