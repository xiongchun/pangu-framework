package cn.osworks.aos.system.modules.controller.workflow;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.workflow.ProcDeployService;

/**
 * 流程部署控制器
 * 
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "workflow/procDeploy")
public class ProcDeployController {

	@Autowired
	private ProcDeployService procDeployService;
	@Autowired
	private SqlDao sqlDao;

	/**
	 * 页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init() {
		return "aos/workflow/procDeploy.jsp";
	}
	
	/**
	 * 查询流程列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listProcs")
	public void listProcs(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Dto> list = procDeployService.listProcs(inDto);
		String outString = AOSJson.toGridJson(list);
		WebCxt.write(response, outString);
	}

	/**
	 * 部署流程
	 * 
	 * @param myFile1
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "deployProc")
	public void deployProc(@RequestParam("myFile1") MultipartFile myFile1, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto inDto = Dtos.newDto(request);
		inDto.put("myFile1", myFile1);
		Dto outDto = procDeployService.deployProcess(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 删除流程
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "delProcDef")
	public void delProcDef(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = procDeployService.delProcDef(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改流程
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "updateProcDef")
	public void updateProcDef(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		Dto outDto = procDeployService.updateProcDef(inDto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

}
