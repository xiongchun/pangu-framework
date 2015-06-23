package cn.osworks.aos.modules.builder.misc;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import cn.osworks.aos.base.asset.AOSBeanLoader;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;
import cn.osworks.aos.modules.builder.dao.vo.TableVO;
import cn.osworks.aos.modules.builder.factory.IMetaService;
import cn.osworks.aos.modules.builder.factory.IMetaServiceFactory;
import cn.osworks.aos.modules.builder.factory.MakeFileService;

/**
 * <b>代码生成器本地入口</b>
 * 
 * @author OSWorks-XC
 * @date 2013-10-06
 */
public class ConsoleBuilder {

	/**
	 * 代码生成服务
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		buildAOS();
		//buildOW();
	}
	
	/**
	 * 生成AOS项目代码
	 */
	private static void buildAOS(){
		// 生成Home.Dao
		Dto qDto = Dtos.newDto();
		qDto.put("outPath", "F:\\01.系统开发平台\\01.程序\\src\\main\\java\\cn\\osworks\\aos\\showcase\\dao");
		qDto.put("package", "cn.osworks.aos.showcase.dao");
		qDto.put("author", "XiongChun");
		String[] tables = { "aos_sh_az02"};
		qDto.put("tables", tables);
		buildDaoMapper(qDto);
	}
	
	/**
	 * 生成OW项目代码
	 */
	@SuppressWarnings("unused")
	private static void buildOW(){
		// 生成Home.Dao
		Dto qDto = Dtos.newDto();
		qDto.put("outPath", "F:\\02.金码坊官方网站\\01.程序\\src\\main\\java\\cn\\osworks\\officeweb\\dao\\mapper");
		qDto.put("package", "cn.osworks.officeweb.dao.mapper");
		qDto.put("author", "XiongChun");
		String[] tables = {"kw_thread_log"};
		qDto.put("tables", tables);
		buildDaoMapper(qDto);
	}

	/**
	 * 生成Dao相关代码(*PO.java、*.Mapper.java、*.Mapper.xml)
	 * 
	 */
	private static void buildDaoMapper(Dto qDto) {
		String[] tables = (String[]) qDto.get("tables");
		SqlDao sqlDao = (SqlDao) AOSBeanLoader.getSpringBean("sqlDao");
		String dbName = sqlDao.getSqlSession().getConfiguration().getDatabaseId();
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
			MakeFileService makeFileService = (MakeFileService) AOSBeanLoader.getSpringBean("makeFileService");
			makeFileService.buildPO(qDto);
			makeFileService.buildJavaMapper(qDto);
			makeFileService.buildXmlMapper(qDto);
		}
	}

}
