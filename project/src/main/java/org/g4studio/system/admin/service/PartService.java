package org.g4studio.system.admin.service;

import org.g4studio.common.service.BaseService;
import org.g4studio.core.metatype.Dto;

/**
 * UI组件授权服务接口
 * 
 * @author OSWorks-XC
 * @since 2011-06-25
 */
public interface PartService extends BaseService {
	
	/**
	 * 保存托管UI组件脏数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveDirtyDatas(Dto pDto);
	
	/**
	 * 删除数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteItem(Dto pDto);
	
	/**
	 * 保存UI元素人员授权数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto savePartUserGrantDatas(Dto pDto);
	
	/**
	 * 保存UI元素角色授权数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto savePartRoleGrantDatas(Dto pDto);
}
