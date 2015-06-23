package cn.osworks.aos.modules.system.service.auth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_moduleMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_module_roleMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_orgMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_roleMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_user_roleMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_modulePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_module_rolePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_orgPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_rolePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_user_rolePO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.modules.system.service.SystemService;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;
import cn.osworks.aos.web.misc.DicCons;
import cn.osworks.aos.web.misc.IdCons;

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
	private Aos_au_roleMapper aos_au_roleMapper;
	@Autowired
	private Aos_au_orgMapper aos_au_orgMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_au_moduleMapper aos_au_moduleMapper;
	@Autowired
	private Aos_au_module_roleMapper aos_au_module_roleMapper;
	@Autowired
	private Aos_au_user_roleMapper aos_au_user_roleMapper;
	@Autowired
	private SystemService systemService;
	@Autowired
	private UserService userService;

	/**
	 * 保存角色列表
	 */
	public void saveRole(Dto inDto) {
		Aos_au_rolePO aos_au_rolePO = new Aos_au_rolePO();
		AOSUtils.apply(inDto, aos_au_rolePO);
		aos_au_rolePO.setId_(AOSId.id(IdCons.GID));
		UserInfoVO userInfoVO = inDto.getUserInfo();
		aos_au_rolePO.setCreater_id_(userInfoVO.getId_());
		aos_au_rolePO.setCreate_time_(AOSUtils.getDateTimeStr());
		Aos_au_orgPO aos_au_orgPO = aos_au_orgMapper.selectByKey(userInfoVO.getOrg_id_());
		aos_au_rolePO.setCreater_org_id_(aos_au_orgPO.getId_());
		aos_au_rolePO.setCreater_org_cascade_id_(aos_au_orgPO.getCascade_id_());
		aos_au_roleMapper.insert(aos_au_rolePO);
	}

	/**
	 * 修改角色
	 * 
	 * @param inDto
	 */
	public void updateRole(Dto inDto) {
		Aos_au_rolePO aos_au_rolePO = new Aos_au_rolePO();
		AOSUtils.apply(inDto, aos_au_rolePO);
		aos_au_roleMapper.updateByKey(aos_au_rolePO);
	}

	/**
	 * 删除角色
	 * 
	 * @param qDto
	 */
	public Dto deleteRole(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getSelection();
		int cancel = 0, del = 0;
		for (String id_ : selections) {
			Aos_au_rolePO aos_au_rolePO = aos_au_roleMapper.selectByKey(id_);
			if (aos_au_rolePO.getType_().equals(DicCons.ROLE_TYPE_SYSTEM)) {
				cancel++;
				continue;
			}
			// 删除用户-角色关联表
			sqlDao.delete("Auth.deleteAos_au_user_roleByRole_id_", Dtos.newDto("role_id_", id_));
			// 删除角色-菜单关联表
			sqlDao.delete("Auth.deleteAos_au_module_roleByRole_id_", Dtos.newDto("role_id_", id_));
			//删除角色-页面元素关联表
	    	sqlDao.delete("Auth.deleteAos_au_element_grantByRole_id_", id_);
			// 删除角色自己
			aos_au_roleMapper.deleteByKey(id_);
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
	public void updateStatus(Dto qDto) {
		String[] selections = qDto.getSelection();
		Aos_au_rolePO aos_au_rolePO = new Aos_au_rolePO();
		aos_au_rolePO.setStatus_(qDto.getString("status_"));
		for (String id_ : selections) {
			aos_au_rolePO.setId_(id_);
			aos_au_roleMapper.updateByKey(aos_au_rolePO);
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
		List<Aos_au_modulePO> aos_au_modulePOs = Lists.newArrayList();
		//超级用户获取所有菜单
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			inDto.setOrder("sort_no_ ASC");
			inDto.put("status_", DicCons.ENABLED_YES);
		    aos_au_modulePOs = aos_au_moduleMapper.list(inDto);
		}else{
		    //权限用户	根据管理权限获取可再授权菜单
			inDto.put("user_id_", userInfoVO.getId_());  //当前登录用户
			aos_au_modulePOs = systemService.getAdminModulesOfUser(inDto);
		}
		return toTreeModal(aos_au_modulePOs, inDto);
	}

	/**
	 * 转换为树模型
	 * 
	 * @param inDto
	 * @return
	 */
	public String toTreeModal(List<Aos_au_modulePO>aos_au_modulePOs, Dto inDto) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		Dto aos_au_module_roleDto = Dtos.newDto();
		aos_au_module_roleDto.put("role_id_", inDto.getString("role_id_"));
		aos_au_module_roleDto.put("grant_type_", inDto.getString("grant_type_"));
		List<Aos_au_module_rolePO> aos_au_module_rolePOs = aos_au_module_roleMapper.list(aos_au_module_roleDto);
		for (Aos_au_modulePO aos_au_modulePO : aos_au_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_au_modulePO.getId_());
			treeNode.setText(aos_au_modulePO.getName_());
			treeNode.setParentId(aos_au_modulePO.getParent_id_());
			treeNode.setIcon(aos_au_modulePO.getIcon_name_());
			boolean checked = false;
			for (Aos_au_module_rolePO aos_au_module_rolePO : aos_au_module_rolePOs) {
				if (aos_au_module_rolePO.getModule_id_().equals(aos_au_modulePO.getId_())) {
					checked = true;
					break;
				}
			}
			treeNode.setChecked(checked);
			boolean leaf = true;
			if (aos_au_modulePO.getIs_leaf_().equals("0")) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_au_modulePO.getIs_auto_expand_().equals("0")) {
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
		List<Aos_au_modulePO> aos_au_modulePOs = sqlDao.list("Auth.listRoleModuleSelected", inDto);
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_au_modulePO aos_au_modulePO : aos_au_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_au_modulePO.getId_());
			treeNode.setText(aos_au_modulePO.getName_());
			treeNode.setParentId(aos_au_modulePO.getParent_id_());
			treeNode.setIcon(aos_au_modulePO.getIcon_name_());
			boolean leaf = true;
			if (aos_au_modulePO.getIs_leaf_().equals("0")) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_au_modulePO.getIs_auto_expand_().equals("0")) {
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
	public void saveRoleModuleGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		Dto delDto = Dtos.newDto();
		delDto.put("role_id_", pDto.getString("role_id_"));
		delDto.put("grant_type_", pDto.getString("grant_type_"));
		// 每次授权都将历史数据清零
		sqlDao.delete("Auth.deleteAos_au_module_roleByDto", delDto);
		String[] selections = pDto.getSelection();
		Aos_au_module_rolePO aos_au_module_rolePO = new Aos_au_module_rolePO();
		for (String module_id_ : selections) {
			aos_au_module_rolePO.setId_(AOSId.id(IdCons.RID));
			aos_au_module_rolePO.setModule_id_(module_id_);
			aos_au_module_rolePO.setRole_id_(pDto.getString("role_id_"));
			aos_au_module_rolePO.setGrant_type_(pDto.getString("grant_type_"));
			aos_au_module_rolePO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_au_module_rolePO.setOperator_id_(userInfoVO.getId_());
			aos_au_module_roleMapper.insert(aos_au_module_rolePO);
		}
	}

	/**
	 * 保存角色-用户授权信息
	 * 
	 * @param pDto
	 */
	public void saveRoleUserGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		String[] selections = pDto.getSelection();
		Aos_au_user_rolePO aos_au_user_rolePO = new Aos_au_user_rolePO();
		for (String user_id_ : selections) {
			aos_au_user_rolePO.setId_(AOSId.id(IdCons.RID));
			aos_au_user_rolePO.setRole_id_(pDto.getString("role_id_"));
			aos_au_user_rolePO.setUser_id_(user_id_);
			aos_au_user_rolePO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_au_user_rolePO.setOperator_id_(userInfoVO.getId_());
			aos_au_user_roleMapper.insert(aos_au_user_rolePO);
		}
	}
	
	/**
	 * 查询角色用户授权待选用户
	 * @param qDto
	 * @return
	 */
	public List<Dto> getUsersInOrg4Grant(Dto qDto) {
		List<Dto> list = userService.getUsersInOrg(qDto);
		List<Dto> aos_au_userList = Lists.newArrayList();
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("role_id_", qDto.getString("role_id_"));
		for (Dto userDto : list) {
			calcDto.put("user_id_", userDto.getString("id_"));
			Integer countInteger = Integer.valueOf(aos_au_user_roleMapper.calc(calcDto));
			if (countInteger == 0) {
				aos_au_userList.add(userDto);
			}
		}
		return aos_au_userList;
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
	public Dto delRoleUserGrantInfo(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getSelection();
		for (String user_role_id_ : selections) {
			aos_au_user_roleMapper.deleteByKey(user_role_id_);
		}
		outDto.setIntegerA(selections.length);
		return outDto;
	}

}
