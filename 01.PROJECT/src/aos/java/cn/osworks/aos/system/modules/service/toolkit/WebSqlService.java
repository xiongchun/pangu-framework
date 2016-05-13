package cn.osworks.aos.system.modules.service.toolkit;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import cn.osworks.aos.builder.metainfo.vo.ColumnVO;
import cn.osworks.aos.builder.metainfo.vo.TableVO;
import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 开发工具箱服务
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Service
public class WebSqlService {

	/**
	 * 列出表字段
	 * 
	 * @return
	 */
	public List<ColumnVO> listColumns(Dto pDto) {
		return null;
	}

	/**
	 * 列出数据表(树状结构)
	 * 
	 * @return
	 */
	public List<TreeNode> listTablesAsTree(Dto pDto) {
		List<TableVO> tableVOs = Lists.newArrayList();
		List<TreeNode> tableList = Lists.newArrayList();
		for (TableVO tableVO : tableVOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId("_id" + tableVO.getName());
			treeNode.setA(tableVO.getName());
			String text = tableVO.getName();
			String comment = tableVO.getComment();
			treeNode.setQtip(comment);
			if (AOSUtils.isNotEmpty(comment)) {
				if (comment.length() >= 10) {
					comment = StringUtils.substring(comment, 0, 9);
					comment = comment + "...";
				}
				text = text + "(" + comment + ")";
			}
			treeNode.setText(text);
			treeNode.setLeaf(true);
			treeNode.setIcon("table.png");
			tableList.add(treeNode);
		}
		return tableList;
	}

	/**
	 * 列出数据表
	 * 
	 * @return
	 */
	public List<TableVO> listTables(Dto pDto) {
		return null;
	}

	/**
	 * 生成项目结构树
	 * 
	 * @param queryDto
	 * @return
	 */
	public List<Dto> listProjectView(Dto queryDto) {
		if (queryDto.getString("path").equals("_aosroot")) {
			//根节点
			queryDto.put("path", System.getProperty("user.dir"));
		}
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlOptionsHandler.getValue("icon_path");
		List<Dto> fileList = Lists.newArrayList();
		File file = new File(queryDto.getString("path"));
		if (file.exists()) {
			File[] subFiles = file.listFiles();
			for (File subFile : subFiles) {
				Dto treeNode = Dtos.newDto();
				String path = subFile.getAbsolutePath();
				treeNode.put("id", path);
				String filename = subFile.getName();
				if (StringUtils.startsWith(filename, "."))
					continue;
				if (filename.equalsIgnoreCase("classes"))
					continue;
				treeNode.put("text", filename);
				if (subFile.isDirectory()) {
					treeNode.put("type", "1");// 目录
					if (StringUtils.contains(path, "java\\")) {
						//java package
						treeNode.put("icon", iconPath + "icon34.gif");
						//目录类型：java源文件包
						treeNode.put("dtype", "1");
						String pkgpath = StringUtils.substringAfter(path, "java\\");
						pkgpath = pkgpath.replace("\\", ".");
						treeNode.put("pkgpath", pkgpath);
					} else if (StringUtils.contains(path, "webapp\\")) {
						treeNode.put("icon",  iconPath + "icon42.gif");
					} else {
						treeNode.put("icon",  iconPath + "icon35.gif");
					}
					if (filename.equalsIgnoreCase("lib")) {
						treeNode.put("icon",  iconPath + "icon41.gif");
					}
					if (filename.equalsIgnoreCase("webapp")) {
						treeNode.put("icon",  iconPath + "icon42.gif");
					}
					treeNode.put("leaf", false);
				} else {
					treeNode.put("type", "2");// 文件
					treeNode.put("leaf", true);
					if (StringUtils.endsWith(filename, "java")) {
						treeNode.put("icon",  iconPath + "icon36.gif");
					} else if (StringUtils.endsWith(filename, "xml")) {
						treeNode.put("icon",  iconPath + "icon39.gif");
					} else if (StringUtils.endsWith(filename, "js")) {
						treeNode.put("icon",  iconPath + "icon37.gif");
					} else if (StringUtils.endsWith(filename, "jsp")) {
						treeNode.put("icon",  iconPath + "icon26.gif");
					} else if (StringUtils.endsWith(filename, "png") || StringUtils.endsWith(filename, "gif")
							|| StringUtils.endsWith(filename, "ico") || StringUtils.endsWith(filename, "jpg")) {
						treeNode.put("icon",  iconPath + "icon43.gif");
					} else if (StringUtils.endsWith(filename, "jar")) {
						treeNode.put("icon",  iconPath + "icon31.gif");
					} else {
						treeNode.put("icon",  iconPath + "icon38.gif");
					}
				}
				String text = treeNode.getString("text");
				if (text.equalsIgnoreCase("src") || text.equalsIgnoreCase("webapp")) {
					treeNode.put("expanded", true);
				}
				fileList.add(treeNode);
			}
		} else {

		}
		return fileList;
	}

}
