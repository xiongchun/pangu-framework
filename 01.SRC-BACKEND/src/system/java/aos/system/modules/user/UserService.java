package aos.system.modules.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.framework.core.dao.SqlDao;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCodec;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.AosUserDao;
import aos.framework.dao.po.AosUserPO;
import aos.framework.web.router.HttpModel;
import aos.system.common.id.IdService;
import aos.system.common.model.UserModel;
import aos.system.common.utils.SystemCons;
import aos.system.common.utils.SystemUtils;
import aos.system.dao.AosOrgDao;
import aos.system.dao.AosUserRoleDao;
import aos.system.dao.po.AosOrgPO;
import aos.system.dao.po.AosRolePO;
import aos.system.dao.po.AosUserRolePO;
import aos.system.modules.cache.CacheUserDataService;

/**
 * 用户管理
 * 
 * @author xiongchun
 *
 */
@Service
public class UserService {

	@Autowired
	private AosUserDao aosUserDao;
	@Autowired
	private AosOrgDao aosOrgDao;
	@Autowired
	private AosUserRoleDao aosUserRoleDao;
	@Autowired
	private CacheUserDataService cacheUserDataService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private IdService idService;
	
	/**
	 * 用户管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		AosOrgPO aosOrgPO = aosOrgDao.selectByKey(httpModel.getUserModel().getAosOrgPO().getId());
		httpModel.setAttribute("rootPO", aosOrgPO);
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
		inDto.setOrder("sort_no");
		inDto.put("is_del", SystemCons.IS.NO);
		List<AosOrgPO> aosOrgPOs = aosOrgDao.list(inDto);
		List<Dto> modelDtos = Lists.newArrayList();
		for (AosOrgPO aosOrgPO : aosOrgPOs) {
			modelDtos.add(aosOrgPO.toDto());
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
		AosOrgPO aosOrgPO = httpModel.getUserModel().getAosOrgPO();
		if (AOSUtils.isEmpty(qDto.getString("org_id"))) {
			qDto.put("org_id", aosOrgPO.getId());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id"))) {
			qDto.put("org_cascade_id", aosOrgPO.getCascade_id());
		}
		qDto.put("is_del", SystemCons.IS.NO);
		List<Dto> userDtos = sqlDao.list("User.listUsersPage", qDto);
		for (Dto dto : userDtos) {
			String roles_ = "";
			List<AosRolePO> aosRolePOs = sqlDao.list("User.listRolesOfUser", dto.getString("id"));
			for (AosRolePO aosRolePO : aosRolePOs) {
				roles_ = roles_ + aosRolePO.getName() + " | ";
			}
			dto.put("roles", StringUtils.substringBeforeLast(roles_, "|"));
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
		AosUserPO aosUserPO = new AosUserPO();
		aosUserPO.copyProperties(inDto);
		Dto checkDto = Dtos.newDto("account", aosUserPO.getAccount());
		checkDto.put("is_del", SystemCons.IS.NO);
		if (aosUserDao.rows(checkDto) == 0) {
			aosUserPO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
			aosUserPO.setCreate_by(userModel.getId());
			aosUserPO.setCreate_time(AOSUtils.getDateTime());
			aosUserPO.setIs_del(SystemCons.IS.NO);
			aosUserPO.setPassword(AOSCodec.password(aosUserPO.getPassword()));
			aosUserDao.insert(aosUserPO);
			outDto.setAppMsg("用户新增成功。");
		} else {
			outDto.setAppCode(SystemCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("用户新增失败，登录账号[{0}]已经存在。", aosUserPO.getAccount()));
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
		AosUserPO aosUserPO = new AosUserPO();
		aosUserPO.copyProperties(inDto);
		AosUserPO oldPO = aosUserDao.selectByKey(aosUserPO.getId());
		if (!StringUtils.equalsIgnoreCase(aosUserPO.getAccount(), oldPO.getAccount())) {
			Dto checkDto = Dtos.newDto("account", aosUserPO.getAccount());
			checkDto.put("is_del", SystemCons.IS.NO);
			if (aosUserDao.rows(checkDto) > 0) {
				outDto.setAppCode(SystemCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("修改失败，用户账户[{0}]已经存在。", aosUserPO.getAccount()));
			} 
		}
		if (StringUtils.equals(outDto.getAppCode(), SystemCons.SUCCESS)) {
			if (!StringUtils.equals(inDto.getString("old_org_id"), inDto.getString("org_id"))) {
				//修改所属部门
				AosOrgPO aosOrgPO = aosOrgDao.selectByKey(aosUserPO.getOrg_id());
				aosUserPO.setOrg_id(aosOrgPO.getId());
			}
			aosUserDao.updateByKey(aosUserPO);
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
		AosUserPO aosUserPO = aosUserDao.selectByKey(inDto.getInteger("id"));
		aosUserPO.setPassword(null);
		Dto outDto = aosUserPO.toDto();
		AosOrgPO aosOrgPO = aosOrgDao.selectByKey(aosUserPO.getOrg_id());
		outDto.put("org_id", aosOrgPO.getId());
		outDto.put("old_org_id", aosOrgPO.getId());
		outDto.put("org_name", aosOrgPO.getName());
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
		for (String id : selectionIds) {
			// 自己不能删除自己
			if (StringUtils.equals(httpModel.getUserModel().getId().toString(), id)) {
				continue;
			}
			AosUserPO aosUserPO = new AosUserPO();
			aosUserPO.setId(Integer.valueOf(id));
			aosUserPO.setIs_del(SystemCons.IS.YES);
			aosUserDao.updateByKey(aosUserPO);
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
		for (String id : selectionIds) {
			AosUserPO aosUserPO = new AosUserPO();
			aosUserPO.setId(Integer.valueOf(id));
			aosUserPO.setPassword(AOSCodec.password(inDto.getString("password")));
			aosUserDao.updateByKey(aosUserPO);
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
		AosOrgPO aosOrgPO = httpModel.getUserModel().getAosOrgPO();
		Dto qDto = httpModel.getInDto();
		qDto.put("org_cascade_id", aosOrgPO.getCascade_id());
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
		AosOrgPO aosOrgPO = httpModel.getUserModel().getAosOrgPO();
		Dto qDto = httpModel.getInDto();
		qDto.put("org_cascade_id", aosOrgPO.getCascade_id());
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
		Integer user_id = inDto.getInteger("user_id");
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id : selectionIds) {
			AosUserRolePO aosUserRolePO = new AosUserRolePO();
			aosUserRolePO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
			aosUserRolePO.setRole_id(Integer.valueOf(id));
			aosUserRolePO.setUser_id(user_id);
			aosUserRolePO.setCreate_by(httpModel.getUserModel().getId());
			aosUserRolePO.setCreate_time(AOSUtils.getDateTime());
			aosUserRoleDao.insert(aosUserRolePO);
		}
		cacheUserDataService.resetGrantInfoOfUser(user_id);
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
		for (String id : selectionIds) {
			AosUserRolePO aosUserRolePO = aosUserRoleDao.selectByKey(Integer.valueOf(id));
			aosUserRoleDao.deleteByKey(Integer.valueOf(id));
			cacheUserDataService.resetGrantInfoOfUser(aosUserRolePO.getUser_id());
		}
		httpModel.setOutMsg("撤消用户角色关联关系成功。");
	}

}
