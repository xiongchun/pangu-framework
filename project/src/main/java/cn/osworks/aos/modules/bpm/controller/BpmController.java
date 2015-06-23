package cn.osworks.aos.modules.bpm.controller;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.RepositoryService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.modules.bpm.misc.BPMUtils;

/**
 * BPM控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "bpm/")
public class BpmController {

    @Autowired
    private RepositoryService repositoryService;

    /**
     * 根据模型ID获取流程图资源
     * <p/>
     * 采用实时动态生成模型图的机制，而没有去ge_bytearray取模型部署时生成的二进制图片。
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "graphModelByModelID")
    public void graphModelByModelID(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        String model_id_ = inDto.getString("model_id_");
        byte[] sourceByte = repositoryService.getModelEditorSource(model_id_);
        BpmnModel bpmnModel = BPMUtils.jsonModel2BpmnModel(sourceByte);
        InputStream inputStream = BPMUtils.graphBPMNModel(bpmnModel, null, null);
        IOUtils.copy(inputStream, response.getOutputStream());
    }
    
    /**
     * 根据流程定义ID获取流程图资源
     * <p/>
     * 采用实时动态生成模型图的机制，而没有去ge_bytearray取模型部署时生成的二进制图片。
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "graphModelByProcdefID")
    public void graphModelByProcdefID(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
