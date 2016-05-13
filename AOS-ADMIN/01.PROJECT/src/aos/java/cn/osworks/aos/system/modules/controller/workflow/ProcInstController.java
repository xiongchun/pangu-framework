package cn.osworks.aos.system.modules.controller.workflow;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RuntimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.workflow.ProcInstService;

import com.google.common.collect.Lists;

/**
 * 流程实例控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "workflow/procInst")
public class ProcInstController {
	
    @Autowired
    private RuntimeService runtimeServic;
    @Autowired
    private ProcInstService procInstService;

    /**
     * 页面初始化
     *
     * @return
     */
    @RequestMapping(value = "init")
    public String init() {
        return "aos/workflow/procInst.jsp";
    }
    
    /**
     * 查询流程定义列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "listProcdefs")
    public void listProcdefs(HttpServletRequest request, HttpServletResponse response) {
        Dto inDto = Dtos.newDto(request);
        List<Dto> list = Lists.newArrayList();
        String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
        WebCxt.write(response, outString);
    }
    
    /**
     * 查询流程实例列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "listProcInsts")
    public void listProcInsts(HttpServletRequest request, HttpServletResponse response) {
        Dto inDto = Dtos.newDto(request);
        List<Dto> list = procInstService.listProcInsts(inDto);
        String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
        WebCxt.write(response, outString);
    }

    /**
     * 挂起流程实例
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "suspendProcInst")
    public void suspendProcInst(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        runtimeServic.suspendProcessInstanceById(inDto.getString("proc_inst_id_"));
        WebCxt.write(response, "操作完成。挂起成功。");
    }

    /**
     * 激活流程实例
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "activateProcInst")
    public void activateProcInst(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        runtimeServic.activateProcessInstanceById(inDto.getString("proc_inst_id_"));
        WebCxt.write(response, "操作完成，激活成功。");
    }

    /**
     * 删除流程实例
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "delProcInst")
    public void delProcInst(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        Dto outDto = procInstService.delProcInst(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }
}
