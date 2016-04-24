package cn.osworks.aos.demo.modules.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
@RequestMapping(value = "demo")
public class DemoController {
	
	private static Log log = LogFactory.getLog(DemoController.class);

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Demo_accountMapper demo_accountMapper;

	/**
	 * 按钮页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initButton")
	public String initButton() {
		return "demo/button.jsp";
	}

	/**
	 * 消息提示窗组件初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initNotification")
	public String initNotification() {
		return "demo/notification.jsp";
	}

	/**
	 * 基本表单1初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm1")
	public String initForm1() {
		return "demo/form/formPanel1.jsp";
	}

	/**
	 * 基本表单2初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm2")
	public String initForm2() {
		return "demo/form/formPanel2.jsp";
	}
	
	/**
	 * 表单元素常用API页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initFormApi")
	public String initFormApi() {
		return "demo/form/formApi.jsp";
	}
	
	/**
	 * 表单数据交互页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initFormData")
	public String initFormData() {
		return "demo/form/formData.jsp";
	}
	
	/**
	 * 表单校验页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initFormValidate")
	public String initFormValidate() {
		return "demo/form/formValidate.jsp";
	}
	
	/**
	 * 页面组件复用初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initShare")
	public String initShare() {
		return "demo/share.jsp";
	}


	/**
	 * 基本表单3初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initForm3")
	public String initForm3(HttpServletRequest request, HttpSession session) {
		String height = "210";
		if (StringUtils.equalsIgnoreCase(WebCxt.getCfgByUser(session, "skin_"), AOSCons.SKIN_NEPTUNE)) {
			height = "223";
		}
		request.setAttribute("height", height);
		return "demo/form/formPanel3.jsp";
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
		return "demo/form/formElements.jsp";
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
		return "demo/form/formComboBox.jsp";
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
		List<Dto> list = sqlDao.list("Demo.listComboBoxData", inDto);
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
		List<Dto> list = sqlDao.list("Demo.listComboBoxData", inDto);
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
		List<Dto> treeNodes = sqlDao.list("Demo.listModules", qDto);
		String outString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 加载表单1信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getForm1Info")
	public void getForm1Info(HttpServletRequest request, HttpServletResponse response) {
		Dto outDto = Dtos.newDto();
		outDto.put("name_", "凤姐_" + AOSUtils.random());
		outDto.put("cardno_", "53001292519821117");
		outDto.put("age_", "年芳18、貌美如花。");
		outDto.put("sex_", "2");
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 加载表单2信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getForm2Info")
	public void getForm2Info(HttpServletRequest request, HttpServletResponse response) {
		Dto outDto = Dtos.newDto();
		outDto.put("name_", "中国嘉靖银行第" + AOSUtils.random() + "支行");
		outDto.put("birthday_", "2015-03-10");
		outDto.put("home_", "云南省昆明市杨浦区政通路");
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 提交表单信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "submitForm")
	public void submitForm(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		//如果获取当前用户信息
		//UserInfoVO userInfoVO = inDto.getUserInfo();
		if (log.isDebugEnabled()) {
			log.debug("表单数据提交");
			inDto.println();
		}
		//返回简单的提示信息
		WebCxt.write(response, "数据已提交到后台，请查看控制台输出。");
	}
	
	/**
	 * 提交表单信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "submitForm2")
	public void submitForm2(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		if (log.isDebugEnabled()) {
			log.debug("表单数据提交");
			inDto.println();
		}
		//返回复杂的Json对象给前端
		Dto outDto = Dtos.newOutDto();
		outDto.put("userName", inDto.getUserInfo().getName_());
		outDto.setAppMsg("数据已提交到后台，请查看控制台输出。");
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 测试Http接口服务
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "httpService")
	public void httpService(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		inDto.println();
		Dto outDto = Dtos.newDto();
		
		outDto.put("app_code_", 1);
		outDto.put("app_msg_", "操作成功!");
		WebCxt.write(response, AOSJson.toJson(outDto));
		
	}
	
	
}
