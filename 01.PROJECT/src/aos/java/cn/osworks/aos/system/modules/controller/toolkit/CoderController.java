package cn.osworks.aos.system.modules.controller.toolkit;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.builder.metainfo.vo.TableVO;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.toolkit.CoderService;
import cn.osworks.aos.web.tag.core.model.TreeNode;

/**
 * 代码生成器控制器
 * 
 * @author XiongChun
 * @date 2014-06-16
 */
@Controller
@RequestMapping(value = "system/coder")
public class CoderController {

	@Autowired
	private CoderService coderService;

	@Autowired
	private SqlDao sqlDao;

	/**
	 * 主页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		request.setAttribute("app_name_", WebCxt.getCfgOfDB("app_name_"));
		request.setAttribute("page_load_msg_", WebCxt.getCfgOfDB("page_load_msg_"));
		return "aos/toolkit/coder/coder.jsp";
	}
	
	/**
	 * 文件页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "fileInit")
	public String fileInit(HttpSession session, HttpServletRequest request) {
		return "aos/toolkit/coder/fileDetail.jsp";
	}

	/**
	 * 查询待选数据表
	 * 
	 * @param request
	 * @param response
	 * @throws SQLException 
	 */
	@RequestMapping(value = "listTables")
	public void listTables(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws SQLException {
		Dto inDto = Dtos.newDto(request);
		List<TableVO> tableVOs = coderService.listTables(inDto);
		String outString = AOSJson.toGridJson(tableVOs);
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
	    List<TreeNode> fileList = coderService.listProjectView(queryDto);  
		String jsonString = AOSJson.toJson(fileList);
		response.getWriter().write(jsonString);
	}

	/**
	 * 生成Dao代码
	 * 
	 * @param request
	 * @param response
	 * @throws SQLException 
	 */
	@RequestMapping(value = "buildDaoCode")
	public void buildDaoCode(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws SQLException {
		if (StringUtils.equals(WebCxt.getCfgOfDB("run_mode_"), "2")) {
			throw new AOSException();
		}
		Dto inDto = Dtos.newDto(request);
		coderService.buildDaoCode(inDto);
		WebCxt.write(response, "Dao代码生成成功，请刷新工程后重启服务器。");
	}

}
