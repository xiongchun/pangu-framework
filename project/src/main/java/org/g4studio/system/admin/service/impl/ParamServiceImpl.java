package org.g4studio.system.admin.service.impl;

import org.g4studio.common.service.impl.BaseServiceImpl;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.system.admin.service.ParamService;
import org.g4studio.system.common.util.idgenerator.IDHelper;

/**
 * 全局参数数据访问实现
 * 
 * @author OSWorks-XC
 * @since 2010-05-13
 * @see BaseServiceImpl
 */
public class ParamServiceImpl extends BaseServiceImpl implements ParamService{

	/**
	 * 保存参数信息表
	 */
	public Dto saveParamItem(Dto pDto){
		pDto.put("paramid", IDHelper.getParamID());
		g4Dao.insert("Param.saveParamItem", pDto);
		return null;
	}

	/**
	 * 删除参数信息
	 * 
	 * @param pDto
	 */
	public Dto deleteParamItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("paramid", arrChecked[i]);
			g4Dao.delete("Param.deletParamItem", dto);
		}
		return null;
	}

	/**
	 * 修改参数信息
	 * 
	 * @param pDto
	 */
	public Dto updateParamItem(Dto pDto){
		g4Dao.update("Param.updateParamItem", pDto);
		return null;
	}

}
