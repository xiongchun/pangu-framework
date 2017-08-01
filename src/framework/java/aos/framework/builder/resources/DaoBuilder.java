package aos.framework.builder.resources;

import java.io.File;
import java.io.FileOutputStream;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

import aos.framework.builder.asset.BuilderUtils;
import aos.framework.builder.metainfo.DBMetaInfoUtils;
import aos.framework.builder.metainfo.vo.ColumnVO;
import aos.framework.builder.metainfo.vo.TableVO;
import aos.framework.core.exception.AOSException;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSUtils;
import aos.framework.core.velocity.VelocityHelper;

/**
 * 数据访问层代码生成器
 * 
 * @author xiongchun
 */
public class DaoBuilder {

	private static Logger log = LoggerFactory.getLogger(DaoBuilder.class);

	/**
	 * 生成*PO.java
	 * 
	 * @param inDto
	 */
	public static void buildPO(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		Dto tableDto = BuilderUtils.convertTableVO(tableVO);
		@SuppressWarnings("unchecked")
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		List<Dto> columnDtos = BuilderUtils.convertColumnVO(columnVOs);
		String packageString = inDto.getString("package");
		Dto vmDto = Dtos.newDto();
		vmDto.put("columnDtos", columnDtos);
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", packageString);
		vmDto.put("importDto", BuilderUtils.getImportDto4PO(columnDtos));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", AOSUtils.getDateTimeStr());
		StringWriter writer = VelocityHelper.mergeFileTemplate(Resources.PO_JAVA_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "//po//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + tableDto.getString("upname") + "PO.java");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("PO文件[" + packageString + ".po." + tableDto.getString("upname") + "PO.java]生成成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成*Dao.java
	 * 
	 * @param inDto
	 */
	public static void buildJavaDao(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		Dto tableDto = BuilderUtils.convertTableVO(tableVO);
		@SuppressWarnings("unchecked")
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		String packageString = inDto.getString("package");
		Dto vmDto = Dtos.newDto();
		vmDto.put("bykey", BuilderUtils.getByKeyStr(columnVOs));
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", packageString);
		vmDto.put("package_base", inDto.getString("package"));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", AOSUtils.getDateTimeStr());
		List<Dto> columnDtos = BuilderUtils.convertColumnVO(columnVOs);
		vmDto.put("importDto", BuilderUtils.getImportDto4Dao(columnDtos));
		StringWriter writer = VelocityHelper.mergeFileTemplate(Resources.DAO_JAVA_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + tableDto.getString("upname") + "Dao.java");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("Dao Java文件[" + packageString + "." + tableDto.getString("upname") + "Dao.java]生成成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成*Dao.xml
	 * 
	 * @param inDto
	 */
	@SuppressWarnings("unchecked")
	public static void buildXmlDao(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		tableVO = BuilderUtils.isAutoIncreamentColAsPK(columnVOs, tableVO);
		Dto tableDto = BuilderUtils.convertTableVO(tableVO);
		List<Dto> columnDtos = BuilderUtils.convertColumnVO(columnVOs);
		List<ColumnVO> pkeyColumnVOs = (List<ColumnVO>) inDto.get("pkeyColumnVOs");
		List<Dto> pkeyColumnDtos = BuilderUtils.convertColumnVO(pkeyColumnVOs);
		String packageString = inDto.getString("package");
		Dto vmDto = Dtos.newDto();
		vmDto.put("columnDtos", columnDtos);
		vmDto.put("pkeyColumnDtos", pkeyColumnDtos);
		vmDto.put("bykeywhere", BuilderUtils.getByKeyWhereStr(columnVOs));
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", packageString);
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", AOSUtils.getDateTimeStr());
		StringWriter writer = VelocityHelper.mergeFileTemplate(Resources.DAO_XML_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + tableDto.getString("upname") + "Dao.xml");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("Dao Xml文件[" + packageString + ".sqlmap." + tableDto.getString("upname") + "Dao.xml]生成成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成Dao代码
	 * 
	 * @param inDto
	 * @throws SQLException
	 */
	public static void buildDao(Connection connection, Dto inDto) throws SQLException {
		DatabaseMetaData databaseMetaData = connection.getMetaData();
		String tablesString = AOSUtils.trimAll(inDto.getString("tables"));
		// ,号分隔的多张表
		String[] tables = tablesString.split(",");
		for (String tableName : tables) {
			TableVO tableVO = DBMetaInfoUtils.getTableVO(databaseMetaData, tableName);
			if (AOSUtils.isEmpty(tableVO)) {
				throw new AOSException("表[" + tableName + "]不存在。");
			}
			inDto.put("tableVO", tableVO);
			List<ColumnVO> columnVOs = DBMetaInfoUtils.listColumnVOs(databaseMetaData, tableName);
			// 仅生成XMLMapper时需要
			List<ColumnVO> pkeyColumnVOs = DBMetaInfoUtils.getPKColumnVOs(columnVOs);
			inDto.put("columnVOs", columnVOs);
			inDto.put("pkeyColumnVOs", pkeyColumnVOs);
			DaoBuilder.buildPO(inDto);
			DaoBuilder.buildJavaDao(inDto);
			DaoBuilder.buildXmlDao(inDto);
		}

	}

	/**
	 * 生成数据总线文件(D.java)
	 * 
	 * @param inDto
	 * @throws SQLException
	 */
	public static void buildDataBus(Connection connection, Dto inDto) throws SQLException {
		DatabaseMetaData databaseMetaData = connection.getMetaData();
		String tablesString = AOSUtils.trimAll(inDto.getString("tables"));
		// ,号分隔的多张表
		String[] tables = tablesString.split(",");
		List<Dto> tableDtos = Lists.newArrayList();
		for (String tableName : tables) {
			TableVO tableVO = DBMetaInfoUtils.getTableVO(databaseMetaData, tableName);
			Dto tableDto = tableVO.toDto();
			tableDto.put("upperName", StringUtils.capitalize(tableVO.getName()));
			tableDtos.add(tableDto);
		}
		inDto.put("tableDtos", tableDtos);
		inDto.put("sysdate", AOSUtils.getDateTimeStr());
		StringWriter writer = VelocityHelper.mergeFileTemplate(Resources.D_JAVA_VM, inDto);
		try {
			String outPath = inDto.getString("outPath") + "//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + inDto.getString("className") + ".java");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("数据总线文件[" + inDto.getString("package") +  "." + inDto.getString("className") + ".java]生成成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
