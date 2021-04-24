package org.g4studio.system.admin.service.impl;

import org.g4studio.common.service.impl.BaseServiceImpl;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.util.CodeUtil;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.UserService;
import org.g4studio.system.common.util.SystemConstants;
import org.g4studio.system.common.util.idgenerator.IDHelper;

/**
 * 用户管理与授权业务实现类
 * 
 * @author OSWorks-XC
 * @since 2010-04-13
 */
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	/**
	 * 保存用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveUserItem(Dto pDto) {
		Dto outDto = new BaseDto();
		pDto.put("enabled", SystemConstants.ENABLED_Y);
		Integer temp = (Integer) g4Dao.queryForObject("User.checkAccount", pDto);
		if (temp.intValue() != 0) {
			outDto.put("msg", "登录账户" + outDto.getAsString("account") + "已被占用,请尝试其它帐户!");
			outDto.put("success", new Boolean(false));
			return outDto;
		}
		pDto.put("userid", IDHelper.getUserID());
		String password = pDto.getAsString("password");
		String mPasswor = CodeUtil.encryptBase64(password, G4Constants.BASE64_KEY);
		pDto.put("password", mPasswor);
		g4Dao.insert("User.saveUserItem", pDto);
		g4Dao.insert("User.saveEausersubinfoItem", pDto);
		outDto.put("msg", "用户数据新增成功");
		outDto.put("success", new Boolean(true));
		return outDto;
	}

	/**
	 * 删除用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteUserItems(Dto pDto) {
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for (int i = 0; i < arrChecked.length; i++) {
			dto.put("userid", arrChecked[i]);
			g4Dao.update("User.updateEauserInUserManage", dto);
			g4Dao.delete("User.deleteEauserauthorizeInUserManage", dto);
			g4Dao.delete("User.deleteEausermenumapByUserid", dto);
			g4Dao.delete("User.deleteEausersubinfoByUserid", dto);
		}
		return null;
	}

	/**
	 * 修改用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateUserItem(Dto pDto) {
		String password = pDto.getAsString("password");
		if (password.equalsIgnoreCase("@@@@@@")) {
			pDto.remove("password");
		}else {
			String mPasswor = CodeUtil.encryptBase64(password, G4Constants.BASE64_KEY);
			pDto.put("password", mPasswor);
		}
		g4Dao.update("User.updateUserItem", pDto);
		if (!pDto.getAsString("deptid").equals(pDto.getAsString("deptid_old"))) {
			g4Dao.delete("User.deleteEauserauthorizeInUserManage", pDto);
			g4Dao.delete("User.deleteEausermenumapByUserId", pDto);
		}
		return null;
	}

	/**
	 * 保存人员角色关联信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectedRole(Dto pDto) {
		g4Dao.delete("User.deleteEaUserAuthorizeByUserId", pDto);
		String[] roleids = pDto.getAsString("roleid").split(",");
		for (int i = 0; i < roleids.length; i++) {
			String roleid = roleids[i];
			if (G4Utils.isEmpty(roleid))
				continue;
			pDto.put("roleid", roleid);
			pDto.put("authorizeid", IDHelper.getAuthorizeid4User());
			g4Dao.insert("User.saveSelectedRole", pDto);
		}
		return null;
	}

	/**
	 * 保存人员菜单关联信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectedMenu(Dto pDto) {
		g4Dao.delete("User.deleteEausermenumapByUserId", pDto);
		String[] menuids = pDto.getAsString("menuid").split(",");
		for (int i = 0; i < menuids.length; i++) {
			String menuid = menuids[i];
			if (G4Utils.isEmpty(menuid))
				continue;
			pDto.put("menuid", menuid);
			pDto.put("authorizeid", IDHelper.getAuthorizeid4Usermenumap());
			pDto.put("authorizelevel", SystemConstants.AUTHORIZELEVEL_ACCESS);
			g4Dao.insert("User.saveSelectedMenu", pDto);
		}
		return null;
	}

	/**
	 * 修改用户(提供首页修改使用)
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateUserItem4IndexPage(Dto pDto) {
		String password = pDto.getAsString("password");
		String mPasswor = CodeUtil.encryptBase64(password, G4Constants.BASE64_KEY);
		pDto.put("password", mPasswor);
		g4Dao.update("User.updateUserItem2", pDto);
		return null;
	}

}
