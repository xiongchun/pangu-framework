package cn.osworks.aos.system.modules.service.workflow;

import java.io.IOException;
import java.util.List;

import javax.xml.stream.XMLStreamException;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_wf_re_procdefMapper;
import cn.osworks.aos.system.dao.po.Aos_wf_re_procdefPO;
import cn.osworks.aos.system.service.AOSService;

import com.google.common.collect.Lists;

/**
 * 流程部署服务
 * 
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Service
public class ProcDeployService {

	@Autowired
	private ModelerService modelerService;
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private WorkflowService workflowService;
	@Autowired
	private Aos_wf_re_procdefMapper aos_wf_re_procdefMapper;
	@Autowired
	private AOSService aosService;
	
	/**
	 * 查询流程列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listProcs(Dto inDto){
		List<Dto> outDtos = Lists.newArrayList();
		ProcessDefinitionQuery pQuery = repositoryService.createProcessDefinitionQuery();
		if (AOSUtils.isNotEmpty(inDto.getString("catalog_id_"))) {
			pQuery.processDefinitionCategory(inDto.getString("catalog_id_"));
		}
		List<ProcessDefinition> processDefinitions = pQuery.orderByProcessDefinitionId().desc().list();
		for (ProcessDefinition processDefinition : processDefinitions) {
			Dto dto = Dtos.newDto();
			dto.put("id_", processDefinition.getId());
			dto.put("key_", processDefinition.getKey());
			dto.put("name_", processDefinition.getName());
			dto.put("resource_name_", processDefinition.getResourceName());
			dto.put("version_", processDefinition.getVersion());
			dto.put("description_", processDefinition.getDescription());
			Aos_wf_re_procdefPO aos_wf_re_procdefPO = aos_wf_re_procdefMapper.selectByKey(processDefinition.getId());
			dto.put("suspension_state_", String.valueOf(aos_wf_re_procdefPO.getSuspension_state_()));
			Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(processDefinition.getDeploymentId()).singleResult();
			dto.put("deploy_time_", AOSUtils.date2String(deployment.getDeploymentTime(), AOSCons.DATATIME));
			outDtos.add(dto);
		}
		return outDtos;
	}

	/**
	 * 发布流程
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto deployProcess(Dto inDto) throws IOException, XMLStreamException {
		Dto outDto = Dtos.newOutDto();
		MultipartFile myFile1 = (MultipartFile) inDto.get("myFile1");
		if (StringUtils.indexOf(myFile1.getOriginalFilename(), ".bpmn") == -1) {
			outDto.setAppMsg("操作被取消，只能发布.bpmn格式的流程模型文件。");
			return outDto;
		}
		DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();
		deploymentBuilder.addInputStream(myFile1.getOriginalFilename(), myFile1.getInputStream());
		Deployment deployment = deploymentBuilder.deploy();
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
		//更新流程分类，没什么实际意义。分类字段在后续业务没使用。
		Aos_wf_re_procdefPO aos_wf_re_procdefPO = new Aos_wf_re_procdefPO();
		aos_wf_re_procdefPO.setId_(processDefinition.getId());
		aos_wf_re_procdefPO.setCategory_(AOSCons.OSWORKS_WEBSITE);
		aos_wf_re_procdefMapper.updateByKey(aos_wf_re_procdefPO);
		outDto.setAppMsg("流程部署成功。");
		return outDto;
	}

	/**
	 * 删除流程
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto delProcDef(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		String ids[] = inDto.getRows();
		// 是否强制级联删除
		boolean cascade = false;
		if (StringUtils.equals(AOSCons.YES, inDto.getString("cascade"))) {
			cascade = true;
		}
		for (String id_ : ids) {
			ProcessDefinition processDefinition = repositoryService.getProcessDefinition(id_);
			// 级联强制删除
			repositoryService.deleteDeployment(processDefinition.getDeploymentId(), cascade);
		}
		outDto.setAppMsg(AOSUtils.merge("操作完成，流程数据删除成功。"));
		return outDto;
	}
	
	/**
	 * 修改流程
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updateProcDef(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		
		outDto.setAppMsg(AOSUtils.merge("操作完成，流程数据删除成功。"));
		return outDto;
	}

}
