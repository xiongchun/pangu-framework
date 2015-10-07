package cn.osworks.aos.demo.modules.controller.ui;

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
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.demo.dao.mapper.Demo_accountMapper;
import cn.osworks.aos.demo.dao.po.Demo_accountPO;
import cn.osworks.aos.system.modules.service.SystemService;

/**
 * 标签库未分类UI组件演示控制器
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "demo/ui")
public class UIController {

	@Autowired
	private SqlDao demoDao;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Demo_accountMapper demo_accountMapper;
	@Autowired
	private SqlDao sysDao;

	/**
	 * 按钮页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initButton")
	public String initButton() {
		return "demo/ui/button.jsp";
	}

	/**
	 * 基本表单1初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm1")
	public String initForm1() {
		return "demo/ui/form/formPanel1.jsp";
	}

	/**
	 * 消息提示窗组件初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "notificationInit")
	public String notificationInit() {
		return "demo/ui/notification.jsp";
	}

	/**
	 * 基本表单2初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm2")
	public String initForm2() {
		return "demo/ui/form/formPanel2.jsp";
	}

	/**
	 * 基本表单3初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm3")
	public String initForm3() {
		return "demo/ui/form/formPanel3.jsp";
	}

	/**
	 * 基本表单4初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm4")
	public String initForm4(HttpServletRequest request, HttpSession session) {
		String height = "210";
		if (StringUtils.equalsIgnoreCase(WebCxt.getCfgByUser(session, "skin_"), AOSCons.SKIN_NEPTUNE)) {
			height = "223";
		}
		request.setAttribute("height", height);
		return "demo/ui/form/formPanel4.jsp";
	}

	/**
	 * 常用表单元素初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initFormElements")
	public String initFormElements(HttpServletRequest request) {
		String minValue = AOSUtils.getDateStr();
		String maxValue = AOSUtils.getDateStr("yyyy-MM-30");
		request.setAttribute("minValue", minValue);
		request.setAttribute("maxValue", maxValue);
		return "demo/ui/form/formElements.jsp";
	}

	/**
	 * 下拉选择框页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initFormComboBox")
	public String initFormComboBox(HttpServletRequest request) {
		String minValue = AOSUtils.getDateStr();
		String maxValue = AOSUtils.getDateStr("yyyy-MM-30");
		request.setAttribute("minValue", minValue);
		request.setAttribute("maxValue", maxValue);
		return "demo/ui/form/formComboBox.jsp";
	}

	/**
	 * 下拉选择框服务器端数据源
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listComboBoxData")
	public void listComboBoxData(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request); 
		inDto.put("parent_id_", "0");
		List<Dto> list = demoDao.list("Demo.listComboBoxData", inDto);
		WebCxt.write(response, AOSJson.toJson(list));
	}
	
	/**
	 * 下拉选择框服务器端数据源
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listComboBoxData2")
	public void listComboBoxData2(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Dto> list = demoDao.list("Demo.listComboBoxData", inDto);
		WebCxt.write(response, AOSJson.toJson(list));
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
	 * 查询分类科目树
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listCatalogs")
	public void listCatalogs(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> treeNodes = systemService.listCatalogs(qDto);
		String outString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询功能模块树（快捷过滤数据源）
	 * <p>过滤关键字为名称或热键
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listModules")
	public void listModules(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> treeNodes = sysDao.list("Demo.listModules", qDto);
		String outString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, outString);
	}
	
}
