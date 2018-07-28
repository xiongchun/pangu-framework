package com.gitee.myclouds.builder.service;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.builder.util.BuilderUtil;
import com.gitee.myclouds.builder.util.DBMetaInfoUtil;
import com.gitee.myclouds.builder.vm.Resources;
import com.gitee.myclouds.builder.vo.ColumnVO;
import com.gitee.myclouds.builder.vo.IndexVO;
import com.gitee.myclouds.builder.vo.TableVO;
import com.gitee.myclouds.toolbox.util.MyUtil;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;
import com.xiaoleilu.hutool.date.DateUtil;
import com.xiaoleilu.hutool.util.StrUtil;

/**
 * Domain代码生成服务
 * 
 * @author xiongchun
 * @date 2016-01-01
 */
@Service
public class BuildDomainService {

	private static Logger log = LoggerFactory.getLogger(BuildDomainService.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Value("${my.builder.author}")
	private String author;
	@Value("${my.builder.domain.outFilePath}")
	private String outFilePath;
	@Value("${my.builder.domain.packagePath}")
	private String packagePath;
	@Value("${my.builder.domain.tables}")
	private String tables;
	@Value("${my.builder.domain.target}")
	private String target;

	/**
	 * 初始化Dao配置
	 * 
	 * @return
	 */
	private Dto initDaoConfiguration() {
		Dto cfgDto = Dtos.newDto();
		cfgDto.put("author", author);
		cfgDto.put("outPath", outFilePath);
		cfgDto.put("package", packagePath);
		cfgDto.put("tables", tables);
		cfgDto.put("target", target);
		return cfgDto;
	}

	/**
	 * 生成Domain代码
	 * 
	 * @param inDto
	 * @throws SQLException
	 */
	public void buildDomain() throws SQLException {
		Dto inDto = initDaoConfiguration();
		Connection connection = jdbcTemplate.getDataSource().getConnection();
		DatabaseMetaData databaseMetaData = connection.getMetaData();
		String tablesString = StrUtil.trim(inDto.getString("tables"));
		// ,号分隔的多张表
		String[] tables = tablesString.split(",");
		for (String tableName : tables) {
			TableVO tableVO = DBMetaInfoUtil.getTableVO(databaseMetaData, tableName);
			if (MyUtil.isEmpty(tableVO)) {
				log.warn("表[{}]不存在，请检查。", tableName);
				continue;
			}
			inDto.put("tableVO", tableVO);
			List<ColumnVO> columnVOs = DBMetaInfoUtil.listColumnVOs(databaseMetaData, tableName);
			List<ColumnVO> pkeyColumnVOs = DBMetaInfoUtil.getPKColumnVOs(columnVOs);
			List<IndexVO> indexVOs = DBMetaInfoUtil.listIndexVOs(databaseMetaData, tableName);
			inDto.put("columnVOs", columnVOs);
			inDto.put("pkeyColumnVOs", pkeyColumnVOs);
			inDto.put("indexVOs", indexVOs);
			String[] arrTarget = StringUtils.split(inDto.getString("target"), ",");
			for (String target : arrTarget) {
				if (StringUtils.equalsIgnoreCase(target, "entity")) {
					buildEntity(inDto);
					continue;
				}
				if (StringUtils.equalsIgnoreCase(target, "mapper")) {
					buildJavaMapper(inDto);
					buildXmlMapper(inDto);
					continue;
				}
			}
		}
		log.info("文件生成完成，请刷新工程目录。");

	}

	/**
	 * 生成*Entity.java
	 * 
	 * @param inDto
	 */
	public void buildEntity(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		Dto tableDto = BuilderUtil.convertTableVO(tableVO);
		@SuppressWarnings("unchecked")
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		List<Dto> columnDtos = BuilderUtil.convertColumnVO(columnVOs);
		String allLowName = tableDto.getString("allLowName");
		String packageString = inDto.getString("package") + "." + allLowName;
		Dto vmDto = Dtos.newDto();
		vmDto.put("columnDtos", columnDtos);
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", StringUtils.lowerCase(packageString));
		vmDto.put("importDto", BuilderUtil.getImportDto4PO(columnDtos));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", DateUtil.now());

		String outString = BuilderUtil.mergeFileTemplate(Resources.Entity_JAVA_VM, vmDto);
		String fileName = tableDto.getString("upname") + "Entity.java";
		try {
			String outPath = inDto.getString("outPath") + "/" + allLowName + "/";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + fileName);
			out.write(outString.getBytes());
			out.close();
			log.info("【{}】文件生成成功。[{}{}]", fileName, outPath, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成*Mapper.java
	 * 
	 * @param inDto
	 */
	public void buildJavaMapper(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		Dto tableDto = BuilderUtil.convertTableVO(tableVO);
		@SuppressWarnings("unchecked")
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		String allLowName = tableDto.getString("allLowName");
		String packageString = inDto.getString("package") + "." + allLowName;
		Dto vmDto = Dtos.newDto();
		vmDto.put("bykey", BuilderUtil.getByKeyStr(DBMetaInfoUtil.getPKColumnVOs(columnVOs)));
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", StringUtils.lowerCase(packageString));
		vmDto.put("package_base", inDto.getString("package"));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", DateUtil.now());
		List<Dto> columnDtos = BuilderUtil.convertColumnVO(columnVOs);
		vmDto.put("importDto", BuilderUtil.getImportDto4Dao(columnDtos));
		@SuppressWarnings("unchecked")
		List<IndexVO> indexVOs = (List<IndexVO>)inDto.get("indexVOs");
		vmDto.put("indexDtos", BuilderUtil.convertIndexVO(indexVOs));
		vmDto.put("importInColDto", BuilderUtil.getImportDto4DaoBasedIndexColumns(indexVOs));
		
		String outString = BuilderUtil.mergeFileTemplate(Resources.MAPPER_JAVA_VM, vmDto);
		String fileName = tableDto.getString("upname") + "Mapper.java";
		try {
			String outPath = inDto.getString("outPath") + "/" + allLowName + "/";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + fileName);
			out.write(outString.getBytes());
			out.close();
			log.info("【{}】文件生成成功。[{}{}]", fileName, outPath, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成*Mapper.xml
	 * 
	 * @param inDto
	 */
	@SuppressWarnings("unchecked")
	public void buildXmlMapper(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		tableVO = BuilderUtil.isAutoIncreamentColAsPK(columnVOs, tableVO);
		Dto tableDto = BuilderUtil.convertTableVO(tableVO);
		List<Dto> columnDtos = BuilderUtil.convertColumnVO(columnVOs);
		List<ColumnVO> pkeyColumnVOs = (List<ColumnVO>) inDto.get("pkeyColumnVOs");
		List<Dto> pkeyColumnDtos = BuilderUtil.convertColumnVO(pkeyColumnVOs);
		String allLowName = tableDto.getString("allLowName");
		String packageString = inDto.getString("package") + "." + allLowName;
		Dto vmDto = Dtos.newDto();
		vmDto.put("columnDtos", columnDtos);
		vmDto.put("pkeyColumnDtos", pkeyColumnDtos);
		vmDto.put("bykeywhere", BuilderUtil.getByKeyWhereStr(DBMetaInfoUtil.getPKColumnVOs(columnVOs)));
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", StringUtils.lowerCase(packageString));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", DateUtil.now());
		List<IndexVO> indexVOs = (List<IndexVO>)inDto.get("indexVOs");
		vmDto.put("indexDtos", BuilderUtil.convertIndexVO(indexVOs));
		
		String outString = BuilderUtil.mergeFileTemplate(Resources.MAPPER_XML_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "/" + allLowName + "/";
			String fileName = tableDto.getString("upname") + "Mapper.xml";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + fileName);
			out.write(outString.getBytes());
			out.close();
			log.info("【{}】文件生成成功。[{}{}]", fileName, outPath, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
