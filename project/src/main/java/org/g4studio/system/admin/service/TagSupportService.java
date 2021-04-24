package org.g4studio.system.admin.service;

import org.g4studio.common.service.BaseService;
import org.g4studio.core.metatype.Dto;

/**
 * 
 * 权限模型标签业务接口
 * 
 * @author OSWorks-XC
 * @since 2010-05-13
 */
public interface TagSupportService extends BaseService{
	/**
	 * 获取卡片
	 * @param pDto
	 * @return
	 */
	public Dto getCardList(Dto pDto);
	
	/**
	 * 获取卡片子树
	 * @param pDto
	 * @return
	 */
	public Dto getCardTreeList(Dto pDto);
	
	/**
	 * 获取登录人员所属部门信息
	 * @return
	 */
	public Dto getDepartmentInfo(Dto pDto);
	
	/**
	 * 获取登录人员附加信息
	 * @param pDto
	 * @return
	 */
	public Dto getEauserSubInfo(Dto pDto);
	
	/**
	 * 获取应用菜单(桌面布局)
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getMenuList4Desktop(Dto pDto);
}
