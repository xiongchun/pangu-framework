package cn.osworks.aos.system.modules.controller.workflow;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.workflow.ProcDeployService;


/**
 * 流程定义控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "workflow/procDef")
public class ProcDefController {
	
    @Autowired
    private RuntimeService runtimeServic;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private ProcDeployService procDeployService;

    /**
     * 启动流程实例
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "startProc")
    public void startProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(inDto.getString("proc_def_id_")).singleResult();
        Dto variables = Dtos.newDto();
        variables.put("variable_1", AOSId.uuid(0));
        //传递业务Key和实例参数
        String business_key_ = "business_key_" + AOSId.uuid(0);
        //会写_hi_procinst表的start_user_id_参数
        identityService.setAuthenticatedUserId(inDto.getUserInfo().getId_());
        ProcessInstance processInstance = runtimeServic.startProcessInstanceById(processDefinition.getId(), business_key_, variables);
        runtimeServic.setProcessInstanceName(processInstance.getId(), processDefinition.getName());
        WebCxt.write(response, "操作完成，流程实例启动成功。");
    }

    /**
     * 流程定义挂起
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "suspendProcDef")
    public void suspendProcDef(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        repositoryService.suspendProcessDefinitionById(inDto.getString("proc_def_id_"));
        WebCxt.write(response, "操作完成。流程定义挂起成功。");
    }

    /**
     * 流程定义激活
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "activateProcDef")
    public void activateProcDef(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        repositoryService.activateProcessDefinitionById(inDto.getString("proc_def_id_"));
        WebCxt.write(response, "操作完成。流程定义激活成功。");
    }

    /**
     * 流程定义删除
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "delProcDef")
    public void delProcDef(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        Dto outDto = procDeployService.delProcDef(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }
}
