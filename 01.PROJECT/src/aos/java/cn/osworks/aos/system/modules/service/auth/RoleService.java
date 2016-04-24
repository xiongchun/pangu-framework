package cn.osworks.aos.system.modules.service.auth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_roleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_roleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_roleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_rolePO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_rolePO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_rolePO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 用户与授权
 * 
 * @author OSWorks-XC
 * @date 2014-07-16
 */
@Service
public class RoleService {

	@Autowired
	private Aos_sys_roleMapper aos_sys_roleMapper;
	@Autowired
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private Aos_sys_module_roleMapper aos_sys_module_roleMapper;
	@Autowired
	private Aos_sys_user_roleMapper aos_sys_user_roleMapper;
	@Autowired
	private SystemService systemService;
	@Autowired
	private UserService userService;

	/**
	 * 保存角色列表
	 */
	@Transactional
	public void saveRole(Dto inDto) {
		Aos_sys_rolePO aos_sys_rolePO = new Aos_sys_rolePO();
		AOSUtils.copyProperties(inDto, aos_sys_rolePO);
		aos_sys_rolePO.setId_(AOSId.uuid());
		UserInfoVO userInfoVO = inDto.getUserInfo();
		aos_sys_rolePO.setCreater_id_(userInfoVO.getId_());
		aos_sys_rolePO.setCreate_time_(AOSUtils.getDateTimeStr());
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(userInfoVO.getOrg_id_());
		aos_sys_rolePO.setCreater_org_id_(aos_sys_orgPO.getId_());
		aos_sys_rolePO.setCreater_org_cascade_id_(aos_sys_orgPO.getCascade_id_());
		aos_sys_roleMapper.insert(aos_sys_rolePO);
	}

	/**
	 * 修改角色
	 * 
	 * @param inDto
	 */
	@Transactional
	public void updateRole(Dto inDto) {
		Aos_sys_rolePO aos_sys_rolePO = new Aos_sys_rolePO();
		AOSUtils.copyProperties(inDto, aos_sys_rolePO);
		aos_sys_roleMapper.updateByKey(aos_sys_rolePO);
	}

	/**
	 * 删除角色
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deleteRole(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		int cancel = 0, del = 0;
		for (String id_ : selections) {
			Aos_sys_rolePO aos_sys_rolePO = aos_sys_roleMapper.selectByKey(id_);
			if (aos_sys_rolePO.getType_().equals(DicCons.ROLE_TYPE_SYSTEM)) {
				cancel++;
				continue;
			}
			// 删除用户-角色关联表
			sqlDao.delete("Auth.deleteAos_sys_user_roleByRole_id_", Dtos.newDto("role_id_", id_));
			// 删除角色-菜单关联表
			sqlDao.delete("Auth.deleteAos_sys_module_roleByRole_id_", Dtos.newDto("role_id_", id_));
			//删除角色-页面元素关联表
	    	sqlDao.delete("Auth.deleteAos_sys_element_grantByRole_id_", id_);
			// 删除角色自己
			aos_sys_roleMapper.deleteByKey(id_);
			del++;
		}
		String msg = "操作完成, ";
		if (del > 0) {
			msg = AOSUtils.merge(msg + "成功删除角色[{0}]个。", del);
		}
		if (cancel > 0) {
			msg = AOSUtils.merge(msg + "取消系统内置用户删除操作[{0}]个。(提示：内置角色不能删除)", cancel);
		}
		outDto.setAppMsg(msg);
		return outDto;
	}

	/**
	 * 更新角色状态
	 * 
	 * @param qDto
	 */
	@Transactional
	public void updateStatus(Dto qDto) {
		String[] selections = qDto.getRows();
		Aos_sys_rolePO aos_sys_rolePO = new Aos_sys_rolePO();
		aos_sys_rolePO.setStatus_(qDto.getString("status_"));
		for (String id_ : selections) {
			aos_sys_rolePO.setId_(id_);
			aos_sys_roleMapper.updateByKey(aos_sys_rolePO);
		}
	}
	
