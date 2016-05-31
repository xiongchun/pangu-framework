package cn.osworks.aos.core.id;

import java.util.UUID;

import cn.osworks.aos.core.asset.AOSCxt;


/**
 * <b>ID工具类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-06-01
 */
public class AOSId {
	
	/**
	 * 返回去除连接符-的UUID
	 * 
	 * @return
	 */
	public static String uuid() {
		String uuid = uuid2();
		return uuid.replaceAll("-", "");
	}
	
	/**
	 * 返回原生UUID
	 * 
	 * @return
	 */
	public static String uuid2() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 返回原始UUID中指定序号的一组字符串。
	 * 
	 * @param index
	 *            有效索引序号[0,1,2,3,4]。
	 * @return
	 */
	public static String uuid(int index) {
		String[] uuids = uuid2().split("-");
		return uuids[index];
	}

	/**
	 * 绕过ID配置表，直接调用数据库的Sequence返回一个ID。
	 * <p>
	 * 优点：和这个Sequence配进配置表比较，这种方式直接调用，性能略优。
	 * <p>
	 * 缺点：失去配置表的统一管理和格式化能力，失去动态切换ID发生规则的能力。并非所有数据库都支持Sequence机制。
	 * 
	 * @param sequenceName
	 *            数据库Sequence名称
	 * @return
	 */
	public static String sequenceId(String sequenceName) {
		IdService idService = (IdService) AOSCxt.getBean("idService");
		String id = idService.createIdBasedDbSeq(sequenceName);
		return id;
	}

}
