package aos.system.modules.role;

import java.sql.Timestamp;
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
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSListUtils;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
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
public class RoleService extends AOSBaseService {

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

	/**
	 * 角色管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		httpModel.setAttribute("orgPO", httpModel.getUserModel().getAosOrgPO());
		httpModel.setAttribute("super_role_id", SystemCons.SUPER_ROLE_ID);
		httpModel.setAttribute("role_module_id_", SystemCons.ROLE_MODULE_id_);
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
		qDto.put("org_cascade_id_", httpModel.getUserModel().getAosOrgPO().getCascade_id_());
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
		aosRolePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
		aosRolePO.setCreate_by_(httpModel.getUserModel().getId_());
		aosRolePO.setCreate_time_(AOSUtils.getDateTime());
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
		for (String id_ : selectionIds) {
			aosRoleDao.deleteByKey(id_);
			sqlDao.delete("Role.deleteUserRoleByRoleID", id_);
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
		inDto.put("user_id_", httpModel.getUserModel().getId_());
		List<AosModulePO> aosModulePOs = Lists.newArrayList();
		inDto.setOrder("sort_no_");
		if (StringUtils.equals(SystemCons.SUPER_USER_ID, String.valueOf(httpModel.getUserModel().getId_()))) {
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
				.toTreeModalAllInOne(toCheckedTreeModel(modelDtos, inDto, SystemCons.GRANT_TYPE_.BIZ));

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
		inDto.put("user_id_", httpModel.getUserModel().getId_());
		List<AosModulePO> aosModulePOs = Lists.newArrayList();
		inDto.setOrder("sort_no_");
		if (StringUtils.equals(SystemCons.SUPER_USER_ID, String.valueOf(httpModel.getUserModel().getId_()))) {
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
				.toTreeModalAllInOne(toCheckedTreeModel(modelDtos, inDto, SystemCons.GRANT_TYPE_.ADMIN));

		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 复选框处理
	 * 
	 * @return
	 */
	private List<Dto> toCheckedTreeModel(List<Dto> modelDtos, Dto inDto, String grant_type_) {
		inDto.setOrder(null);
		List<AosRoleModulePO> aosRoleModulePOs = aosRoleModuleDao.list(inDto);
		String jqlText = "SELECT * FROM :AOSList WHERE role_id_ = :role_id_ AND module_id_ = :module_id_ AND grant_type_ = :grant_type_";
		for (Dto modelDto : modelDtos) {
			Dto qDto = Dtos.newDto("role_id_", inDto.getString("role_id_"));
			qDto.put("module_id_", modelDto.getString("id_"));
			qDto.put("grant_type_", grant_type_);
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
		String role_id_ = inDto.getString("role_id_");
		String user_id_ = httpModel.getUserModel().getId_();
		Timestamp sysDate = AOSUtils.getDateTime();
		// 经办权限
		if (inDto.getBoolean("save_biz_")) {
			String grant_rows = inDto.getString("grant_rows");
			Dto delBizDto = Dtos.newDto("role_id_", role_id_);
			delBizDto.put("grant_type_", SystemCons.GRANT_TYPE_.BIZ);
			sqlDao.delete("Role.deleteRoleModuleByRoleID", delBizDto);
			for (String id_ : StringUtils.split(grant_rows, ",")) {
				AosRoleModulePO aos_role_modulePO = new AosRoleModulePO();
				aos_role_modulePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
				aos_role_modulePO.setModule_id_(id_);
				aos_role_modulePO.setRole_id_(role_id_);
				aos_role_modulePO.setGrant_type_(SystemCons.GRANT_TYPE_.BIZ);
				aos_role_modulePO.setCreate_by_(user_id_);
				aos_role_modulePO.setCreate_time_(sysDate);
				aosRoleModuleDao.insert(aos_role_modulePO);
			}
			// 重置删除和这个角色相关的用户的授权信息
			List<AosUserRolePO> aosUserRolePOs = aosUserRoleDao.list(Dtos.newDto("role_id_", role_id_));
			for (AosUserRolePO aosUserRolePO : aosUserRolePOs) {
				cacheUserDataService.resetGrantInfoOfUser(aosUserRolePO.getUser_id_());
			}
		}

		// 管理权限
		if (inDto.getBoolean("save_admin_")) {
			String admin_rows = inDto.getString("admin_rows");
			Dto delAdminDto = Dtos.newDto("role_id_", inDto.getString("role_id_"));
			delAdminDto.put("grant_type_", SystemCons.GRANT_TYPE_.ADMIN);
			sqlDao.delete("Role.deleteRoleModuleByRoleID", delAdminDto);
			for (String id_ : StringUtils.split(admin_rows, ",")) {
				AosRoleModulePO aos_role_modulePO = new AosRoleModulePO();
				aos_role_modulePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
				aos_role_modulePO.setModule_id_(id_);
				aos_role_modulePO.setRole_id_(inDto.getString("role_id_"));
				aos_role_modulePO.setGrant_type_(SystemCons.GRANT_TYPE_.ADMIN);
				aos_role_modulePO.setCreate_by_(user_id_);
				aos_role_modulePO.setCreate_time_(sysDate);
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
		if (AOSUtils.isEmpty(qDto.getString("org_id_"))) {
			qDto.put("org_id_", aosOrgPO.getId_());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id_"))) {
			qDto.put("org_cascade_id_", aosOrgPO.getCascade_id_());
		}
		qDto.put("is_del_", SystemCons.IS.NO);
		qDto.put("cascade_", qDto.getBoolean("cascade_") ? 1 : 0);
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
		if (AOSUtils.isEmpty(qDto.getString("org_id_"))) {
			qDto.put("org_id_", aosOrgPO.getId_());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id_"))) {
			qDto.put("org_cascade_id_", aosOrgPO.getCascade_id_());
		}
		qDto.put("is_del_", SystemCons.IS.NO);
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
		String role_id = inDto.getString("role_id_");
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id_ : selectionIds) {
			AosUserRolePO aosUserRolePO = new AosUserRolePO();
			aosUserRolePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
			aosUserRolePO.setRole_id_(role_id);
			aosUserRolePO.setUser_id_(id_);
			aosUserRolePO.setCreate_by_(httpModel.getUserModel().getId_());
			aosUserRolePO.setCreate_time_(AOSUtils.getDateTime());
			aosUserRoleDao.insert(aosUserRolePO);
			cacheUserDataService.resetGrantInfoOfUser(id_);
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
		for (String id_ : selectionIds) {
			AosUserRolePO aosUserRolePO = aosUserRoleDao.selectByKey(id_);
			aosUserRoleDao.deleteByKey(id_);
			cacheUserDataService.resetGrantInfoOfUser(aosUserRolePO.getUser_id_());
		}
		httpModel.setOutMsg("撤消角色用户关联关系成功。");
	}

}
