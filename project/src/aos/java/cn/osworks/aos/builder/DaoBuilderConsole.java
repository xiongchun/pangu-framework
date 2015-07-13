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
 * 提示：此方式为临时的代码生成方案，后续版本会将此功能整合进AOS的Eclipse开发插件中。
 * 
 * @author OSWorks-XC
 * @throws SQLException 
 */
public class DaoBuilderConsole {

	public static void main(String[] args) throws SQLException {
		//===================
		DriverManagerOpt driverOpt = new DriverManagerOpt();
		//当前版本支持mysql和oracle和ms-sqlserver
		driverOpt.setDataBaseType(DBType.H2); 
		driverOpt.setIp("127.0.0.1");
		driverOpt.setPort("1521");
		//数据库名或数据库实例名
		driverOpt.setCatalog("./webapp/data/aos");
		//driverOpt.setCatalog("orcl");
		driverOpt.setUserName("");
		driverOpt.setPassword("");
		//===================
		Dto dto = Dtos.newDto();
		//改为自己存放Dao相关文件的磁盘文件路径
		//dto.put("outPath", "F:\\01.系统开发平台\\01.程序\\src\\aos\\java\\cn\\osworks\\aos\\system\\dao");
		dto.put("outPath", "F:/01.系统开发平台/01.程序/src/aos/java/cn/osworks/aos/demo/dao");
		//改为自己Dao相关文件的包路径
		dto.put("package", "cn.osworks.aos.demo.dao");
		dto.put("author", "OSWorks-XC");
		//指定多张表请用逗号分隔；
		dto.put("tables", "DEMO_ORG,DEMO_ACCOUNT");
		//===================
		Connection connection = DBMetaInfoUtils.newConnection(driverOpt);
		DaoBuilder.build(connection, dto);
		connection.close();
	}

}
