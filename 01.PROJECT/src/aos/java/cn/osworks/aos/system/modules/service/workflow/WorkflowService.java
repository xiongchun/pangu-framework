package cn.osworks.aos.system.modules.service.workflow;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.dao.SqlDao;

/**
 * 工作流服务
 * 
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class WorkflowService {

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private TaskService taskService;
	@Autowired
	private RepositoryService repositoryService;

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
	@Transactional
	public void unclaim(String id_) {
		taskService.unclaim(id_);
		sqlDao.update("Workflow.update_claim_time_when_unclaim", id_);
	}
	
	
}
