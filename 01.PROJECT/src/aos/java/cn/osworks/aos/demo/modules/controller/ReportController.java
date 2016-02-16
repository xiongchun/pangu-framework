package cn.osworks.aos.demo.modules.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.demo.dao.mapper.Demo_accountMapper;
import cn.osworks.aos.demo.dao.po.Demo_accountPO;
import cn.osworks.aos.web.report.AOSPrint;
import cn.osworks.aos.web.report.AOSReport;
import cn.osworks.aos.web.report.AOSReportModel;

/**
 * 报表演示控制器
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "demo/report")
public class ReportController {

	@Autowired
	private Demo_accountMapper demo_accountMapper;

	/**
	 * 基本报表页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initReport1")
	public String initReport1() {
		return "demo/report/report1.jsp";
	}

	/**
	 * 查询信用卡账户列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listAccounts")
	public void listAccounts(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Demo_accountPO> list = demo_accountMapper.listPage(inDto);
		String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 填充报表
	 * 
	 * @param request
	 * @param response
	 * @throws JRException
	 */
	@RequestMapping(value = "fillReport")
	public void fillReport(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//组装报表数据模型
		AOSReportModel reportModel = new AOSReportModel();
		Dto parameters = Dtos.newDto();
		parameters.put("create_user_", WebCxt.getUserInfo(session).getName_());
		//设置报表参数型
		reportModel.setParametersDto(parameters);
		Dto inDto = Dtos.newDto();
		inDto.setPageStart(0);
		inDto.setPageLimit(25);
		//只获取25条作为报表的演示数据
		List<Demo_accountPO> list = demo_accountMapper.listPage(inDto);
		for (Demo_accountPO demo_accountPO : list) {
			demo_accountPO.setCard_type_(WebCxt.getDicCodeDesc("card_type_", demo_accountPO.getCard_type_()));
		}
		//设置报表集合
		reportModel.setFieldsList(list);
		//设置报表模版的编译文件
		reportModel.setJasperFile(session.getServletContext().getRealPath("/WEB-INF/template/report/AccountDetails.jasper"));
		//填充报表
		AOSPrint aosPrint = AOSReport.fillReport(reportModel);
		//这个设置主要是下载报表文件时候使用的缺省文件名
		aosPrint.setFileName("信用卡账户信息报表");
		//设置缺省的AOSPrint对象到会话中。
		session.setAttribute(AOSReport.DEFAULT_AOSPRINT_KEY, aosPrint);
		WebCxt.write(response, AOSJson.toJson(Dtos.newOutDto()));
	}
}