	/**
	 * 获取菜单树(一次加载全部节点) 授权选择
	 * 
	 * @param inDto
	 * @return
	 */
	public String getModuleTree4Select(Dto inDto){
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Aos_sys_modulePO> aos_sys_modulePOs = Lists.newArrayList();
		//超级用户获取所有菜单
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			inDto.setOrder("sort_no_ ASC");
			inDto.put("status_", DicCons.ENABLED_YES);
		    aos_sys_modulePOs = aos_sys_moduleMapper.list(inDto);
		}else{
		    //权限用户	根据管理权限获取可再授权菜单
			inDto.put("user_id_", userInfoVO.getId_());  //当前登录用户
			aos_sys_modulePOs = systemService.getAdminModulesOfUser(inDto);
		}
		return toTreeModal(aos_sys_modulePOs, inDto);
	}

	/**
	 * 转换为树模型
	 * 
	 * @param inDto
	 * @return
	 */
	public String toTreeModal(List<Aos_sys_modulePO>aos_sys_modulePOs, Dto inDto) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		Dto aos_sys_module_roleDto = Dtos.newDto();
		aos_sys_module_roleDto.put("role_id_", inDto.getString("role_id_"));
		aos_sys_module_roleDto.put("grant_type_", inDto.getString("grant_type_"));
		List<Aos_sys_module_rolePO> aos_sys_module_rolePOs = aos_sys_module_roleMapper.list(aos_sys_module_roleDto);
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			boolean checked = false;
			for (Aos_sys_module_rolePO aos_sys_module_rolePO : aos_sys_module_rolePOs) {
				if (aos_sys_module_rolePO.getModule_id_().equals(aos_sys_modulePO.getId_())) {
					checked = true;
					break;
				}
			}
			treeNode.setChecked(checked);
			boolean leaf = true;
			if (aos_sys_modulePO.getIs_leaf_().equals("0")) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_sys_modulePO.getIs_auto_expand_().equals("0")) {
				expanded = false;
			}
			treeNode.setExpanded(expanded);
			treeNodes.add(treeNode);
		}
		return TreeBuilder.build(treeNodes);
	}

	/**
	 * 获取菜单树(一次加载全部节点) 查看已授权
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto getModuleTree4Selected(Dto inDto) {
		Dto outDto = Dtos.newDto();
		inDto.put("status_", DicCons.ENABLED_YES);
		List<Aos_sys_modulePO> aos_sys_modulePOs = sqlDao.list("Auth.listRoleModuleSelected", inDto);
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			boolean leaf = true;
			if (aos_sys_modulePO.getIs_leaf_().equals("0")) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_sys_modulePO.getIs_auto_expand_().equals("0")) {
				expanded = false;
			}
			treeNode.setExpanded(expanded);
			treeNodes.add(treeNode);
		}
		String jsonString = TreeBuilder.build(treeNodes);
		outDto.setStringA(jsonString);
		return outDto;
	}

	/**
	 * 保存角色-功能模块授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveRoleModuleGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		Dto delDto = Dtos.newDto();
		delDto.put("role_id_", pDto.getString("role_id_"));
		delDto.put("grant_type_", pDto.getString("grant_type_"));
		// 每次授权都将历史数据清零
		sqlDao.delete("Auth.deleteAos_sys_module_roleByDto", delDto);
		String[] selections = pDto.getRows();
		Aos_sys_module_rolePO aos_sys_module_rolePO = new Aos_sys_module_rolePO();
		for (String module_id_ : selections) {
			aos_sys_module_rolePO.setId_(AOSId.uuid());
			aos_sys_module_rolePO.setModule_id_(module_id_);
			aos_sys_module_rolePO.setRole_id_(pDto.getString("role_id_"));
			aos_sys_module_rolePO.setGrant_type_(pDto.getString("grant_type_"));
			aos_sys_module_rolePO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_module_rolePO.setOperator_id_(userInfoVO.getId_());
			aos_sys_module_roleMapper.insert(aos_sys_module_rolePO);
		}
	}

	/**
	 * 保存角色-用户授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveRoleUserGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		String[] selections = pDto.getRows();
		Aos_sys_user_rolePO aos_sys_user_rolePO = new Aos_sys_user_rolePO();
		for (String user_id_ : selections) {
			aos_sys_user_rolePO.setId_(AOSId.uuid());
			aos_sys_user_rolePO.setRole_id_(pDto.getString("role_id_"));
			aos_sys_user_rolePO.setUser_id_(user_id_);
			aos_sys_user_rolePO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_user_rolePO.setOperator_id_(userInfoVO.getId_());
			aos_sys_user_roleMapper.insert(aos_sys_user_rolePO);
		}
	}
	
	/**
	 * 查询角色用户授权待选用户
	 * @param qDto
	 * @return
	 */
	public List<Dto> getUsersInOrg4Grant(Dto qDto) {
		List<Dto> list = userService.getUsersInOrg(qDto);
		List<Dto> aos_sys_userList = Lists.newArrayList();
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("role_id_", qDto.getString("role_id_"));
		for (Dto userDto : list) {
			calcDto.put("user_id_", userDto.getString("id_"));
			Integer countInteger = Integer.valueOf(aos_sys_user_roleMapper.calc(calcDto));
			if (countInteger == 0) {
				aos_sys_userList.add(userDto);
			}
		}
		return aos_sys_userList;
	}
	
	/**
	 * 查询角色已授权用户集合
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listGrantedUsersOfRole(Dto inDto){
		List<Dto> grantedList = sqlDao.list("Auth.listGrantedUsersOfRole", inDto);
		return grantedList;
	}
	
	/**
	 * 取消角色用户授权
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto delRoleUserGrantInfo(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		for (String user_role_id_ : selections) {
			aos_sys_user_roleMapper.deleteByKey(user_role_id_);
		}
		outDto.setIntegerA(selections.length);
		return outDto;
	}

}
