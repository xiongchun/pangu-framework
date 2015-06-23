package cn.osworks.aos.modules.system.service.masterdata;


import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_catalogMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_paramMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_catalogPO;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_paramPO;
import cn.osworks.aos.web.misc.IdCons;


/**
 * <b>参数表服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class ParamService {

	@Autowired
	private Aos_ge_paramMapper aos_ge_paramMapper;
	
	@Autowired
	private Aos_ge_catalogMapper aos_ge_catalogMapper;

	/**
	 * 保存参数信息
	 * 
	 * @param inDto
	 */
	public Dto saveParam(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_ge_paramPO tempPO = aos_ge_paramMapper.selectOne(Dtos.newDto("key_", inDto.getString("key_")));
		if (AOSUtils.isNotEmpty(tempPO)) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("参数键[{0}]被占用，请重新输入。", inDto.getString("key_")));
			return outDto;
		}
		Aos_ge_paramPO aos_ge_paramPO = new Aos_ge_paramPO();
		AOSUtils.apply(inDto, aos_ge_paramPO);
		aos_ge_paramPO.setId_(AOSId.id(IdCons.GID));
		Aos_ge_catalogPO aos_ge_catalogPO = aos_ge_catalogMapper.selectByKey(aos_ge_paramPO.getCatalog_id_());
		aos_ge_paramPO.setCatalog_cascade_id_(aos_ge_catalogPO.getCascade_id_());
		if (AOSUtils.isEmpty(aos_ge_paramPO.getOverwrite_field_())) {
			aos_ge_paramPO.setIs_overwrite_(AOSCons.NO);
		}
		aos_ge_paramMapper.insert(aos_ge_paramPO);
		outDto.setAppMsg("操作完成，参数数据新增成功。");
		return outDto;
	}
	
	/**
	 * 修改参数信息
	 * 
	 * @param inDto
	 */
	public Dto updateParam(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_ge_paramPO tempPO = aos_ge_paramMapper.selectOne(Dtos.newDto("key_", inDto.getString("key_")));
		if (AOSUtils.isNotEmpty(tempPO) && !StringUtils.equals(tempPO.getId_(), inDto.getString("id_"))) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("参数键[{0}]被占用，请重新输入。", inDto.getString("key_")));
			return outDto;
		}
		Aos_ge_paramPO aos_ge_paramPO = new Aos_ge_paramPO();
		AOSUtils.apply(inDto, aos_ge_paramPO);
		Aos_ge_catalogPO aos_ge_catalogPO = aos_ge_catalogMapper.selectByKey(aos_ge_paramPO.getCatalog_id_());
		aos_ge_paramPO.setCatalog_cascade_id_((aos_ge_catalogPO.getCascade_id_()));
		if (AOSUtils.isEmpty(aos_ge_paramPO.getOverwrite_field_())) {
			aos_ge_paramPO.setIs_overwrite_(AOSCons.NO);
		}
		aos_ge_paramMapper.updateByKey(aos_ge_paramPO);
		outDto.setAppMsg("操作完成，参数数据修改成功。");
		return outDto;
	}
	
	/**
	 * 删除参数数据
	 * 
	 * @param qDto
	 */
	public int deleteParam(Dto qDto) {
		String[] selections = qDto.getSelection();
		int rows = 0;
		for (String id_ : selections) {
			aos_ge_paramMapper.deleteByKey(id_);
			rows++;
		}
		return rows;
	}

}
