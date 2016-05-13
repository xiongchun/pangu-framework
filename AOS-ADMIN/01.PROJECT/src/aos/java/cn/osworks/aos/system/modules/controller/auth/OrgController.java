package cn.osworks.aos.system.modules.controller.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.system.modules.service.auth.OrgService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 组织架构
 * 
 * @author OSWorks-XC
 * @date 2014-07-16
 */
@Controller
@RequestMapping(value = "system/org")
public class OrgController {

	@Autowired
	private OrgService orgService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private SystemService systemService;

	/**
	 * 页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		//TODO 需要修改为从数据库实时取：否则组织机构管理修改根节点后需要重新登录才看得到效果。
		request.setAttribute("dept_", WebCxt.getUserInfo(session).getOrgInfo());
		return "aos/auth/org.jsp";
	}

	/**
	 * 查询组织树列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listOrgTree")
	public void listOrgTree(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> treeNodes = systemService.getOrgTree(qDto);
		String jsonString = AOSJson.toGridJson(treeNodes);
		WebCxt.write(response, jsonString);
	}

	/**
	 * 查询功能模块列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listOrgs")
	public void listOrgs(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("sort_no_");
		List<Aos_sys_orgPO> aos_sys_orgPOs = sqlDao.list("Auth.listAos_sys_orgPOsPage", qDto);
		String outString = AOSJson.toGridJson(aos_sys_orgPOs, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 保存组织信息
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "saveOrg")
	public void saveOrg(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		orgService.saveOrg(dto);
		WebCxt.write(response, "操作完成，组织新增成功。");
	}

	/**
	 * 修改组织信息
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "updateOrg")
	public void updateOrg(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
	    Dto outDto = orgService.updateOrg(dto);
	    outDto.setAppMsg("操作完成，组织信息修改成功。");
	    WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 删除组织信息
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "deleteOrg")
	public void deleteOrg(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = orgService.deleteOrg(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

}
