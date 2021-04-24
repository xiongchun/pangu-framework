package org.g4studio.system.admin.service.impl;

import java.util.List;

import org.g4studio.common.service.impl.BaseServiceImpl;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.PartService;
import org.g4studio.system.common.util.SystemConstants;
import org.g4studio.system.common.util.idgenerator.IDHelper;

/**
 * UI组件授权服务实现
 * 
 * @author OSWorks-XC
 * @since 2011-06-25
 */
public class PartServiceImpl extends BaseServiceImpl implements PartService {
	
	/**
	 * 保存托管UI组件脏数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveDirtyDatas(Dto pDto){
		Dto outDto = new BaseDto();
		List list = pDto.getDefaultAList();
		if(!checkUniqueIndex(list)){
			outDto.setSuccess(G4Constants.FALSE);
			return outDto;
		}
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			if (dto.getAsString("remark").equals("null")) {
				dto.put("remark", "");
			}
			if (dto.getAsString("dirtytype").equalsIgnoreCase("1")) {
				dto.put("partid", IDHelper.getPartID());
				g4Dao.insert("Part.savePartItem", dto);
			}else {
				g4Dao.update("Part.updatePartItem", dto);
			}
		}
		outDto.setSuccess(G4Constants.TRUE);
		return outDto;
	}
	
	/**
	 * 检查组件唯一性
	 * 
	 * @param pList
	 * @return
	 */
	private boolean checkUniqueIndex(List pList){
		/*
		for (int i = 0; i < pList.size(); i++) {
			Dto dto = (BaseDto)pList.get(i);
			Dto qDto = new BaseDto();
			qDto.put("menuid", dto.getAsString("menuid"));
			qDto.put("cmpid", dto.getAsString("cmpid"));
			Dto outDto = (BaseDto)g4Dao.queryForObject("Part.queryPartByDto", qDto);
			if (!G4Utils.isEmpty(outDto)) {
				return false;
			}
		}
		*/
		return true;
	}
	
	
	/**
	 * 删除数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteItem(Dto pDto){
		g4Dao.delete("Part.deletePartItem", pDto);
		g4Dao.delete("Part.deletePartUserGrantItem", pDto);
		g4Dao.delete("Part.deletePartRoleGrantItem", pDto);
		return null;
	}
	
	/**
	 * 保存UI元素人员授权数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto savePartUserGrantDatas(Dto pDto){
		List list = pDto.getDefaultAList();
		for (int i = 0; i < list.size(); i++) {
			Dto lDto = (BaseDto)list.get(i);
			if (G4Utils.isEmpty(lDto.getAsString("authorizeid"))) {
				if (!lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					lDto.put("authorizeid", IDHelper.getAuthorizeid4Eauserauthorize());
					g4Dao.insert("Part.insertEausermenupartItem", lDto);
				}
			}else {
				if (lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					g4Dao.delete("Part.deleteEausermenupartItem", lDto);
				}else {
					g4Dao.update("Part.updateEausermenupartItem", lDto);
				}
			}
		}
		return null;
	}
	
	/**
	 * 保存UI元素角色授权数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto savePartRoleGrantDatas(Dto pDto){
		List list = pDto.getDefaultAList();
		for (int i = 0; i < list.size(); i++) {
			Dto lDto = (BaseDto)list.get(i);
			if (G4Utils.isEmpty(lDto.getAsString("authorizeid"))) {
				if (!lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					lDto.put("authorizeid", IDHelper.getAuthorizeid4Earoleauthorize());
					g4Dao.insert("Part.insertEarolemenupartItem", lDto);
				}
			}else {
				if (lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					g4Dao.delete("Part.deleteEarolemenupartItem", lDto);
				}else {
					g4Dao.update("Part.updateEarolemenupartItem", lDto);
				}
			}
		}
		return null;
	}
}
