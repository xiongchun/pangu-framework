package cn.osworks.aos.modules.system.controller.resource;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_moduleMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_modulePO;
import cn.osworks.aos.modules.system.service.resource.ModuleService;


/**
 * 功能模块控制器
 * 
 * @author OSWorks-XC
 * @date 2014-07-09
 */
@Controller
@RequestMapping(value = "system/module/")
public class ModuleController {
	
	@Autowired
	private Aos_au_moduleMapper aos_au_moduleMapper;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private SqlDao sqlDao;
	
	/**
	 * 页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey("0");
		request.setAttribute("_root", aos_au_modulePO);
		return "aos/resource/module.jsp";
	}
	
	/**
	 * 查询功能模块列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listModules")
	public void listModules(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("sort_no_");
		List<Aos_au_modulePO> aos_au_modulePOs = sqlDao.list("Resource.listAos_au_modulePOs", qDto);
		String outString = AOSJson.toGridJson(aos_au_modulePOs, aos_au_modulePOs.size());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询菜单树列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listModuleTree")
	public void listModuleTree(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("sort_no_");
		List<Dto> list = moduleService.getModulesTree(qDto);
		String jsonString = AOSJson.toJson(list);
		WebCxt.write(response, jsonString);
	}
	
	/**
	 * 保存功能模块信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveModule")
	public void saveModule(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    moduleService.saveModule(dto);
	    WebCxt.write(response, "操作完成，功能模块菜单新增成功。");
	}
	
	/**
	 * 修改功能模块信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateModule")
	public void updateModule(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    moduleService.updateModule(dto);
	    WebCxt.write(response, "操作完成，功能模块菜单修改成功。");
	}
	
	/**
	 * 删除功能模块信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteModule")
	public void deleteModule(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = moduleService.deleteModule(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
}
