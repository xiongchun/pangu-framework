package cn.osworks.aos.system.modules.controller.toolkit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.builder.metainfo.vo.ColumnVO;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.toolkit.WebSqlService;
import cn.osworks.aos.web.tag.core.model.TreeNode;

/**
 * 数据对象管理
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Controller
@RequestMapping(value = "system/webSql")
public class WebSqlController {
	
	@Autowired
	private WebSqlService daoCoderService;
	
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
		request.setAttribute("col_emptytext", "字段列名称");
		request.setAttribute("table_emptytext", "数据表名称");
		return "aos/toolkit/webSql.jsp";
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
