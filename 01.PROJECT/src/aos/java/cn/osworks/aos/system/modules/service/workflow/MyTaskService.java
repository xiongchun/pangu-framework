package cn.osworks.aos.system.modules.service.workflow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;

/**
 * 我的任务服务
 * 
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class MyTaskService {

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private WorkflowService workflowService;
	
	/**
	 * 查询待办任务列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto>listTodoTasks(Dto inDto){
		inDto.put("suspension_state_", Integer.valueOf(DicCons.SUSPENSION_STATE_ACTIVED));
		List<Dto> list = sqlDao.list("MyWorkflow.listTodoTasksPage", inDto);
		return list;
	}
	
	/**
	 * 查询待签收任务列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listClaimTasks(Dto inDto){
		inDto.put("suspension_state_", Integer.valueOf(DicCons.SUSPENSION_STATE_ACTIVED));
		List<Dto> list = sqlDao.list("MyWorkflow.listClaimTasksPage", inDto);
		return list;
	}
	
	/**
	 * 签收任务
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto claimTask(Dto inDto){
		Dto outDto = Dtos.newOutDto();
		workflowService.claim(inDto.getString("id_"), inDto.getUserInfo().getId_());
		outDto.setAppMsg("任务签收成功。");
		return outDto;
	}
	
	/**
	 * 取消签收任务
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto unClaimTask(Dto inDto){
		Dto outDto = Dtos.newOutDto();
		workflowService.unclaim(inDto.getString("id_"));
		outDto.setAppMsg("任务反签收成功。");
		return outDto;
	}
	
	/**
	 * 查询已办任务列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto>listDoneTasks(Dto inDto){
		inDto.put("proctask_status_", DicCons.PROCTASK_STATUS_BJ);
		List<Dto> list = sqlDao.list("History.listTasksPage", inDto);
		return list;
	}
}
