package cn.osworks.aos.mylab.bpm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.VariableInstanceEntity;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;

import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;


/**
 * BPM API 范例
 * 
 * @author XChun
 * 
 */
@SuppressWarnings("all")
public class BpmTest {

	public static void main(String[] args) {
		// test1();
		deploy();
		// deleteDeployment("2501");
		//startProcessInstanceByKey("myProcessLeave");
		//startProcessInstanceById("myProcessLeave:3:10004");
		//getProcessInstanceVariables("27501");
		//setTaskVariables("77504");
		//getTaskVariables("27506");
		//setTaskCfg("85004");
		//queryTaskTodo();
		//completeTask("97502");
          //setTaskCfg_CandidateUser("107508");
		//claimTask("107508");
	}
	
	/**
	 * 认领承办任务 任务声明受理人和setAssignee类似，但变更受理人会抛出异常 认领的概念
	 */
	private static void claimTask(String taskId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		taskService.claim(taskId, "xiongchun");
	}
	
	/**
	 * 操作任务配置项：设置任务候选人
	 */
	private static void setTaskCfg_CandidateUser(String taskId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		taskService.addCandidateUser(taskId, "xiongchun3");
		taskService.addCandidateUser(taskId, "haimeimei");
		//taskService.addCandidateGroup();
		//taskService.setOwner(taskId, "xiongchun0");
	}
	
    /**
     * 委派
     *
     */
	private static void delegateTask(String taskId)  {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
        //taskService.setOwner(inDto.getString("id_"), "2");
    	taskService.delegateTask(taskId, "1");
    }

    /**
     * 完成代理任务，返回所有人
     */
    public static void resolveTask(String taskId) throws Exception {
    	ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
        taskService.resolveTask(taskId);
    }

	/**
	 * 请假流程发布
	 */
	private static void deploy() {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		RepositoryService repositoryService = engine.getRepositoryService();
		DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();
		deploymentBuilder.name("请假流程_动态赋值"); // 这个值会写入act_deployment表
		deploymentBuilder.category("常用流程_动态赋值"); // 这个值会写入act_deployment表
		// deploymentBuilder.enableDuplicateFiltering(); //同样的模型无修改的话不允许重复部署
		Deployment deployment = deploymentBuilder.addClasspathResource("aos/workflow/test/diagrams/MyProcessLeave.bpmn")
				.deploy();
		System.out.println(deployment);
	}

