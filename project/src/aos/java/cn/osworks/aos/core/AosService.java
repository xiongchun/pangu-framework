package cn.osworks.aos.core;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dicMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dic_indexMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dic_indexPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;

import com.google.common.collect.Lists;

/**
 * <b>提供一些系统级服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-13
 */
@Service
public class AosService {

	@Autowired
	private Aos_sys_paramMapper aos_sys_paramMapper;

	@Autowired
	private Aos_sys_dic_indexMapper aos_sys_dic_indexMapper;

	@Autowired
	private Aos_sys_dicMapper aos_sys_dicMapper;

	/**
	 * 根据参数键获取参数值
	 * 
	 * @param key_
	 *            参数键
	 */
	public String getValueByParamKey(String key_) {
		String value_ = "";
		Dto pDto = Dtos.newDto();
		pDto.put("key_", key_);
		Aos_sys_paramPO aos_sys_paramPO = aos_sys_paramMapper.selectOne(pDto);
		if (AOSUtils.isNotEmpty(aos_sys_paramPO)) {
			value_ = aos_sys_paramPO.getValue_();
		}
		return value_;
	}

	/**
	 * 根据数据字典标识键获取字典对照集合
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @return
	 */
	public List<Aos_sys_dicPO> getDicList(String dickey) {
		List<Aos_sys_dicPO> dicList = Lists.newArrayList();
		Dto qDto = Dtos.newDto();
		qDto.put("key_", dickey);
		List<Aos_sys_dic_indexPO> aos_sys_dic_indexPOs = aos_sys_dic_indexMapper.list(qDto);
		if (AOSUtils.isNotEmpty(aos_sys_dic_indexPOs)) {
			Aos_sys_dic_indexPO aos_sys_dic_indexPO = aos_sys_dic_indexPOs.get(0);
			Dto inDto = Dtos.newDto();
			inDto.put("dic_index_id_", aos_sys_dic_indexPO.getId_());
			inDto.setOrder("code_, id_");
			dicList = aos_sys_dicMapper.list(inDto);
		}
		return dicList;
	}

}
