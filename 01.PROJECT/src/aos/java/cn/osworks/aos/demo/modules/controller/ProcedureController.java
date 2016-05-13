package cn.osworks.aos.demo.modules.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.dao.asset.DBType;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.demo.modules.service.MiscService;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;

/**
 * 存储过程调用控制器
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "demo/procedure")
public class ProcedureController {

	@Autowired
	private MiscService miscService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;

	/**
	 * 调用存储过程页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "init")
	public String initGrid1() {
		return "demo/procedure.jsp";
	}

	/**
	 * 存储过程调用1
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "callProc1")
	public void callProc1(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		// 范例只做了Oracle存储过程的演示，其它数据库调用方法是一样的。自己实现相应DB的存储过程即可。
		if (!StringUtils.equalsIgnoreCase(DBType.ORACLE, sqlDao.getDatabaseId())) {
			BigDecimal balance_ = inDto.getBigDecimal("number1_").subtract(inDto.getBigDecimal("number2_"));
			inDto.put("outstring",
			AOSUtils.merge("你好,  {0}。你的可用余额为：{1} 元。", inDto.getString("name_"), String.valueOf(balance_)));
			WebCxt.write(response, AOSJson.toJson(inDto));
		}else {
			Dto outDto = miscService.callProc1(inDto);
			WebCxt.write(response, AOSJson.toJson(outDto));
		}
	}

	/**
	 * 存储过程调用2
	 * <p> 返回游标结果集
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "callProc2")
	public void callProc2(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		// 范例只做了Oracle存储过程的演示，其它数据库调用方法是一样的。自己实现相应DB的存储过程即可。
		if (!StringUtils.equalsIgnoreCase(DBType.ORACLE, sqlDao.getDatabaseId())) {
			List<Aos_sys_modulePO> list = aos_sys_moduleMapper.like(inDto);
			WebCxt.write(response, AOSJson.toGridJson(list));
		}else {
			List<Dto> outList = miscService.callProc2(inDto);
			WebCxt.write(response, AOSJson.toGridJson(outList));
		}
	}

}