	/**
	 * 删除发布
	 * 
	 * @param deploymentID
	 */
	private static void deleteDeployment(String deploymentID) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		RepositoryService repositoryService = engine.getRepositoryService();
		// 删除流程发布相关资源 部署相关的表数据都会被删除
		repositoryService.deleteDeployment(deploymentID);
	}

	/**
	 * 请假流程启动
	 */
	private static void startProcessInstanceByKey(String keyString) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		RuntimeService runtimeService = engine.getRuntimeService();
		//业务key和参数同时传
		//runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables)
		//业务Key
		ProcessInstance pInstance = runtimeService.startProcessInstanceByKey(keyString, "bk001");
		System.out.println(pInstance);
		//runtimeService.startProcessInstanceByKey(keyString); //缺省启动最新版本，支持版本选择请使用byid
	}
	
	/**
	 * 请假流程启动 可以指定版本 某个流程的特定版本只对应一个ID
	 */
	private static void startProcessInstanceById(String idString) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		RuntimeService runtimeService = engine.getRuntimeService();
		Dto variables = Dtos.newDto();
		variables.put("a1", "a1_v");
		variables.put("a2", "a2_v");
		//传递业务Key和实例参数
		runtimeService.startProcessInstanceById(idString, "bk002", variables);

	}
	
	/**
	 * 获取实例参数
	 */
	private static void getProcessInstanceVariables(String executionId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		RuntimeService runtimeService = engine.getRuntimeService();
		//获取实例参数
		Map outDto =runtimeService.getVariables(executionId);
		System.out.println(outDto);
	}
	
	/**
	 * 任务操作:任务参数设置 参数都是实例共享的。
	 */
	private static void setTaskVariables(String taskId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		Dto variables = Dtos.newDto();
		//variables.put("taskv1_local", "_v1");
		//variables.put("taskv2_local", "_v2");
		variables.put("taskv1", "_v1");
		variables.put("taskv2", "_v2");
		taskService.setVariables(taskId, variables);  //这种似乎会导致结束流程实例时外键错误
		//taskService.setVariablesLocal(taskId, variables);
	}
	
	/**
	 * 任务操作:任务参数获取
	 */
	private static void getTaskVariables(String taskId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		//获取任务参数
		//Map outDto =taskService.getVariables(taskId);
		Map outDto = taskService.getVariablesLocal(taskId);
		System.out.println(outDto);
	}
	
	/**
	 * 操作任务配置项
	 */
	private static void setTaskCfg(String taskId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		taskService.setAssignee(taskId, "xiongchun");
		taskService.setOwner(taskId, "xiongchun1");
		//taskService.claim(taskId, "xiongchun"); //任务声明受理人和setAssignee类似，但变更受理人会抛出异常 认领的概念
	}
	
	/**
	 * 查询待办任务
	 */
	private static void queryTaskTodo() {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		TaskQuery tQuery = taskService.createTaskQuery().taskAssignee("xiongchun");
		List<Task> list = tQuery.list();
		for (Task task : list) {
			System.out.println(task);
		}
	}
	
	/**
	 * 查询待办任务1
	 */
	private static void queryTaskTodo1() {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		List<Task> tasks = taskService.createTaskQuery()
		         .taskAssignee("kermit")
		         .processVariableValueEquals("orderId", "0815")
		         .list();
	}
	
	/**
	 * 查询待办任务2
	 */
	private static void queryTaskTodo2() {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		ManagementService managementService = engine.getManagementService();
		 List<Task> tasks = taskService.createNativeTaskQuery()
			        .sql("SELECT * FROM " + managementService.getTableName(Task.class) + " T WHERE T.NAME_ = #{taskName}")
			        .parameter("taskName", "gonzoTask")
			        .list();

			      long count = taskService.createNativeTaskQuery()
			        .sql("SELECT count(*) FROM " + managementService.getTableName(Task.class) + " T1, "
			               + managementService.getTableName(VariableInstanceEntity.class) + " V1 WHERE V1.TASK_ID_ = T1.ID_")
			        .count();
	}
	
	/**
	 * 完成任务
	 */
	private static void completeTask(String taskId) {
		ProcessEngine engine = AOSCxt.getProcessEngine();
		TaskService taskService = engine.getTaskService();
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		//在任务完成请求提交时流程引擎内部不会校验当前用户是否是任务节点记录的执行人assignee。如果需要校验，则需要自己处理。如下：
		 if ("xiongchun".equals(task.getAssignee())) {
		  //taskService.complete(taskId);//也可以携带一些变量
			 Dto variables = Dtos.newDto();
			 variables.put("assignee", "xiongchun");
		     taskService.complete(taskId, variables);
		     
		} 
	}
	
	/**
	 * 查询历史任务
	 */
	public void findHistoryTask(){
		String processInstanceId="501";
		ProcessEngine engine = AOSCxt.getProcessEngine();
		List<HistoricTaskInstance> list = engine.getHistoryService()//与历史数据（历史表）相关的service
				.createHistoricTaskInstanceQuery()//创建历史任务实例查询
				.processInstanceId(processInstanceId)
//       		.taskAssignee(taskAssignee)//指定历史任务的办理人
				.list();
		if(list!=null && list.size()>0){
			for(HistoricTaskInstance hti:list){
				System.out.println(hti.getId()+"    "+hti.getName()+"    "+hti.getProcessInstanceId()+"   "+hti.getStartTime()+"   "+hti.getEndTime()+"   "+hti.getDurationInMillis());
				System.out.println("################################");
			}
		}	

	}
	
	/**
	 * 查询流程状态（判断流程正在执行，还是结束）
	 */
	public void isProcessEnd(){
		String processInstanceId =  "501";
		ProcessEngine engine = AOSCxt.getProcessEngine();
		ProcessInstance pi = engine.getRuntimeService()//表示正在执行的流程实例和执行对象
				.createProcessInstanceQuery()//创建流程实例查询
				.processInstanceId(processInstanceId)//使用流程实例ID查询
				.singleResult();
		
		if(pi==null){
			System.out.println("流程已经结束");
		}
		else{
			System.out.println("流程没有结束");
		}
		
	}

	/**
	 * 流程测试1
	 */
	private static void test1() {
		// 创建流程引擎
		ProcessEngine engine = AOSCxt.getProcessEngine();
		RepositoryService repositoryService = engine.getRepositoryService();
		TaskService taskService = engine.getTaskService();
		RuntimeService runtimeService = engine.getRuntimeService();
		// 部署文件
		Deployment deployment = repositoryService.createDeployment()
				.addClasspathResource("aos/workflow/test/diagrams/Converge.bpmn").deploy();
		// 流程定义
		ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId())
				.singleResult();
		// 初始化多实例任务的数据
		List<Integer> datas = new ArrayList<Integer>();
		for (int i = 0; i < 10; i++) {
			datas.add(i);
		}
		// 初始化流程参数
		Map<String, Object> vars = new HashMap<String, Object>();
		vars.put("datas", datas);
		vars.put("pass", true);
		// 启动流程
		ProcessInstance pi = runtimeService.startProcessInstanceByKey("Converge", vars);
		// 任务查询
		List<Task> tasks = taskService.createTaskQuery().processInstanceId(pi.getId()).list();
		System.out.println("当前任务总数：" + tasks.size());
		// 完成第三个任务，否决会签
		Map<String, Object> taskResult = new HashMap<String, Object>();
		taskResult.put("pass", false);
		taskService.complete(tasks.get(2).getId(), taskResult);
		// 流程实例为null，流程结束
		ProcessInstance currentPi = runtimeService.createProcessInstanceQuery().processDefinitionId(pd.getId())
				.singleResult();
		System.out.println(currentPi);
	}

}
