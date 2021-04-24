package org.g4studio.system.admin.service;

import org.g4studio.common.service.BaseService;
import org.g4studio.core.metatype.Dto;

/**
 * 用户管理与授权业务接口
 * 
 * @author OSWorks-XC
 * @since 2010-01-13
 */
public interface UserService extends BaseService {

	/**
	 * 保存用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveUserItem(Dto pDto);

	/**
	 * 删除用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteUserItems(Dto pDto);

	/**
	 * 修改用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateUserItem(Dto pDto);

	/**
	 * 保存人员角色关联信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectedRole(Dto pDto);

	/**
	 * 保存人员菜单关联信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectedMenu(Dto pDto);
	
	/**
	 * 修改用户(提供首页修改使用)
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateUserItem4IndexPage(Dto pDto);
	
}
