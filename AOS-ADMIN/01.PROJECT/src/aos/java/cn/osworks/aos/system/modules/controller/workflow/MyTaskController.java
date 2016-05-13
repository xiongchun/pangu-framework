package cn.osworks.aos.system.modules.controller.workflow;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.system.modules.service.workflow.MyTaskService;

/**
 * 我的任务控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "workflow/mytask")
public class MyTaskController {
	
	@Autowired
	private SystemService systemService;
	@Autowired
	private MyTaskService myTaskService;
	
    /**
     * 我的任务页面初始化
     *
     * @return
     */
    @RequestMapping(value = "init")
    public String init(HttpServletRequest request, HttpSession session) {
		String bodyBorder = "0 0 1 0";
		String skin = WebCxt.getCfgByUser(session, "skin_");
		if (StringUtils.equalsIgnoreCase(skin, AOSCons.SKIN_NEPTUNE)) {
			bodyBorder = "0 0 0 0";
		}
		request.setAttribute("bodyBorder", bodyBorder);
    	Dto inDto = Dtos.newDto(request);
		request.setAttribute("mdpm", systemService.getMasterDetailPageModel(inDto));
		request.setAttribute("page_load_msg_", WebCxt.getCfgOfDB("page_load_msg_"));
        return "aos/workflow/mytask/taskMain.jsp";
    }
    
    /**
     * 任务办理页面初始化
     *
     * @return
     */
    @RequestMapping(value = "initDo")
    public String initDo() {
    	
        return "aos/workflow/mytask/doTask.jsp";
    }
    
    /**
     * 已办任务页面初始化
     *
     * @return
     */
    @RequestMapping(value = "initDone")
    public String initDone() {
    	
        return "aos/workflow/mytask/doneTask.jsp";
    }
    
    /**
     * 查询待办任务
     *
     * @return
     */
    @RequestMapping(value = "listDoTasks")
    public void listDoTasks(HttpServletRequest request, HttpServletResponse response) {
    	Dto inDto = Dtos.newDto(request);
    	inDto.put("assignee_", inDto.getUserInfo().getId_());
        List<Dto> list = myTaskService.listTodoTasks(inDto);
        String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
        WebCxt.write(response, outString);
    }
    
    /**
     * 查询待签收任务
     *
     * @return
     */
    @RequestMapping(value = "listClaimTasks")
    public void listClaimTasks(HttpServletRequest request, HttpServletResponse response) {
    	Dto inDto = Dtos.newDto(request);
    	inDto.put("user_id_", inDto.getUserInfo().getId_());
        List<Dto> list = myTaskService.listClaimTasks(inDto);
        String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
        WebCxt.write(response, outString);
    }
    
    /**
     * 签收任务
     *
     * @return
     */
    @RequestMapping(value = "claimTask")
    public void claimTask(HttpServletRequest request, HttpServletResponse response) {
    	Dto inDto = Dtos.newDto(request);
    	Dto outDto = myTaskService.claimTask(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }
    
    /**
     * 反签收任务
     *
     * @return
     */
    @RequestMapping(value = "unClaimTask")
    public void unclaimTask(HttpServletRequest request, HttpServletResponse response) {
    	Dto inDto = Dtos.newDto(request);
    	Dto outDto = myTaskService.unClaimTask(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }
    
    /**
     * 查询已办任务
     *
     * @return
     */
    @RequestMapping(value = "listDoneTasks")
    public void listDoneTasks(HttpServletRequest request, HttpServletResponse response) {
    	Dto inDto = Dtos.newDto(request);
    	inDto.put("assignee_", inDto.getUserInfo().getId_());
        List<Dto> list = myTaskService.listDoneTasks(inDto);
        String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
        WebCxt.write(response, outString);
    }
    
    

}
