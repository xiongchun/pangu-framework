package aos.system.modules.role;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.framework.core.dao.SqlDao;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSListUtils;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.common.id.IdService;
import aos.system.common.utils.SystemCons;
import aos.system.common.utils.SystemUtils;
import aos.system.dao.AosModuleDao;
import aos.system.dao.AosRoleDao;
import aos.system.dao.AosRoleModuleDao;
import aos.system.dao.AosUserRoleDao;
import aos.system.dao.po.AosModulePO;
import aos.system.dao.po.AosOrgPO;
import aos.system.dao.po.AosRoleModulePO;
import aos.system.dao.po.AosRolePO;
import aos.system.dao.po.AosUserRolePO;
import aos.system.modules.cache.CacheUserDataService;

/**
 * 角色管理
 * 
 * @author xiongchun
 *
 */
@Service
public class RoleService {

	@Autowired
	private AosRoleDao aosRoleDao;
	@Autowired
	private AosModuleDao aosModuleDao;
	@Autowired
	private AosRoleModuleDao aosRoleModuleDao;
	@Autowired
	private AosUserRoleDao aosUserRoleDao;
	@Autowired
	private CacheUserDataService cacheUserDataService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private IdService idService;

	/**
	 * 角色管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		httpModel.setAttribute("orgPO", httpModel.getUserModel().getAosOrgPO());
		httpModel.setAttribute("super_role_id", SystemCons.SUPER_ROLE_ID);
		httpModel.setAttribute("role_module_id", SystemCons.ROLE_MODULE_ID);
		httpModel.setViewPath("system/role.jsp");
	}

	/**
	 * 查询角色列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listRole(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		qDto.put("org_cascade_id", httpModel.getUserModel().getAosOrgPO().getCascade_id());
		List<Dto> roleDtos = sqlDao.list("Role.listRolesPage", qDto);
		httpModel.setOutMsg(AOSJson.toGridJson(roleDtos, qDto.getPageTotal()));
	}

	/**
	 * 保存角色
	 * 
	 * @param httpModel
	 * @return
	 */
	public void saveRole(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		AosRolePO aosRolePO = new AosRolePO();
		aosRolePO.copyProperties(inDto);
		aosRolePO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
		aosRolePO.setCreate_by(httpModel.getUserModel().getId());
		aosRolePO.setCreate_time(AOSUtils.getDateTime());
		aosRoleDao.insert(aosRolePO);
		httpModel.setOutMsg("角色新增成功。");
	}

	/**
	 * 修改角色
	 * 
	 * @param httpModel
	 * @return
	 */
	public void updateRole(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		AosRolePO aosRolePO = new AosRolePO();
		aosRolePO.copyProperties(inDto);
		aosRoleDao.updateByKey(aosRolePO);
		httpModel.setOutMsg("角色修改成功。");
	}

	/**
	 * 删除角色
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void deleteRole(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id : selectionIds) {
			aosRoleDao.deleteByKey(Integer.valueOf(id));
			sqlDao.delete("Role.deleteUserRoleByRoleID", id);
		}
		httpModel.setOutMsg("角色删除成功。");
	}

	/**
	 * 获取经办权限导航树
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getTreeData(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		inDto.put("user_id", httpModel.getUserModel().getId());
		List<AosModulePO> aosModulePOs = Lists.newArrayList();
		inDto.setOrder("sort_no");
		if (StringUtils.equals(SystemCons.SUPER_USER_ID, String.valueOf(httpModel.getUserModel().getId()))) {
			// 超级用户
			aosModulePOs = aosModuleDao.list(inDto);
		} else {
			aosModulePOs = sqlDao.list("Role.listTreeData4Grant", inDto);
		}
		List<Dto> modelDtos = Lists.newArrayList();
		for (AosModulePO aosModulePO : aosModulePOs) {
			modelDtos.add(aosModulePO.toDto());
		}
		String treeJson = SystemUtils
				.toTreeModalAllInOne(toCheckedTreeModel(modelDtos, inDto, SystemCons.GRANT_TYPE.BIZ));
		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 获取管理权限导航树
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getAdminTreeData(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		inDto.put("user_id", httpModel.getUserModel().getId());
		List<AosModulePO> aosModulePOs = Lists.newArrayList();
		inDto.setOrder("sort_no");
		if (StringUtils.equals(SystemCons.SUPER_USER_ID, String.valueOf(httpModel.getUserModel().getId()))) {
			// 超级用户
			aosModulePOs = aosModuleDao.list(inDto);
		} else {
			aosModulePOs = sqlDao.list("Role.listTreeData4Grant", inDto);
		}
		List<Dto> modelDtos = Lists.newArrayList();
		for (AosModulePO aosModulePO : aosModulePOs) {
			modelDtos.add(aosModulePO.toDto());
		}
		String treeJson = SystemUtils
				.toTreeModalAllInOne(toCheckedTreeModel(modelDtos, inDto, SystemCons.GRANT_TYPE.ADMIN));

		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 复选框处理
	 * 
	 * @return
	 */
	private List<Dto> toCheckedTreeModel(List<Dto> modelDtos, Dto inDto, String grant_type) {
		inDto.setOrder(null);
		List<AosRoleModulePO> aosRoleModulePOs = aosRoleModuleDao.list(inDto);
		String jqlText = "SELECT * FROM :AOSList WHERE role_id = :role_id AND module_id = :module_id AND grant_type = :grant_type";
		for (Dto modelDto : modelDtos) {
			Dto qDto = Dtos.newDto("role_id", inDto.getString("role_id"));
			qDto.put("module_id", modelDto.getString("id"));
			qDto.put("grant_type", grant_type);
			List<AosRoleModulePO> subPOs = AOSListUtils.select(aosRoleModulePOs, AosRoleModulePO.class, jqlText,
					qDto);
			if (AOSUtils.isNotEmpty(subPOs)) {
				modelDto.put("checked", true);
			} else {
				modelDto.put("checked", false);
			}
		}
		return modelDtos;
	}

