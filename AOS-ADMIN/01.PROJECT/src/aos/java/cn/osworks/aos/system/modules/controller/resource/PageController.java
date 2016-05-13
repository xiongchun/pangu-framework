package cn.osworks.aos.system.modules.controller.resource;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.modules.dao.vo.PageVO;
import cn.osworks.aos.system.modules.service.resource.ModuleService;
import cn.osworks.aos.system.modules.service.resource.PageService;


/**
 * 页面组件控制器
 * 
 * @author OSWorks-XC
 * @date 2014-07-09
 */
@Controller
@RequestMapping(value = "system/page")
public class PageController {

	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private PageService pageService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private ModuleService moduleService;

	/**
	 * 界面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey("0");
		request.setAttribute("root_", aos_sys_modulePO);
		return "aos/resource/page.jsp";
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
	 * 查询页面集合
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listPages")
	public void listPages(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<PageVO> pageVOs = pageService.listPages4Mgr(inDto);
		String outString = AOSJson.toGridJson(pageVOs);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存页面信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "savePage")
	public void savePage(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    Dto outDto = pageService.savePage(dto);
	    WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改页面信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updatePage")
	public void updatePage(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    Dto outDto = pageService.updatePage(dto);
	    WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 删除页面信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deletePage")
	public void deletePage(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = pageService.deletePage(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 查询页面元素
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listElements")
	public void listElements(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Dto> aos_sys_page_elDtos = pageService.listElements4Mgr(inDto);
		String outString = AOSJson.toGridJson(aos_sys_page_elDtos);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存页面元素信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveElement")
	public void saveElement(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    Dto outDto = pageService.saveElement(dto);
	    WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改页面元素信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateElement")
	public void updateElement(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    Dto outDto = pageService.updateElement(dto);
	    WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 删除页面元素信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteElement")
	public void deleteElement(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = pageService.deleteElement(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 查询菜单树列表 (页面元素授权窗口使用)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listModuleTree4ElementGrant")
	public void listModuleTree4ElementGrant(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("sort_no_ ASC");
		WebCxt.write(response, pageService.getModulesTree4CmpGrant(qDto));
	}
	
	/**
	 * 查询页面元素(待授权)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listEelments4Grant")
	public void listEelments4Grant(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Dto> elementDtos = pageService.listElement4Grant(inDto);
		String outString = AOSJson.toGridJson(elementDtos);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存\取消组件授权信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveElementGrantInfo")
	public void saveElementGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		pageService.saveElementGrantInfo(dto);
		WebCxt.write(response, "操作完成，页面元素授权信息保存成功。");
	}

}
