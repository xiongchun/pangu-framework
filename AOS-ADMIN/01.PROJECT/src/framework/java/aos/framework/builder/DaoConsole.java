package aos.framework.builder;

import java.sql.Connection;
import java.sql.SQLException;

import aos.framework.builder.asset.DriverManagerOpt;
import aos.framework.builder.metainfo.DBMetaInfoUtils;
import aos.framework.builder.resources.DaoBuilder;
import aos.framework.core.dao.asset.DBType;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;

/**
 * 数据访问层代码生成器
 * 
 * <p>
 * 提示：已经支持可视化生成。请访问：开发工具箱->WebIDE集成开发。
 * 
 * @author xiongchun
 * @throws SQLException 
 */
public class DaoConsole {

	public static void main(String[] args) throws SQLException {
		//===================
		DriverManagerOpt driverOpt = new DriverManagerOpt();
		//当前版本支持mysql、oracle、sqlserver2005+、H2
		driverOpt.setDataBaseType(DBType.MYSQL); 
		driverOpt.setIp("127.0.0.1");
		driverOpt.setPort("3306");
		//数据库名或数据库实例名
		driverOpt.setCatalog("aos");
		driverOpt.setUserName("root");
		driverOpt.setPassword("root");
		//===================
		Dto dto = Dtos.newDto();
		//改为自己存放相关文件的磁盘文件路径
		dto.put("outPath", "G:/01.AOS/01.AOS开发套件/AOS-ADMIN/01.PROJECT/src/dao/java/aos/framework/dao");
		//dto.put("outPath", "G:/01.AOS/03.AOS_V2/src/dao/java/aos/system/dao");
		//改为自己相关文件的包路径
		//dto.put("package", "aos.system.dao");
		dto.put("package", "aos.framework.dao");
		dto.put("author", "xiongchun");
		//指定多张表请用逗号分隔；
		//!!表名区分大小写的喔
		//dto.put("tables", "aos_module, aos_org, aos_role, aos_role_module, aos_user_role,aos_cmp,aos_icon");
		dto.put("tables", "test1");
		//===================
		Connection connection = DBMetaInfoUtils.newConnection(driverOpt);
		DaoBuilder.buildDao(connection, dto);
		connection.close();
	}

}
