package cn.osworks.aos.demo.modules.controller;

import java.io.File;
import java.io.IOException;
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
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 标签库UI演示
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "/demo/ui1/")
public class UIController2 {
	
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;

	@RequestMapping(value = "listComboBoxData")
	public void listComboBoxData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Dto> list = Lists.newArrayList();
		Dto dto = Dtos.newDto();
		dto.put("value", 1);
		dto.put("display", "中国");
		list.add(dto);
		Dto dto1 = Dtos.newDto();
		dto1.put("value", 2);
		dto1.put("display", "阿富汗");
		list.add(dto1);
		String jsonString = AOSJson.toJson(list);
		response.getWriter().write(jsonString);
	}

	/**
	 * 列出系统目录树状结构
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listFileTree")
	public void listFileTree(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dto queryDto = Dtos.newDto(request);
		List<TreeNode> fileList = Lists.newArrayList();
		File file = new File(queryDto.getString("path"));
		if (file.exists()) {
			File[] subFiles = file.listFiles();
			for (File subFile : subFiles) {
				TreeNode treeNode = new TreeNode();
				String path = subFile.getAbsolutePath();
				treeNode.setId(path);
				String filename = subFile.getName();
				if (StringUtils.startsWith(filename, "."))
					continue;
				if (filename.equalsIgnoreCase("classes"))
					continue;
				treeNode.setText(filename);
				if (subFile.isDirectory()) {
					treeNode.setA("1"); // 目录
					if (StringUtils.contains(path, "java\\")) {
						treeNode.setIcon("icon34.gif");
					} else if (StringUtils.contains(path, "webapp\\")) {
						treeNode.setIcon("icon42.gif");
					} else {
						treeNode.setIcon("icon35.gif");
					}
					if (filename.equalsIgnoreCase("lib")) {
						treeNode.setIcon("icon41.gif");
					}
					if (filename.equalsIgnoreCase("webapp")) {
						treeNode.setIcon("icon42.gif");
					}
					treeNode.setLeaf(false);
				} else {
					treeNode.setA("2"); // 文件
					treeNode.setLeaf(true);
					if (StringUtils.endsWith(filename, "java")) {
						treeNode.setIcon("icon36.gif");
					} else if (StringUtils.endsWith(filename, "xml")) {
						treeNode.setIcon("icon39.gif");
					} else if (StringUtils.endsWith(filename, "js")) {
						treeNode.setIcon("icon37.gif");
					} else if (StringUtils.endsWith(filename, "jsp")) {
						treeNode.setIcon("icon26.gif");
					} else if (StringUtils.endsWith(filename, "png") || StringUtils.endsWith(filename, "gif")
							|| StringUtils.endsWith(filename, "ico") || StringUtils.endsWith(filename, "jpg")) {
						treeNode.setIcon("icon43.gif");
					} else if (StringUtils.endsWith(filename, "jar")) {
						treeNode.setIcon("icon31.gif");
					} else {
						treeNode.setIcon("icon38.gif");
					}
				}
				if (treeNode.getText().equalsIgnoreCase("src") || treeNode.getText().equalsIgnoreCase("webapp")) {
					treeNode.setExpanded(true);
				}
				fileList.add(treeNode);
			}
		} else {

		}
		String jsonString = AOSJson.toJson(fileList);
		response.getWriter().write(jsonString);
		AOSUtils.debug(jsonString);
	}

	/**
	 * 树测试
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listTreeNodes")
	public void listTreeNodes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dto queryDto = Dtos.newDto(request);
		// queryDto.put("az02a3", queryDto.getString("node"));
		List<Dto> list = sqlDao.list("Cases.selectAz02POs", queryDto);
		// 对原始集合进行加工，变为UI树节点能识别的属性。也可以直接在sql语句上加工
		for (Dto dto : list) {
			dto.put("id", dto.getString("az02a0"));
			dto.put("text", dto.getString("az02a2"));
			dto.put("qtip", dto.getString("az02a2"));
			// dto.put("expanded", true);
			int az02a6 = dto.getInteger("az02a6");
			if (az02a6 == 1) {
				dto.put("leaf", true);
			} else {
				dto.put("leaf", false);
			}
		}
		String jsonString = AOSJson.toJson(list);
		response.getWriter().write(jsonString);
	}

	/**
	 * 树测试(异步,一次性加载全部节点) 也可以改造为半异步
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listAllTreeNodes")
	public void listAllTreeNodes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 根节点由TreePanel生成
		TreeNode node1 = new TreeNode();
		node1.setId("01");
		node1.setText("节点1");
		node1.setLeaf(true);
		TreeNode node2 = new TreeNode();
		node2.setId("02");
		node2.setText("节点2");
		node2.setLeaf(false);
		TreeNode node3 = new TreeNode();
		node3.setId("03");
		node3.setText("节点3");
		node3.setLeaf(true);
		node2.appendChild(node3);
		List<TreeNode> list = Lists.newArrayList();
		list.add(node1);
		list.add(node2);
		Dto dto = Dtos.newDto();
		// 必须叫做children，Ext树模型数据规范
		dto.put("children", list);
		String jsonString = AOSJson.toJson(dto);
		response.getWriter().write(jsonString);
	}
	
	/**
	 * 树测试，级联选择
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listAllTreeNodes4Cascade")
	public void listAllTreeNodes4Cascade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 根节点由TreePanel生成
		TreeNode node1 = new TreeNode();
		node1.setId("01");
		node1.setText("节点1");
		node1.setChecked(false);
		TreeNode node2 = new TreeNode();
		node2.setId("02");
		node2.setText("节点2");
		node2.setLeaf(true);
		node2.setChecked(false);
		node1.appendChild(node2);
		TreeNode node3 = new TreeNode();
		node3.setId("03");
		node3.setText("节点3");
		node3.setLeaf(false);
		node3.setChecked(false);
		node1.appendChild(node3);
		TreeNode node4 = new TreeNode();
		node4.setId("04");
		node4.setText("节点4");
		node4.setLeaf(true);
		node4.setChecked(false);
		node3.appendChild(node4);
		TreeNode node5 = new TreeNode();
		node5.setId("05");
		node5.setText("节点5");
		node5.setLeaf(true);
		node5.setChecked(false);
		node3.appendChild(node5);
		Dto dto = Dtos.newDto();
		// 必须叫做children，Ext树模型数据规范
		dto.put("children", node1);
		String jsonString = AOSJson.toJson(dto);
		response.getWriter().write(jsonString);
	}

	/**
	 * 树测试: TreeGrid
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listTreeGridNodes")
	public void listTreeGridNodes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dto queryDto = Dtos.newDto(request);
		List<?> list = sqlDao.list("Cases.selectAz02POs", queryDto);
		// 对原始集合进行加工，变为UI树节点能识别的属性。也可以直接在sql语句上加工
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (Dto) list.get(i);
			// id字段是必须要转换的,否则异步加载传参就娶不到参数值了
			dto.put("id", dto.getString("az02a0"));
			int az02a6 = dto.getInteger("az02a6");
			if (az02a6 == 1) {
				dto.put("leaf", true);
			} else {
				dto.put("leaf", false);
			}
		}
		String jsonString = AOSJson.toJson(list);
		response.getWriter().write(jsonString);
	}

	/**
	 * 测试Ajax请求提交
	 * 
	 * @param session
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "doLogin")
	public void doLogin(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		dto.println();
		Dto outDto = Dtos.newDto();
		outDto.put("msg", "系统登录成功");
		String jsonString = AOSJson.toJson(outDto);
		WebCxt.write(response, jsonString);
	}
	
	/**
	 * 获取表格选择行(指定字段)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "saveSelect")
	public void saveSelect(HttpServletRequest request,  HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		String[] selected = qDto.getRows();
		AOSUtils.debug("====表格选中行(指定字段)输出====");
		for (String string : selected) {
			AOSUtils.debug(string);
		}
		WebCxt.write(response, "数据已传入后台，请查看控制台输出信息。");
	}
	
	/**
	 * 获取表格选择行
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "saveSelect2")
	public void saveSelect2(HttpServletRequest request,  HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> tablesList = qDto.getRows();
		AOSUtils.debug("====表格选中行输出====");
		for (Dto dto : tablesList) {
			dto.println();
		}
		WebCxt.write(response, "数据已传入后台，请查看控制台输出信息。");
	}
	
	/**
	 * 树测试: 一次从数据库中加载全部节点
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "listAllTreeNodes4FromDB")
	public void listAllTreeNodes4FromDB(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Aos_sys_modulePO> aos_sys_modulePOs = aos_sys_moduleMapper.list(null);
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			treeNode.setChecked(false);
			boolean leaf = true;
			if (aos_sys_modulePO.getIs_leaf_().equals("0")) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_sys_modulePO.getIs_auto_expand_().equals("0")) {
				expanded = false;
			}
			treeNode.setExpanded(expanded);
			treeNodes.add(treeNode);
		}
		String jsonString = TreeBuilder.build(treeNodes);
		response.getWriter().write(jsonString);
	}
	
}
