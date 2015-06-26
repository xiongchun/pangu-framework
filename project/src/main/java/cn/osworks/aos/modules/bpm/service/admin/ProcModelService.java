package cn.osworks.aos.modules.bpm.service.admin;

import java.io.IOException;

import javax.xml.stream.XMLStreamException;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.bpm.misc.BPMUtils;
import cn.osworks.aos.modules.bpm.service.ModelerService;
import cn.osworks.aos.modules.system.dao.mapper.Aos_act_ext_modelMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_act_ext_procdefMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_act_ext_modelPO;
import cn.osworks.aos.modules.system.dao.po.Aos_act_ext_procdefPO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.web.misc.DicCons;
import cn.osworks.aos.web.misc.IdCons;


/**
 * 流程管理服务
 * 
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class ProcModelService {

	@Autowired
	private ModelerService modelerService;
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_act_ext_procdefMapper aos_act_ext_procdefMapper;
	@Autowired
	private Aos_act_ext_modelMapper aos_act_ext_modelMapper;

	/**
	 * 导入文件模型资源
	 * 
	 * @param inDto
	 */
	public void importFileModel(Dto inDto) throws IOException, XMLStreamException {
		MultipartFile myFile1 = (MultipartFile) inDto.get("myFile1");
		String json_xml = BPMUtils.xmlModel2JsonModel(myFile1.getBytes());
		inDto.put("json_xml", json_xml);
		inDto.put("name", inDto.getString("title_"));
		inDto.put("description", inDto.getString("remark_"));
		inDto.put("create_type_", DicCons.CREATE_TYPE_FILE);
		modelerService.newModel(inDto);
	}

	/**
	 * 导入文本模型资源
	 * 
	 * @param inDto
	 */
	public void importTextModel(Dto inDto) throws IOException, XMLStreamException {
		String xmlModelText = inDto.getString("xmlModelText");
		String json_xml = BPMUtils.xmlModel2JsonModel(xmlModelText.getBytes("utf-8"));
		inDto.put("json_xml", json_xml);
		inDto.put("name", inDto.getString("name_"));
		inDto.put("description", inDto.getString("remark_"));
		inDto.put("create_type_", DicCons.CREATE_TYPE_TEXT);
		modelerService.newModel(inDto);
	}

	/**
	 * 更新流程模型基本属性
	 * 
	 * @param inDto
	 */
	public void updateModelProps(Dto inDto) {
		Aos_act_ext_modelPO aos_act_ext_modelPO = new Aos_act_ext_modelPO();
		AOSUtils.apply(inDto, aos_act_ext_modelPO);
		// 更新扩展表
		aos_act_ext_modelMapper.updateByKey(aos_act_ext_modelPO);
		Dto modelDto = Dtos.newDto();
		modelDto.put("id_", aos_act_ext_modelPO.getModel_id_());
		modelDto.put("name_", aos_act_ext_modelPO.getName_());
		// 更新re_model表
		sqlDao.update("Bpm.update_re_model_bykey", modelDto);
	}

	/**
	 * 删除流程模型资源
	 * 
	 * @param inDto
	 */
	public Dto deleteModel(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		String id_s[] = inDto.getSelection();
		int del = 0;
		for (String id_ : id_s) {
			Aos_act_ext_modelPO aos_act_ext_modelPO = aos_act_ext_modelMapper.selectByKey(id_);
			// 删除re_model及其大对象
			repositoryService.deleteModel(aos_act_ext_modelPO.getModel_id_());
			// 删除流程模型扩展表
			aos_act_ext_modelMapper.deleteByKey(id_);
			del++;
		}
		outDto.setAppMsg(AOSUtils.merge("操作完成，成功删除模型数据{0}条。", del));
		return outDto;
	}

	/**
	 * 部署模型
	 * 
	 * @param inDto
	 */
	public Dto deployModel(Dto inDto) throws IOException {
		Dto outDto = Dtos.newOutDto();
		UserInfoVO userInfoVO = inDto.getUserInfo();
		Model model = repositoryService.getModel(inDto.getString("model_id_"));
		byte[] jsonModel = repositoryService.getModelEditorSource(model.getId());
		DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();
		deploymentBuilder.name(model.getName()); // 这个值会写入act_deployment表
		// 提醒：启用两次相同模型数据重复部署过滤器
		// deploymentBuilder.enableDuplicateFiltering(); 启用后相同模型不会
		String resourceName = model.getName() + ".bpmn"; // 必须是.bpmn或.bpmn20.xml，否则不会写re_procdef表。
		deploymentBuilder.addBpmnModel(resourceName, BPMUtils.jsonModel2BpmnModel(jsonModel));
		Deployment deployment = deploymentBuilder.deploy();
		// 更新re_model，不适用API更新是为了避免导致版本号混乱。此字段有点鸡肋，仅仅用于记录这个模型最后一次部署的部署ID。无实际更多用处。
		Dto updateDto = Dtos.newDto();
		updateDto.put("deployment_id_", deployment.getId());
		updateDto.put("id_", model.getId());
		sqlDao.update("Bpm.update_re_model_bykey", updateDto);

		// 写流程定义扩展表
		Aos_act_ext_procdefPO aos_act_ext_procdefPO = new Aos_act_ext_procdefPO();
		aos_act_ext_procdefPO.setId_(AOSId.id(IdCons.BPMID));
		aos_act_ext_procdefPO.setModel_id_(inDto.getString("model_id_"));
		// 获取已部署流程实体
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
				.deploymentId(deployment.getId()).singleResult();
		aos_act_ext_procdefPO.setProc_def_id_(processDefinition.getId());
		aos_act_ext_procdefPO.setDeploy_user_id_(userInfoVO.getId_());
		aos_act_ext_procdefPO.setDeploy_user_(userInfoVO.getName_());
		aos_act_ext_procdefPO.setDeploy_time_(AOSUtils.getDateTimeStr());
		aos_act_ext_procdefMapper.insert(aos_act_ext_procdefPO);
		outDto.setAppMsg("操作完成，部署成功。");
		return outDto;
	}

}
