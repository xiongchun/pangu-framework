package cn.osworks.aos.system.modules.controller.workflow;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.workflow.ProcTaskService;


/**
 * 流程任务控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "workflow/procTask")
public class ProcTaskController {

    @Autowired
    private SqlDao sqlDao;
    @Autowired
    private TaskService taskService;
    @Autowired
    private ProcTaskService procTaskService;

    /**
     * 页面初始化
     *
     * @return
     */
    @RequestMapping(value = "init")
    public String init() {
        return "aos/workflow/procTask.jsp";
    }

    /**
     * 查询任务列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "listProcTasks")
    public void listProcTasks(HttpServletRequest request, HttpServletResponse response) {
        Dto inDto = Dtos.newDto(request);
        List<Dto> list = procTaskService.listProcTasks(inDto);
        String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
        WebCxt.write(response, outString);
    }
    
    /**
     * 设置任务候选人
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "candidateProcTask")
    public void candidateProcTask(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        taskService.addCandidateUser(inDto.getString("id_"), "1");
        WebCxt.write(response, "操作完成。候选人设置成功。");
    }

    /**
     * 删除任务
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "delProcTask")
    public void delProcTask(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        taskService.deleteTask(inDto.getString("id_"), true);
        WebCxt.write(response, "操作完成。删除成功。");
    }
}
