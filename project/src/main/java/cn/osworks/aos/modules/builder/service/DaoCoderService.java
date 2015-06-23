package cn.osworks.aos.modules.builder.service;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;


import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSCxt;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.asset.AOSXmlParam;
import cn.osworks.aos.base.exception.AOSException;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;
import cn.osworks.aos.modules.builder.dao.vo.TableVO;
import cn.osworks.aos.modules.builder.factory.IMetaService;
import cn.osworks.aos.modules.builder.factory.IMetaServiceFactory;
import cn.osworks.aos.modules.builder.factory.MakeFileService;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 开发工具箱服务
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Service
public class DaoCoderService {

	/**
	 * 列出表字段
	 * 
	 * @return
	 */
	public List<ColumnVO> listColumns(Dto pDto) {
		String dbName = AOSCxt.sqlDao.getSqlSession().getConfiguration().getDatabaseId();
		IMetaService iMetaService = IMetaServiceFactory.getService(dbName);
		List<ColumnVO> columnVOs = iMetaService.listColumns(pDto);
		for (ColumnVO columnVO : columnVOs) {
			Dto tableDto = Dtos.newDto();
			tableDto.put("tablename", columnVO.getTablename());
			String tableComment = iMetaService.selectTableComment(columnVO.getTablename());
			if (AOSUtils.isNotEmpty(tableComment)) {
				columnVO.setTablename(columnVO.getTablename() + "(" + tableComment + ")");
			}
		}
		return columnVOs;
	}

	/**
	 * 列出数据表(树状结构)
	 * 
	 * @return
	 */
	public List<TreeNode> listTablesAsTree(Dto pDto) {
		String dbName = AOSCxt.sqlDao.getSqlSession().getConfiguration().getDatabaseId();
		IMetaService iMetaService = IMetaServiceFactory.getService(dbName);
		List<TableVO> tableVOs = iMetaService.listTables(pDto);
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
		String dbName = AOSCxt.sqlDao.getSqlSession().getConfiguration().getDatabaseId();
		IMetaService iMetaService = IMetaServiceFactory.getService(dbName);
		List<TableVO> tableVOs = iMetaService.listTables(pDto);
		for (TableVO tableVO : tableVOs) {
			String name_comment = tableVO.getName();
			if (AOSUtils.isNotEmpty(tableVO.getComment())) {
				name_comment = name_comment + "(" + tableVO.getComment() + ")";
			}
			tableVO.setName_comment(name_comment);
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
		String dbName = AOSCxt.sqlDao.getSqlSession().getConfiguration().getDatabaseId();
		IMetaService iMetaService = IMetaServiceFactory.getService(dbName);
		String commnet = iMetaService.selectTableComment(tableNameString);
		return commnet;
	}

	/**
	 * 生成项目结构树
	 * 
	 * @param queryDto
	 * @return
	 */
	public List<Dto> listProjectView(Dto queryDto) {
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlParam.getValue("icon_path");
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
	
	/**
	 * 生成代码
	 */
	public void saveCode(Dto qDto){
		qDto.println();
		if (AOSUtils.isEmpty(qDto.getString("outPath"))) {
			throw new AOSException("sys-005", "outPath");
		}
		if (AOSUtils.isEmpty(qDto.getString("package"))) {
			throw new AOSException("sys-005", "package");
		}
		String[] tables = qDto.getSelection();
		SqlDao sqlDao = AOSCxt.sqlDao;
		String dbName = sqlDao.getSqlSession().getConfiguration().getDatabaseId();
		//获取不同数据方言的服务实现
		IMetaService iMetaService = IMetaServiceFactory.getService(dbName);
		for (String table : tables) {
			qDto.put("tablename", table);
			TableVO tableVO = iMetaService.selectTable(qDto);
			tableVO.setUpname(StringUtils.capitalize(tableVO.getName()));
			tableVO.setCacheEnabled(true);
			qDto.put("tableVO", tableVO);
			qDto.setPageStart(0);
			qDto.setPageLimit(Integer.MAX_VALUE);
			List<ColumnVO> columnVOs = iMetaService.listColumns(qDto);
			qDto.put("columnVOs", columnVOs);
			MakeFileService makeFileService = (MakeFileService) AOSCxt.getBean("makeFileService");
			makeFileService.buildPO(qDto);
			makeFileService.buildJavaMapper(qDto);
			makeFileService.buildXmlMapper(qDto);
		}
	}

}
