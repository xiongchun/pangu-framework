package org.g4studio.system.admin.service;

import org.g4studio.common.service.BaseService;
import org.g4studio.core.metatype.Dto;

/**
 * 资源模型业务接口
 * 
 * @author OSWorks-XC
 * @since 2010-01-13
 */
public interface ResourceService extends BaseService{
	
	/**
	 * 保存代码表
	 * @param pDto
	 * @return
	 */
	public Dto saveCodeItem(Dto pDto);
	
	/**
	 * 删除代码表
	 * @param pDto
	 * @return
	 */
	public Dto deleteCodeItem(Dto pDto);
	
	/**
	 * 修改代码表
	 * @param pDto
	 * @return
	 */
	public Dto updateCodeItem(Dto pDto);
	
	/**
	 * 保存菜单
	 * @param pDto
	 * @return
	 */
	public  Dto saveMenuItem(Dto pDto);
	
	/**
	 * 删除菜单
	 * @param pDto
	 * @return
	 */
	public Dto deleteMenuItems(Dto pDto);
	
	/**
	 * 修改菜单
	 * @param pDto
	 * @return
	 */
	public Dto updateMenuItem(Dto pDto);
	
}
