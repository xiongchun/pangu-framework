package cn.osworks.aos.demo.modules.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.demo.dao.mapper.Demo_accountMapper;
import cn.osworks.aos.demo.dao.po.Demo_accountPO;
import cn.osworks.aos.demo.modules.service.MiscService;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;

/**
 * 综合实例相关功能控制器
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "demo/misc")
public class MiscController {

	@Autowired
    private SqlDao sqlDao;
	@Autowired
	private Demo_accountMapper demo_accountMapper;
	@Autowired
	private MiscService miscService;

	/**
	 * 综合实例①页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMisc1")
	public String initMisc1() {
		return "demo/misc/misc1.jsp";
	}
	
	/**
	 * 综合实例②页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMisc2")
	public String initMisc2() {
		return "demo/misc/misc2.jsp";
	}
	
	/**
	 * 综合实例③页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMisc3")
	public String initMisc3() {
		return "demo/misc/misc3.jsp";
	}
	
	/**
	 * 综合实例④页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initMisc4")
	public String initMisc4() {
		return "demo/misc/misc4.jsp";
	}
	
	/**
	 * 查询信用卡账户列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listAccounts")
	public void listAccounts(HttpServletRequest request, HttpServletResponse response) {
		// inDto包装了全部的请求参数哦
		Dto inDto = Dtos.newDto(request);
		// 就是这么简单，数据库物理分页的数据都出来了。如果要字段精确匹配的话就用.listPage();
		List<Demo_accountPO> list = demo_accountMapper.likePage(inDto);
		// 神奇的inDto又显神功了，它里面还包含了分页查询记录总条数喔。
		String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
		// 就这样返回转换为Json后返回界面就可以了。
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询组织信息列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listOrgs")
	public void listOrgs(HttpServletRequest request, HttpServletResponse response) {
		// inDto包装了全部的请求参数哦
		Dto inDto = Dtos.newDto(request);
		List<Aos_sys_orgPO> list = miscService.listOrgs(inDto);
		// 神奇的inDto又显神功了，它里面还包含了分页查询记录总条数喔。
		String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
		// 就这样返回转换为Json后返回界面就可以了。
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询组织信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getOrgInfo")
	public void getOrgInfo(HttpServletRequest request, HttpServletResponse response) {
		// inDto包装了全部的请求参数哦
		Dto inDto = Dtos.newDto(request);
		Aos_sys_orgPO aos_sys_orgPO = miscService.getOrgInfo(inDto);
		String outString = AOSJson.toJson(aos_sys_orgPO);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询参数列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listParams")
	public void listParams(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		inDto.setOrder("id_ DESC");
		List<Dto> list = miscService.listParams(inDto);
		String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
		WebCxt.write(response, outString);
	}
	
}
