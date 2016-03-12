package cn.osworks.aos.core.id;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_sequenceMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_sequencePO;


/**
 * ID生成服务
 * 
 * <p>
 * ！待解决。这个组件混淆后的jar丢失路径元信息而无法被扫描。目前使用XML配置方式加载。
 * 
 * @author OSWorks-XC
 * @date 2014-06-01
 */
public class IdService {

	private Aos_sys_sequenceMapper aos_sys_sequenceMapper;

	/**
	 * 生成ID
	 * 
	 * @param idname
	 * @return
	 */
	public synchronized String createId(String idname) {
		String id = "";
		Dto dto = Dtos.newDto();
		dto.put("name_", idname);
		Aos_sys_sequencePO aos_sys_sequencePO = aos_sys_sequenceMapper.selectOne(dto);
		if (AOSUtils.isEmpty(aos_sys_sequencePO)) {
			throw new AOSException(1);
		}
		// 类型
		String type_ = aos_sys_sequencePO.getType_();
		if (StringUtils.equals(type_, DicCons.SEQUENCE_TYPE_UUID)) {
			// UUID
			id = AOSId.uuid();
		} else if (StringUtils.equals(type_, DicCons.SEQUENCE_TYPE_APPID)) {
			// AppSequence
			Long idLong = Long.valueOf(aos_sys_sequencePO.getCur_value_());
			idLong = idLong + 1; // 将当前值+1做为本次ID值
			if (idLong > new Long(aos_sys_sequencePO.getMax_value_())) {
				// 号源用完
				if (StringUtils.equals(aos_sys_sequencePO.getIs_circul_(), AOSCons.YES)) {
					// 从最小值开始循环
					idLong = new Long(aos_sys_sequencePO.getMin_value_());
				} else {
					// 溢出
					throw new AOSException(2, aos_sys_sequencePO.getName_());
				}
			}
			id = String.valueOf(idLong);
			// 补足
			if (StringUtils.equals(aos_sys_sequencePO.getIs_leftpad_(), AOSCons.YES)) {
				id = StringUtils.leftPad(id, aos_sys_sequencePO.getMax_value_().length(), "0");
			}
		} else if (StringUtils.equals(type_, DicCons.SEQUENCE_TYPE_DBSEQUENCE)) {
			// DBSequence
			id = createIdBasedDbSeq(aos_sys_sequencePO.getMax_value_());
		}
		aos_sys_sequencePO.setCur_value_(id);
		// 格式化
		id = format(id, aos_sys_sequencePO);
		// 回写配置表
		aos_sys_sequencePO.setFormat_value_(id);
		aos_sys_sequenceMapper.updateByKey(aos_sys_sequencePO);
		return id;
	}

	/**
	 * 基于数据库的sequence机制生成ID
	 * 
	 * @param sequenceName
	 *            数据库Sequence的name值
	 * @return
	 */
	public String createIdBasedDbSeq(String sequenceName) {
		// TODO 待实现
		return "";
	}

	/**
	 * ID格式化处理
	 * 
	 * @param id
	 * @param aos_sys_sequencePO
	 * @return
	 */
	private String format(String id, Aos_sys_sequencePO aos_sys_sequencePO) {
		if (AOSUtils.isEmpty(id)) {
			return id;
		}
		String prefix = aos_sys_sequencePO.getPrefix_();
		if (AOSUtils.isNotEmpty(prefix)) {
			String aString = StringUtils.substringBefore(prefix, "{");
			String bString = StringUtils.substringBetween(prefix, "{", "}");
			if (bString != null) {
				bString = AOSUtils.getDateTimeStr(bString);
			} else {
				bString = "";
			}
			String cString = StringUtils.substringAfter(prefix, "}");
			prefix = aString + bString + cString;
		} else {
			prefix = "";
		}
		String suffix = aos_sys_sequencePO.getSuffix_();
		if (AOSUtils.isNotEmpty(suffix)) {
			String aString = StringUtils.substringBefore(suffix, "{");
			String bString = StringUtils.substringBetween(suffix, "{", "}");
			if (bString != null) {
				bString = AOSUtils.getDateTimeStr(bString);
			} else {
				bString = "";
			}
			String cString = StringUtils.substringAfter(suffix, "}");
			suffix = aString + bString + cString;
		} else {
			suffix = "";
		}
		String linkString = aos_sys_sequencePO.getConnector_() == null ? "" : aos_sys_sequencePO.getConnector_();
		id = prefix + linkString + id;
		if (AOSUtils.isNotEmpty(suffix)) {
			id = id + linkString + suffix;
		}
		return id;
	}

	/**
	 * @return the aos_sys_sequenceMapper
	 */
	public Aos_sys_sequenceMapper getAos_sys_sequenceMapper() {
		return aos_sys_sequenceMapper;
	}

	/**
	 * @param aos_sys_sequenceMapper the aos_sys_sequenceMapper to set
	 */
	public void setAos_sys_sequenceMapper(Aos_sys_sequenceMapper aos_sys_sequenceMapper) {
		this.aos_sys_sequenceMapper = aos_sys_sequenceMapper;
	}

}
