package cn.osworks.aos.builder;

import java.sql.Connection;
import java.sql.SQLException;

import cn.osworks.aos.builder.asset.DriverManagerOpt;
import cn.osworks.aos.builder.metainfo.DBMetaInfoUtils;
import cn.osworks.aos.core.dao.asset.DBType;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

/**
 * 数据访问层代码生成器
 * 
 * <p>
 * 提示：已经支持可视化生成。请访问：开发工具箱->WebIDE集成开发。
 * 
 * @author OSWorks-XC
 * @throws SQLException 
 */
public class DaoBuilderConsole {

	public static void main(String[] args) throws SQLException {
		//===================
		DriverManagerOpt driverOpt = new DriverManagerOpt();
		//当前版本支持mysql、oracle、sqlserver2005+、H2
		driverOpt.setDataBaseType(DBType.MYSQL); 
		driverOpt.setIp("127.0.0.1");
		driverOpt.setPort("3306");
		//数据库名或数据库实例名
		//driverOpt.setCatalog("./webapp/WEB-INF/db/aos");
		driverOpt.setCatalog("aos");
		driverOpt.setUserName("root");
		driverOpt.setPassword("111111");
		//===================
		Dto dto = Dtos.newDto();
		//改为自己存放Dao相关文件的磁盘文件路径
		//dto.put("outPath", "F:\\01.系统开发平台\\01.程序\\src\\aos\\java\\cn\\osworks\\aos\\system\\dao");
		dto.put("outPath", "F:/01.AOS/01.PROJECT/src/aos/java/cn/osworks/aos/system/dao");
		//改为自己Dao相关文件的包路径
		dto.put("package", "cn.osworks.aos.system.dao");
		dto.put("author", "AHei");
		//指定多张表请用逗号分隔；
		//!!表名区分大小写的喔
		dto.put("tables", "test");
		//===================
		Connection connection = DBMetaInfoUtils.newConnection(driverOpt);
		DaoBuilder.build(connection, dto);
		connection.close();
	}

}
