package cn.osworks.aos.demo.modules.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.demo.dao.mapper.Demo_accountMapper;
import cn.osworks.aos.demo.dao.po.Demo_accountPO;

import com.google.common.collect.Lists;

/**
 * 标签库Grid组件演示控制器
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "demo/grid")
public class GridController {
	
	@Autowired
    private SqlDao sqlDao;
	@Autowired
	private Demo_accountMapper demo_accountMapper;

	/**
	 * 基本表格页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initGrid1")
	public String initGrid1() {
		
		return "demo/grid/grid1.jsp";
	}

	/**
	 * 基本表格页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initGrid2")
	public String initGrid2() {
		return "demo/grid/grid2.jsp";
	}
	
	/**
	 * 客户端分页表格页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initGrid3")
	public String initGrid3() {
		return "demo/grid/grid3.jsp";
	}

	/**
	 * 可编辑表格页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initEditGrid")
	public String initEditGrid() {
		return "demo/grid/gridEdit.jsp";
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
		List<Demo_accountPO> list = demo_accountMapper.listPage(inDto);
		// 神奇的inDto又显神功了，它里面还包含了分页查询记录总条数喔。
		String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
		// 就这样返回转换为Json后返回界面就可以了。
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询信用卡账户列表
	 * 
	 * <p>客户端内存分页：一次性查询数据后全部丢给客户端，由客户端自己完成分页和排序操作。
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listAccounts4ClientPage")
	public void listAccounts4ClientPage(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Demo_accountPO> list = sqlDao.list("Demo.listAccounts4Client", inDto);
		WebCxt.write(response, AOSJson.toGridJson(list));
	}

	/**
	 * 获取表格选择行(指定字段)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "saveSelect")
	public void saveSelect(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String[] selected = inDto.getRows();
		AOSUtils.debug("====表格选中行(指定字段)输出====");
		for (String string : selected) {
			AOSUtils.debug(string);
		}
		WebCxt.write(response, "后台已接收，请查看控制台。");
	}

	/**
	 * 获取表格选择行
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "saveSelect2")
	public void saveSelect2(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Dto> list = inDto.getRows();
		AOSUtils.debug("====表格选中行输出====");
		for (Dto dto : list) {
			dto.println();
		}
		WebCxt.write(response, "后台已接收，请查看控制台。");
	}

	/**
	 * 编辑表格
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "editGrid")
	public void editGrid(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		//根据是否有id_值来区分是新增还是修改
		AOSUtils.debug("====表格编辑行数据[含新增的和修改的]====");
		inDto.println();
		WebCxt.write(response, "后台已接收，请查看控制台。");
	}
	
	/**
	 * 编辑表格3
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "editGrid3")
	public void editGrid3(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		List<Dto> modifies = inDto.getRows();
		//根据是否有id_值来区分是新增还是修改
		AOSUtils.debug("====表格编辑数据[含新增的和修改的]====");
		for (Dto dto : modifies) {
			dto.println();
		}
		WebCxt.write(response, "后台已接收，请查看控制台。");
	}
	
	/**
	 * 可编辑表格下拉选择框服务器端数据源
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listComboBoxData")
	public void listComboBoxData(HttpServletRequest request, HttpServletResponse response) {
		List<Dto> list = Lists.newArrayList();
		Dto dto1 = Dtos.newDto("display", "男");
		dto1.put("value", "1");
		list.add(dto1);
		Dto dto2 = Dtos.newDto("display", "女");
		dto2.put("value", "2");
		list.add(dto2);
		Dto dto3 = Dtos.newDto("display", "未知");
		dto3.put("value", "3");
		list.add(dto3);
		WebCxt.write(response, AOSJson.toJson(list));
	}

}
