package cn.osworks.aos.core.id;

import java.util.UUID;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;


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
	 * 根据ID配置表的规则，返回一个ID。
	 * 
	 * @param idName
	 *            ID名称
	 * @return
	 */
	public static String id(String idName) {
		IdService idService = (IdService) AOSCxt.getBean("idService");
		String id = idService.createId(idName);
		return id;
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

	/**
	 * 生成树路径ID，如：01.01.01
	 * 
	 * @param curMaxNode
	 *            本级当前最大节点ID，如果要生成本级第一个节点则传XX.XX.00(XX.XX为父节点ID)。
	 * @param maxValue
	 *            本级节点ID允许的最大值
	 * @return
	 */
	public static String treeId(String curMaxNode, int maxValue) {
		String prefix = StringUtils.substringBeforeLast(curMaxNode, ".");
		String last = StringUtils.substringAfterLast(curMaxNode, ".");
		if (AOSUtils.isEmpty(last)) {
			throw new AOSException(4);
		}
		int intLast = Integer.valueOf(last);
		if (intLast == maxValue || intLast > maxValue) {
			throw new AOSException(3);
		}
		String thisNode = String.valueOf(intLast + 1);
		thisNode = StringUtils.leftPad(thisNode, String.valueOf(maxValue).length(), "0");
		return prefix + "." + thisNode;
	}

}
