package aos.system.modules.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.framework.core.id.AOSId;
import aos.framework.core.service.AOSBaseService;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCodec;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.Aos_userDao;
import aos.framework.dao.Aos_userPO;
import aos.framework.web.router.HttpModel;
import aos.system.common.model.UserModel;
import aos.system.common.utils.SystemCons;
import aos.system.common.utils.SystemUtils;
import aos.system.dao.Aos_orgDao;
import aos.system.dao.Aos_orgPO;
import aos.system.dao.Aos_rolePO;
import aos.system.dao.Aos_user_roleDao;
import aos.system.dao.Aos_user_rolePO;
import aos.system.modules.cache.CacheUserDataService;

/**
 * 用户管理
 * 
 * @author xiongchun
 *
 */
@Service
public class UserService extends AOSBaseService {

	@Autowired
	private Aos_userDao aos_userDao;
	@Autowired
	private Aos_orgDao aos_orgDao;
	@Autowired
	private Aos_user_roleDao aos_user_roleDao;
	@Autowired
	private CacheUserDataService cacheUserDataService;
	
	/**
	 * 用户管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		Aos_orgPO aos_orgPO = aos_orgDao.selectByKey(httpModel.getUserModel().getAos_orgPO().getId_());
		httpModel.setAttribute("rootPO", aos_orgPO);
		httpModel.setAttribute("super_user_id", SystemCons.SUPER_USER_ID);
		httpModel.setViewPath("system/user.jsp");
	}

	/**
	 * 获取部门导航树
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getTreeData(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		inDto.setOrder("sort_no_");
		inDto.put("is_del_", SystemCons.IS.NO);
		List<Aos_orgPO> aos_orgPOs = aos_orgDao.list(inDto);
		List<Dto> modelDtos = Lists.newArrayList();
		for (Aos_orgPO aos_orgPO : aos_orgPOs) {
			modelDtos.add(aos_orgPO.toDto());
		}
		String treeJson = SystemUtils.toTreeModalAsyncLoad(modelDtos);
		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 查询用户列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listUsers(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		Aos_orgPO aos_orgPO = httpModel.getUserModel().getAos_orgPO();
		if (AOSUtils.isEmpty(qDto.getString("org_id_"))) {
			qDto.put("org_id_", aos_orgPO.getId_());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id_"))) {
			qDto.put("org_cascade_id_", aos_orgPO.getCascade_id_());
		}
		qDto.put("is_del_", SystemCons.IS.NO);
		qDto.put("cascade_", qDto.getBoolean("cascade_") ? 1 : 0);
		List<Dto> userDtos = sqlDao.list("User.listUsersPage", qDto);
		for (Dto dto : userDtos) {
			String roles_ = "";
			List<Aos_rolePO> aos_rolePOs = sqlDao.list("User.listRolesOfUser", dto.getString("id_"));
			for (Aos_rolePO aos_rolePO : aos_rolePOs) {
				roles_ = roles_ + aos_rolePO.getName_() + " | ";
			}
			dto.put("roles_", StringUtils.substringBeforeLast(roles_, "|"));
		}
		httpModel.setOutMsg(AOSJson.toGridJson(userDtos, qDto.getPageTotal()));
	}

	/**
	 * 保存用户
	 * 
	 * @param httpModel
	 * @return
	 */
	@Transactional
	public void saveUser(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		Dto inDto = httpModel.getInDto();
		UserModel userModel = httpModel.getUserModel();
		Aos_userPO aos_userPO = new Aos_userPO();
		aos_userPO.copyProperties(inDto);
		Dto checkDto = Dtos.newDto("account_", aos_userPO.getAccount_());
		checkDto.put("is_del_", SystemCons.IS.NO);
		if (aos_userDao.rows(checkDto) == 0) {
			aos_userPO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
			aos_userPO.setCreate_by_(userModel.getId_());
			aos_userPO.setCreate_time_(AOSUtils.getDateTime());
			aos_userPO.setIs_del_(SystemCons.IS.NO);
			aos_userPO.setPassword_(AOSCodec.password(aos_userPO.getPassword_()));
			aos_userDao.insert(aos_userPO);
			outDto.setAppMsg("用户新增成功。");
		} else {
			outDto.setAppCode(SystemCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("用户新增失败，登录账号[{0}]已经存在。", aos_userPO.getAccount_()));
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}

	/**
	 * 修改用户
	 * 
	 * @param httpModel
	 * @return
	 */
	public void updateUser(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		Dto inDto = httpModel.getInDto();
		Aos_userPO aos_userPO = new Aos_userPO();
		aos_userPO.copyProperties(inDto);
		Aos_userPO oldPO = aos_userDao.selectByKey(aos_userPO.getId_());
		if (!StringUtils.equalsIgnoreCase(aos_userPO.getAccount_(), oldPO.getAccount_())) {
			Dto checkDto = Dtos.newDto("account_", aos_userPO.getAccount_());
			checkDto.put("is_del_", SystemCons.IS.NO);
			if (aos_userDao.rows(checkDto) > 0) {
				outDto.setAppCode(SystemCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("修改失败，用户账户[{0}]已经存在。", aos_userPO.getAccount_()));
			} 
		}
		if (StringUtils.equals(outDto.getAppCode(), SystemCons.SUCCESS)) {
			if (!StringUtils.equals(inDto.getString("old_org_id_"), inDto.getString("org_id_"))) {
				//修改所属部门
				Aos_orgPO aos_orgPO = aos_orgDao.selectByKey(aos_userPO.getOrg_id_());
				aos_userPO.setOrg_id_(aos_orgPO.getId_());
			}
			aos_userDao.updateByKey(aos_userPO);
			outDto.setAppMsg("用户修改成功。");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}

	/**
	 * 查询用户信息
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getUser(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Aos_userPO aos_userPO = aos_userDao.selectByKey(inDto.getString("id_"));
		aos_userPO.setPassword_(null);
		Dto outDto = aos_userPO.toDto();
		Aos_orgPO aos_orgPO = aos_orgDao.selectByKey(aos_userPO.getOrg_id_());
		outDto.put("org_id_", aos_orgPO.getId_());
		outDto.put("old_org_id_", aos_orgPO.getId_());
		outDto.put("org_name_", aos_orgPO.getName_());
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}

	/**
	 * 删除用户
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void deleteUser(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id_ : selectionIds) {
			// 自己不能删除自己
			if (StringUtils.equals(httpModel.getUserModel().getId_().toString(), id_)) {
				continue;
			}
			Aos_userPO aos_userPO = new Aos_userPO();
			aos_userPO.setId_(id_);
			aos_userPO.setIs_del_(SystemCons.IS.YES);
			aos_userDao.updateByKey(aos_userPO);
		}
		httpModel.setOutMsg("删除用户数据成功。");
	}
	
	/**
	 * 重置用户密码
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void resetPassword(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		String[] selectionIds = inDto.getRows();
		for (String id_ : selectionIds) {
			Aos_userPO aos_userPO = new Aos_userPO();
			aos_userPO.setId_(id_);
			aos_userPO.setPassword_(AOSCodec.password(inDto.getString("password_")));
			aos_userDao.updateByKey(aos_userPO);
		}
		httpModel.setOutMsg("用户密码重置成功。");
	}
	
	/**
	 * 查询待选角色列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listRoles(HttpModel httpModel) {
		Aos_orgPO aos_orgPO = httpModel.getUserModel().getAos_orgPO();
		Dto qDto = httpModel.getInDto();
		qDto.put("org_cascade_id_", aos_orgPO.getCascade_id_());
		List<Dto> roleDtos = sqlDao.list("User.listToSelectRoles", qDto);
		
		httpModel.setOutMsg(AOSJson.toGridJson(roleDtos, roleDtos.size()));
	}
	
	/**
	 * 查询已选角色列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listSelectedRoles(HttpModel httpModel) {
		Aos_orgPO aos_orgPO = httpModel.getUserModel().getAos_orgPO();
		Dto qDto = httpModel.getInDto();
		qDto.put("org_cascade_id_", aos_orgPO.getCascade_id_());
		List<Dto> roleDtos = sqlDao.list("User.listSelectedRoles", qDto);
		
		httpModel.setOutMsg(AOSJson.toGridJson(roleDtos, roleDtos.size()));
	}
	
	/**
	 * 保存用户角色关联关系
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void saveUserRoleGrantInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		String user_id_ = inDto.getString("user_id_");
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id_ : selectionIds) {
			Aos_user_rolePO aos_user_rolePO = new Aos_user_rolePO();
			aos_user_rolePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
			aos_user_rolePO.setRole_id_(id_);
			aos_user_rolePO.setUser_id_(user_id_);
			aos_user_rolePO.setCreate_by_(httpModel.getUserModel().getId_());
			aos_user_rolePO.setCreate_time_(AOSUtils.getDateTime());
			aos_user_roleDao.insert(aos_user_rolePO);
		}
		cacheUserDataService.resetGrantInfoOfUser(user_id_);
		httpModel.setOutMsg("用户角色关联关系保存成功。");
	}
	
	/**
	 * 撤消用户角色关联关系
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void delUserRoleGrantInfo(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id_ : selectionIds) {
			Aos_user_rolePO aos_user_rolePO = aos_user_roleDao.selectByKey(id_);
			aos_user_roleDao.deleteByKey(id_);
			cacheUserDataService.resetGrantInfoOfUser(aos_user_rolePO.getUser_id_());
		}
		httpModel.setOutMsg("撤消用户角色关联关系成功。");
	}

}
