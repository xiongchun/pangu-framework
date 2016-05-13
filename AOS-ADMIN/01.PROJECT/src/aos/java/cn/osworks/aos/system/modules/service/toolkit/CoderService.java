package cn.osworks.aos.system.modules.service.toolkit;

import java.io.File;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.builder.DaoBuilder;
import cn.osworks.aos.builder.metainfo.DBMetaInfoUtils;
import cn.osworks.aos.builder.metainfo.vo.ColumnVO;
import cn.osworks.aos.builder.metainfo.vo.TableVO;
import cn.osworks.aos.core.asset.AOSListUtils;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 代码生成器服务
 * 
 * @author AHei
 */
@Service
public class CoderService {

	@Autowired
	private SqlDao sqlDao;

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
	 * @throws SQLException
	 */
	public List<TableVO> listTables(Dto inDto) throws SQLException {
		List<TableVO> tableVOs = DBMetaInfoUtils.listTableVOs(DBMetaInfoUtils.getDatabaseMetaData(),
				inDto.getString("name_"));
		for (TableVO tableVO : tableVOs) {
			if (AOSUtils.isEmpty(tableVO.getComment()) || StringUtils.startsWithIgnoreCase(tableVO.getComment(), "InnoDB")) {
				tableVO.setComment(tableVO.getName());
			}
		}
		return tableVOs;
	}

	/**
	 * 查询数据表注释
	 * 
	 * @param tableNameString
	 * @return
	 */
	public String selectTableComment(String tableNameString) {
		String commnet = "";
		return commnet;
	}

	/**
	 * 生成项目结构树
	 * 
	 * @param queryDto
	 * @return
	 */
	public List<TreeNode> listProjectView(Dto queryDto) {
		List<TreeNode> fileList = Lists.newArrayList();
		String path = queryDto.getString("path");
		if (StringUtils.equalsIgnoreCase("aosroot_", path)) {
			// 根节点
			String coder_project_rootpath_ = WebCxt.getCfgOfDB("coder_project_rootpath_");
			if (StringUtils.equals(coder_project_rootpath_, "0")) {
				path = System.getProperty("user.dir");
			} else {
				path = coder_project_rootpath_;
			}
		}
		File file = new File(path);
		if (file.exists()) {
			File[] subFiles = file.listFiles();
			for (File subFile : subFiles) {
				TreeNode treeNode = new TreeNode();
				String subPath = subFile.getAbsolutePath();
				treeNode.setId(subPath);
				String filename = subFile.getName();
				if (StringUtils.startsWith(filename, "."))
					continue;
				if (filename.equalsIgnoreCase("classes"))
					continue;
				if (filename.equalsIgnoreCase("icon"))
					continue;
				if (filename.equalsIgnoreCase("image"))
					continue;
				if (filename.equalsIgnoreCase("data") || filename.equalsIgnoreCase("report")
						|| filename.equalsIgnoreCase("tld") || filename.equalsIgnoreCase("lib")
						|| filename.equalsIgnoreCase("db"))
					continue;
				treeNode.setText(filename);
				if (subFile.isDirectory()) {
					// 目录
					treeNode.setA("1");
					if (StringUtils.contains(subPath, "java\\")) {
						// java package
						treeNode.setIcon("icon34.gif");
						// 目录类型：java源文件包
						treeNode.setB("1");
						String pkgpath = StringUtils.substringAfter(subPath, "java\\");
						pkgpath = pkgpath.replace("\\", ".");
						treeNode.setC(pkgpath);
					} else if (StringUtils.contains(subPath, "webapp\\")) {
						treeNode.setIcon("icon42.gif");
					} else {
						treeNode.setIcon("icon35.gif");
					}
					if (filename.equalsIgnoreCase("webapp")) {
						treeNode.setIcon("icon42.gif");
					}
					treeNode.setLeaf(false);
				} else {
					// 文件
					treeNode.setA("2");
					treeNode.setLeaf(true);
					if (StringUtils.endsWith(filename, "java")) {
						treeNode.setIcon("icon36.gif");
					} else if (StringUtils.endsWith(filename, "xml")) {
						treeNode.setIcon("icon39.gif");
					} else if (StringUtils.endsWith(filename, "js")) {
						treeNode.setIcon("icon37.gif");
					} else if (StringUtils.endsWith(filename, "jsp")) {
						treeNode.setIcon("icon26.gif");
					} else {
						treeNode.setIcon("icon38.gif");
					}
				}
				if (StringUtils.equalsIgnoreCase("webapp", treeNode.getText())
						|| StringUtils.equalsIgnoreCase("WEB-INF", treeNode.getText())
						|| StringUtils.equalsIgnoreCase("src", treeNode.getText())) {
					treeNode.setExpanded(true);
				}
				fileList.add(treeNode);
			}
		}
		// 重排序，树枝节点排在前面
		String jqlText = "SELECT * FROM :AOSList ORDER BY toNumber(a) ASC";
		fileList = AOSListUtils.select(fileList, TreeNode.class, jqlText, null);
		return fileList;
	}

	/**
	 * 生成Dao代码
	 * @throws SQLException 
	 */
	public void buildDaoCode(Dto inDto) throws SQLException {
		inDto.put("package", inDto.getString("package_"));
		inDto.put("author", "AHei");
		String[] tables = inDto.getRows();
	    DatabaseMetaData databaseMetaData = DBMetaInfoUtils.getDatabaseMetaData();
		for (String tableName : tables) {
			TableVO tableVO = DBMetaInfoUtils.getTableVO(databaseMetaData, tableName);
			if (AOSUtils.isEmpty(tableVO)) {
				throw new AOSException("表[" + tableName + "]不存在。");
			}
			inDto.put("tableVO", tableVO);
			List<ColumnVO> columnVOs = DBMetaInfoUtils.listColumnVOs(databaseMetaData, tableName);
			//仅生成XMLMapper时需要
			List<ColumnVO> pkeyColumnVOs = DBMetaInfoUtils.getPKColumnVOs(columnVOs);
			inDto.put("columnVOs", columnVOs);
			inDto.put("pkeyColumnVOs", pkeyColumnVOs);
			DaoBuilder.buildPO(inDto);
			DaoBuilder.buildJavaMapper(inDto);
			DaoBuilder.buildXmlMapper(inDto);
		}
	}

}
