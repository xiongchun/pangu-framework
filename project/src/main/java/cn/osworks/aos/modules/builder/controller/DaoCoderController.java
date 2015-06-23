package cn.osworks.aos.modules.builder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.base.asset.AOSCxt;
import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.builder.dao.vo.TableVO;
import cn.osworks.aos.modules.builder.service.DaoCoderService;


/**
 * Dao代码生成
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Controller
@RequestMapping(value = "system/daoCoder/")
public class DaoCoderController {

	@Autowired
	private DaoCoderService daoCoderService;

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
		if (AOSCxt.isPostgreSQL(sqlDao)) {
			request.setAttribute("col_emptytext", "字段列名称");
			request.setAttribute("table_emptytext", "数据表名称");
		} else {
			request.setAttribute("col_emptytext", "字段列名称|注释");
			request.setAttribute("table_emptytext", "数据表名称|注释");
		}
		return "aos/builder/daoCoder.jsp";
	}

	/**
	 * 查询待选数据表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listTables")
	public void listTables(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<TableVO> tableVOs = daoCoderService.listTables(qDto);
		for (TableVO tableVO : tableVOs) {
			tableVO.setAlias(StringUtils.capitalize(tableVO.getName()));
		}
		String outString = AOSJson.toGridJson(tableVOs, tableVOs.size());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 列出工程目录树状结构
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listProjectTree")
	public void listProjectTree(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dto queryDto = Dtos.newDto(request);
		if (queryDto.getString("path").equals("_aosroot")) {
			//根节点
			queryDto.put("path", System.getProperty("user.dir"));
		}
	    List<Dto> fileList = daoCoderService.listProjectView(queryDto);  
		String jsonString = AOSJson.toJson(fileList);
		response.getWriter().write(jsonString);
	}

	/**
	 * 生成代码
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "saveCode")
	public void saveCode(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.put("package", qDto.getString("basepath"));
		daoCoderService.saveCode(qDto);
		WebCxt.write(response, "代码生成成功，请刷新工程后重启应用服务器。");
	}

}
