package cn.osworks.aos.builder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.builder.asset.BuilderUtils;
import cn.osworks.aos.builder.metainfo.DBMetaInfoUtils;
import cn.osworks.aos.builder.metainfo.vo.ColumnVO;
import cn.osworks.aos.builder.metainfo.vo.TableVO;
import cn.osworks.aos.builder.resources.BuilderResources;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.core.velocity.VelocityHelper;

/**
 * 数据访问层代码生成器
 * 
 * @author OSWorks-XC
 */
public class DaoBuilder {

	private static Log log = LogFactory.getLog(DaoBuilder.class);

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
		String packageString = inDto.getString("package") + ".po";
		Dto vmDto = Dtos.newDto();
		vmDto.put("columnDtos", columnDtos);
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", packageString);
		vmDto.put("importDto", BuilderUtils.getImportDto(columnDtos));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", AOSUtils.getDateTimeStr());
		StringWriter writer = VelocityHelper.mergeFileTemplate(BuilderResources.PO_JAVA_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "//po//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + tableDto.getString("upname") + "PO.java");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("PO文件[" + packageString + "." + tableDto.getString("upname") + "PO.java]生成成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成*Mapper.java
	 * 
	 * @param inDto
	 */
	public static void buildJavaMapper(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		Dto tableDto = BuilderUtils.convertTableVO(tableVO);
		@SuppressWarnings("unchecked")
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		String packageString = inDto.getString("package") + ".mapper";
		Dto vmDto = Dtos.newDto();
		vmDto.put("bykey", BuilderUtils.getByKeyStr(columnVOs));
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", packageString);
		vmDto.put("package_base", inDto.getString("package"));
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", AOSUtils.getDateTimeStr());
		List<Dto> columnDtos = BuilderUtils.convertColumnVO(columnVOs);
		vmDto.put("importDto", BuilderUtils.getImportDto(columnDtos));
		StringWriter writer = VelocityHelper.mergeFileTemplate(BuilderResources.MAPPER_JAVA_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "//mapper//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + tableDto.getString("upname") + "Mapper.java");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("Mapper Java文件[" + packageString + "." + tableDto.getString("upname") + "Mapper.java]生成成功。");
			}
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
	public static void buildXmlMapper(Dto inDto) {
		TableVO tableVO = (TableVO) inDto.get("tableVO");
		List<ColumnVO> columnVOs = (List<ColumnVO>) inDto.get("columnVOs");
		tableVO = BuilderUtils.isAutoIncreamentColAsPK(columnVOs, tableVO);
		Dto tableDto = BuilderUtils.convertTableVO(tableVO);
		List<Dto> columnDtos = BuilderUtils.convertColumnVO(columnVOs);
		List<ColumnVO> pkeyColumnVOs = (List<ColumnVO>) inDto.get("pkeyColumnVOs");
		List<Dto> pkeyColumnDtos = BuilderUtils.convertColumnVO(pkeyColumnVOs);
		String packageString = inDto.getString("package") + ".mapper";
		Dto vmDto = Dtos.newDto();
		vmDto.put("columnDtos", columnDtos);
		vmDto.put("pkeyColumnDtos", pkeyColumnDtos);
		vmDto.put("bykeywhere", BuilderUtils.getByKeyWhereStr(columnVOs));
		vmDto.put("tableDto", tableDto);
		vmDto.put("package", packageString);
		vmDto.put("author", inDto.getString("author"));
		vmDto.put("sysdate", AOSUtils.getDateTimeStr());
		StringWriter writer = VelocityHelper.mergeFileTemplate(BuilderResources.MAPPER_XML_VM, vmDto);
		try {
			String outPath = inDto.getString("outPath") + "//mapper//";
			FileUtils.forceMkdir(new File(outPath));
			FileOutputStream out = new FileOutputStream(outPath + tableDto.getString("upname") + "Mapper.xml");
			out.write(writer.toString().getBytes());
			out.close();
			if (log.isInfoEnabled()) {
				log.info("Mapper Xml文件[" + packageString + ".sqlmap." + tableDto.getString("upname")
						+ "Mapper.xml]生成成功。");
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
	public static void build(Connection connection, Dto inDto) throws SQLException {
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
