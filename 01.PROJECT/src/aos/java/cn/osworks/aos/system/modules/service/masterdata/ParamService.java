package cn.osworks.aos.system.modules.service.masterdata;


import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_catalogPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;


/**
 * <b>参数表服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class ParamService {

	@Autowired
	private Aos_sys_paramMapper aos_sys_paramMapper;
	
	@Autowired
	private Aos_sys_catalogMapper aos_sys_catalogMapper;

	/**
	 * 保存参数信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto saveParam(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_sys_paramPO tempPO = aos_sys_paramMapper.selectOne(Dtos.newDto("key_", inDto.getString("key_")));
		if (AOSUtils.isNotEmpty(tempPO)) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("参数键[{0}]被占用，请重新输入。", inDto.getString("key_")));
			return outDto;
		}
		Aos_sys_paramPO aos_sys_paramPO = new Aos_sys_paramPO();
		AOSUtils.copyProperties(inDto, aos_sys_paramPO);
		aos_sys_paramPO.setId_(AOSId.uuid());
		Aos_sys_catalogPO aos_sys_catalogPO = aos_sys_catalogMapper.selectByKey(aos_sys_paramPO.getCatalog_id_());
		aos_sys_paramPO.setCatalog_cascade_id_(aos_sys_catalogPO.getCascade_id_());
		if (AOSUtils.isEmpty(aos_sys_paramPO.getOverwrite_field_())) {
			aos_sys_paramPO.setIs_overwrite_(AOSCons.NO);
		}
		aos_sys_paramMapper.insert(aos_sys_paramPO);
		outDto.setAppMsg("操作完成，参数数据新增成功。");
		return outDto;
	}
	
	/**
	 * 修改参数信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updateParam(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_sys_paramPO tempPO = aos_sys_paramMapper.selectOne(Dtos.newDto("key_", inDto.getString("key_")));
		if (AOSUtils.isNotEmpty(tempPO) && !StringUtils.equals(tempPO.getId_(), inDto.getString("id_"))) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("参数键[{0}]被占用，请重新输入。", inDto.getString("key_")));
			return outDto;
		}
		Aos_sys_paramPO aos_sys_paramPO = new Aos_sys_paramPO();
		AOSUtils.copyProperties(inDto, aos_sys_paramPO);
		Aos_sys_catalogPO aos_sys_catalogPO = aos_sys_catalogMapper.selectByKey(aos_sys_paramPO.getCatalog_id_());
		aos_sys_paramPO.setCatalog_cascade_id_((aos_sys_catalogPO.getCascade_id_()));
		if (AOSUtils.isEmpty(aos_sys_paramPO.getOverwrite_field_())) {
			aos_sys_paramPO.setIs_overwrite_(AOSCons.NO);
		}
		aos_sys_paramMapper.updateByKey(aos_sys_paramPO);
		outDto.setAppMsg("操作完成，参数数据修改成功。");
		return outDto;
	}
	
	/**
	 * 删除参数数据
	 * 
	 * @param qDto
	 */
	@Transactional
	public int deleteParam(Dto qDto) {
		String[] selections = qDto.getRows();
		int rows = 0;
		for (String id_ : selections) {
			aos_sys_paramMapper.deleteByKey(id_);
			rows++;
		}
		return rows;
	}

}