	/**
	 * 保存角色授权数据
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveGrantInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Dto outDto = Dtos.newOutDto();
		Integer role_id = inDto.getInteger("role_id");
		Integer user_id = httpModel.getUserModel().getId();
		Timestamp sysDate = AOSUtils.getDateTime();
		// 经办权限
		if (inDto.getBoolean("save_biz")) {
			String grant_rows = inDto.getString("grant_rows");
			Dto delBizDto = Dtos.newDto("role_id", role_id);
			delBizDto.put("grant_type", SystemCons.GRANT_TYPE.BIZ);
			sqlDao.delete("Role.deleteRoleModuleByRoleID", delBizDto);
			for (String id : StringUtils.split(grant_rows, ",")) {
				AosRoleModulePO aos_role_modulePO = new AosRoleModulePO();
				aos_role_modulePO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
				aos_role_modulePO.setModule_id(Integer.valueOf(id));
				aos_role_modulePO.setRole_id(role_id);
				aos_role_modulePO.setGrant_type(SystemCons.GRANT_TYPE.BIZ);
				aos_role_modulePO.setCreate_by(user_id);
				aos_role_modulePO.setCreate_time(sysDate);
				aosRoleModuleDao.insert(aos_role_modulePO);
			}
			// 重置删除和这个角色相关的用户的授权信息
			List<AosUserRolePO> aosUserRolePOs = aosUserRoleDao.list(Dtos.newDto("role_id", role_id));
			for (AosUserRolePO aosUserRolePO : aosUserRolePOs) {
				cacheUserDataService.resetGrantInfoOfUser(aosUserRolePO.getUser_id());
			}
		}

		// 管理权限
		if (inDto.getBoolean("save_admin")) {
			String admin_rows = inDto.getString("admin_rows");
			Dto delAdminDto = Dtos.newDto("role_id", inDto.getString("role_id"));
			delAdminDto.put("grant_type", SystemCons.GRANT_TYPE.ADMIN);
			sqlDao.delete("Role.deleteRoleModuleByRoleID", delAdminDto);
			for (String id : StringUtils.split(admin_rows, ",")) {
				AosRoleModulePO aos_role_modulePO = new AosRoleModulePO();
				aos_role_modulePO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
				aos_role_modulePO.setModule_id(Integer.valueOf(id));
				aos_role_modulePO.setRole_id(inDto.getInteger("role_id"));
				aos_role_modulePO.setGrant_type(SystemCons.GRANT_TYPE.ADMIN);
				aos_role_modulePO.setCreate_by(user_id);
				aos_role_modulePO.setCreate_time(sysDate);
				aosRoleModuleDao.insert(aos_role_modulePO);
			}
		}
		outDto.setAppMsg("角色数据授权成功。");

		httpModel.setOutMsg(AOSJson.toJson(outDto));

	}

	/**
	 * 查询待选用户列表
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
		qDto.put("cascade", qDto.getBoolean("cascade") ? 1 : 0);
		List<Dto> userDtos = sqlDao.list("Role.listUsersPage", qDto);

		httpModel.setOutMsg(AOSJson.toGridJson(userDtos, qDto.getPageTotal()));
	}

	/**
	 * 查询已选用户列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listSelectedUsers(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		AosOrgPO aosOrgPO = httpModel.getUserModel().getAosOrgPO();
		if (AOSUtils.isEmpty(qDto.getString("org_id"))) {
			qDto.put("org_id", aosOrgPO.getId());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id"))) {
			qDto.put("org_cascade_id", aosOrgPO.getCascade_id());
		}
		qDto.put("is_del", SystemCons.IS.NO);
		List<Dto> userDtos = sqlDao.list("Role.listSelectedUsersPage", qDto);

		httpModel.setOutMsg(AOSJson.toGridJson(userDtos, qDto.getPageTotal()));
	}

	/**
	 * 保存角色用户关联关系
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void saveRoleUserGrantInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Integer role_id = inDto.getInteger("role_id");
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id : selectionIds) {
			AosUserRolePO aosUserRolePO = new AosUserRolePO();
			aosUserRolePO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
			aosUserRolePO.setRole_id(role_id);
			aosUserRolePO.setUser_id(Integer.valueOf(id));
			aosUserRolePO.setCreate_by(httpModel.getUserModel().getId());
			aosUserRolePO.setCreate_time(AOSUtils.getDateTime());
			aosUserRoleDao.insert(aosUserRolePO);
			cacheUserDataService.resetGrantInfoOfUser(Integer.valueOf(id));
		}
		httpModel.setOutMsg("角色用户关联关系保存成功。");
	}

	/**
	 * 撤消角色用户关联关系
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void deleteRoleUserGrantInfo(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id : selectionIds) {
			AosUserRolePO aosUserRolePO = aosUserRoleDao.selectByKey(Integer.valueOf(id));
			aosUserRoleDao.deleteByKey(Integer.valueOf(id));
			cacheUserDataService.resetGrantInfoOfUser(aosUserRolePO.getUser_id());
		}
		httpModel.setOutMsg("撤消角色用户关联关系成功。");
	}

}
