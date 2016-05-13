package cn.osworks.aos.system.modules.controller.workflow;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.RepositoryService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.BPMUtils;

/**
 * 工作流控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "workflow")
public class WorkflowController {

    @Autowired
    private RepositoryService repositoryService;

    /**
     * 根据模型ID获取流程图
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "graphByModelID")
    public void graphByModelID(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        String model_id_ = inDto.getString("model_id_");
        byte[] sourceByte = repositoryService.getModelEditorSource(model_id_);
        BpmnModel bpmnModel = BPMUtils.jsonModel2BpmnModel(sourceByte);
        InputStream inputStream = BPMUtils.graphBPMNModel(bpmnModel, null, null);
        IOUtils.copy(inputStream, response.getOutputStream());
    }
    
    /**
     * 根据流程定义ID获取流程图
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "graphByProcdefID")
    public void graphByProcdefID(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        String proc_def_id_ = inDto.getString("proc_def_id_");
        BpmnModel bpmnModel = repositoryService.getBpmnModel(proc_def_id_);
        InputStream inputStream = BPMUtils.graphBPMNModel(bpmnModel, null, null);
        IOUtils.copy(inputStream, response.getOutputStream());
    }
    
    /**
     * 从BPMN XML文件中解析流程名称
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "getMetaInfoFromXML")
    public void getMetaInfoFromXML(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        byte[] jsonModel = repositoryService.getModelEditorSource(inDto.getString("model_id_"));
        Dto outDto = BPMUtils.getMetaInfoFromXML(BPMUtils.jsonModel2XmlModel(jsonModel));
        WebCxt.write(response, AOSJson.toJson(outDto));
    }

}
