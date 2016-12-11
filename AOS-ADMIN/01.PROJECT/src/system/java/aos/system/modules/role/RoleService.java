package aos.system.modules.role;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.framework.core.id.AOSId;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSListUtils;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.common.service.AOSBaseService;
import aos.system.common.utils.SystemCons;
import aos.system.common.utils.SystemUtils;
import aos.system.dao.Aos_moduleDao;
import aos.system.dao.Aos_modulePO;
import aos.system.dao.Aos_orgPO;
import aos.system.dao.Aos_roleDao;
import aos.system.dao.Aos_rolePO;
import aos.system.dao.Aos_role_moduleDao;
import aos.system.dao.Aos_role_modulePO;
import aos.system.dao.Aos_user_roleDao;
import aos.system.dao.Aos_user_rolePO;
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
	private Aos_roleDao aos_roleDao;
	@Autowired
	private Aos_moduleDao aos_moduleDao;
	@Autowired
	private Aos_role_moduleDao aos_role_moduleDao;
	@Autowired
	private Aos_user_roleDao aos_user_roleDao;
	@Autowired
	private CacheUserDataService cacheUserDataService;

	/**
	 * 角色管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		httpModel.setAttribute("orgPO", httpModel.getUserModel().getAos_orgPO());
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
		qDto.put("org_cascade_id_", httpModel.getUserModel().getAos_orgPO().getCascade_id_());
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
		Aos_rolePO aos_rolePO = new Aos_rolePO();
		aos_rolePO.copyProperties(inDto);
		aos_rolePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
		aos_rolePO.setCreate_by_(httpModel.getUserModel().getId_());
		aos_rolePO.setCreate_time_(AOSUtils.getDateTime());
		aos_roleDao.insert(aos_rolePO);
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
		Aos_rolePO aos_rolePO = new Aos_rolePO();
		aos_rolePO.copyProperties(inDto);
		aos_roleDao.updateByKey(aos_rolePO);
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
			aos_roleDao.deleteByKey(id_);
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
		List<Aos_modulePO> aos_modulePOs = Lists.newArrayList();
		inDto.setOrder("sort_no_");
		if (StringUtils.equals(SystemCons.SUPER_USER_ID, String.valueOf(httpModel.getUserModel().getId_()))) {
			// 超级用户
			aos_modulePOs = aos_moduleDao.list(inDto);
		} else {
			aos_modulePOs = sqlDao.list("Role.listTreeData4Grant", inDto);
		}
		List<Dto> modelDtos = Lists.newArrayList();
		for (Aos_modulePO aos_modulePO : aos_modulePOs) {
			modelDtos.add(aos_modulePO.toDto());
		}
		String treeJson = SystemUtils.toTreeModalAllInOne(toCheckedTreeModel(modelDtos, inDto, SystemCons.GRANT_TYPE_.BIZ));

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
		List<Aos_modulePO> aos_modulePOs = Lists.newArrayList();
		inDto.setOrder("sort_no_");
		if (StringUtils.equals(SystemCons.SUPER_USER_ID, String.valueOf(httpModel.getUserModel().getId_()))) {
			// 超级用户
			aos_modulePOs = aos_moduleDao.list(inDto);
		} else {
			aos_modulePOs = sqlDao.list("Role.listTreeData4Grant", inDto);
		}
		List<Dto> modelDtos = Lists.newArrayList();
		for (Aos_modulePO aos_modulePO : aos_modulePOs) {
			modelDtos.add(aos_modulePO.toDto());
		}
		String treeJson = SystemUtils.toTreeModalAllInOne(toCheckedTreeModel(modelDtos, inDto, SystemCons.GRANT_TYPE_.ADMIN));

		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 复选框处理
	 * 
	 * @return
	 */
	private List<Dto> toCheckedTreeModel(List<Dto> modelDtos, Dto inDto, String grant_type_) {
		inDto.setOrder(null);
		List<Aos_role_modulePO> aos_role_modulePOs = aos_role_moduleDao.list(inDto);
		String jqlText = "SELECT * FROM :AOSList WHERE role_id_ = :role_id_ AND module_id_ = :module_id_ AND grant_type_ = :grant_type_";
		for (Dto modelDto : modelDtos) {
			Dto qDto = Dtos.newDto("role_id_", inDto.getString("role_id_"));
			qDto.put("module_id_", modelDto.getString("id_"));
			qDto.put("grant_type_", grant_type_);
			List<Aos_role_modulePO> subPOs = AOSListUtils.select(aos_role_modulePOs, Aos_role_modulePO.class, jqlText, qDto);
			if (AOSUtils.isNotEmpty(subPOs)) {
				modelDto.put("checked", true);
			} else{
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
		String grant_rows = inDto.getString("grant_rows");
		if (AOSUtils.isNotEmpty(grant_rows)) {
			Dto delDto = Dtos.newDto("role_id_", role_id_);
			delDto.put("grant_type_", SystemCons.GRANT_TYPE_.BIZ);
			sqlDao.delete("Role.deleteRoleModuleByRoleID", delDto);
			for (String id_ : StringUtils.split(grant_rows, ",")) {
				Aos_role_modulePO aos_role_modulePO = new Aos_role_modulePO();
				aos_role_modulePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
				aos_role_modulePO.setModule_id_(id_);
				aos_role_modulePO.setRole_id_(role_id_);
				aos_role_modulePO.setGrant_type_(SystemCons.GRANT_TYPE_.BIZ);
				aos_role_modulePO.setCreate_by_(user_id_);
				aos_role_modulePO.setCreate_time_(sysDate);
				aos_role_moduleDao.insert(aos_role_modulePO);
			}
			//重置和这个角色相关的用户的授权信息
			List<Aos_user_rolePO> aos_user_rolePOs = aos_user_roleDao.list(Dtos.newDto("role_id_", role_id_));
			for (Aos_user_rolePO aos_user_rolePO : aos_user_rolePOs) {
				cacheUserDataService.resetGrantInfoOfUser(aos_user_rolePO.getUser_id_());
			}
		}

		// 管理权限
		String admin_rows = inDto.getString("admin_rows");
		if (AOSUtils.isNotEmpty(admin_rows)) {
			Dto delDto = Dtos.newDto("role_id_", inDto.getString("role_id_"));
			delDto.put("grant_type_", SystemCons.GRANT_TYPE_.ADMIN);
			sqlDao.delete("Role.deleteRoleModuleByRoleID", delDto);
			for (String id_ : StringUtils.split(admin_rows, ",")) {
				Aos_role_modulePO aos_role_modulePO = new Aos_role_modulePO();
				aos_role_modulePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
				aos_role_modulePO.setModule_id_(id_);
				aos_role_modulePO.setRole_id_(inDto.getString("role_id_"));
				aos_role_modulePO.setGrant_type_(SystemCons.GRANT_TYPE_.ADMIN);
				aos_role_modulePO.setCreate_by_(user_id_);
				aos_role_modulePO.setCreate_time_(sysDate);
				aos_role_moduleDao.insert(aos_role_modulePO);
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
		Aos_orgPO aos_orgPO = httpModel.getUserModel().getAos_orgPO();
		if (AOSUtils.isEmpty(qDto.getString("org_id_"))) {
			qDto.put("org_id_", aos_orgPO.getId_());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id_"))) {
			qDto.put("org_cascade_id_", aos_orgPO.getCascade_id_());
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
		Aos_orgPO aos_orgPO = httpModel.getUserModel().getAos_orgPO();
		if (AOSUtils.isEmpty(qDto.getString("org_id_"))) {
			qDto.put("org_id_", aos_orgPO.getId_());
		}
		if (AOSUtils.isEmpty(qDto.getString("org_cascade_id_"))) {
			qDto.put("org_cascade_id_", aos_orgPO.getCascade_id_());
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
			Aos_user_rolePO aos_user_rolePO = new Aos_user_rolePO();
			aos_user_rolePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
			aos_user_rolePO.setRole_id_(role_id);
			aos_user_rolePO.setUser_id_(id_);
			aos_user_rolePO.setCreate_by_(httpModel.getUserModel().getId_());
			aos_user_rolePO.setCreate_time_(AOSUtils.getDateTime());
			aos_user_roleDao.insert(aos_user_rolePO);
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
			Aos_user_rolePO aos_user_rolePO = aos_user_roleDao.selectByKey(id_);
			aos_user_roleDao.deleteByKey(id_);
			cacheUserDataService.resetGrantInfoOfUser(aos_user_rolePO.getUser_id_());
		}
		httpModel.setOutMsg("撤消角色用户关联关系成功。");
	}
	
}
