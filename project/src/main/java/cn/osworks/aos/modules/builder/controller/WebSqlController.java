package cn.osworks.aos.modules.builder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.base.asset.AOSCxt;
import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;
import cn.osworks.aos.modules.builder.service.DaoCoderService;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 数据对象管理
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Controller
@RequestMapping(value = "system/webSql/")
public class WebSqlController {
	
	@Autowired
	private DaoCoderService daoCoderService;
	
	@Autowired
	private SqlDao sqlDao;
	
	/**
	 * 页面初始化
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpServletRequest request) {
		if (AOSCxt.isPostgreSQL(sqlDao)) {
			request.setAttribute("col_emptytext", "字段列名称");
			request.setAttribute("table_emptytext", "数据表名称");
		}else {
			request.setAttribute("col_emptytext", "字段列名称|注释");
			request.setAttribute("table_emptytext", "数据表名称|注释");
		}
		return "aos/builder/webSql.jsp";
	}

	/**
	 * 查询数据表字段
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listTableCols")
	public void listTableCols(HttpServletRequest request, HttpServletResponse response) {
		Dto pDto = Dtos.newDto(request);
		List<ColumnVO> columnVOs = daoCoderService.listColumns(pDto);
		String outString = AOSJson.toGridJson(columnVOs, pDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 查询数据表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listTables")
	public void listTables(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<TreeNode> treeNodes = daoCoderService.listTablesAsTree(qDto);
		String outString = AOSJson.toJson(treeNodes);
		WebCxt.write(response, outString);
	}
}
