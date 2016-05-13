package cn.osworks.aos.system.modules.service.auth;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCodec;
import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.asset.SystemUtils;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_pageMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_cfgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_extMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_roleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_pagePO;
import cn.osworks.aos.system.dao.po.Aos_sys_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_extPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_rolePO;
import cn.osworks.aos.system.modules.dao.vo.ElementVO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.system.modules.service.resource.ModuleService;
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
public class UserService {

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private Aos_sys_userMapper aos_sys_userMapper;
	@Autowired
	private Aos_sys_user_cfgMapper aos_sys_user_cfgMapper;
	@Autowired
	private Aos_sys_module_userMapper aos_sys_module_userMapper;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private Aos_sys_user_postMapper aos_sys_user_postMapper;
	@Autowired
	private Aos_sys_user_roleMapper aos_sys_user_roleMapper;
	@Autowired
	private SystemService systemService;
	@Autowired
	private PostService postService;
	@Autowired
	private Aos_sys_user_extMapper aos_sys_user_extMapper;
	@Autowired 
	private ModuleService moduleService;
	@Autowired 
	private Aos_sys_pageMapper aos_sys_pageMapper;

	/**
	 * 查询用户信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto getUser(Dto inDto) {
		String id_ = inDto.getString("id_");
		Dto outDto = Dtos.newDto();
		Aos_sys_userPO aos_sys_userPO = aos_sys_userMapper.selectByKey(id_);
		aos_sys_userPO.setPassword_(null); // 保护字段
		outDto.putAll(aos_sys_userPO.toDto());
		Aos_sys_user_extPO aos_sys_user_extPO = aos_sys_user_extMapper.selectByKey(id_);
		outDto.putAll(aos_sys_user_extPO.toDto());
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = aos_sys_user_cfgMapper.selectByKey(id_);
		outDto.putAll(aos_sys_user_cfgPO.toDto());
		// 查询所属组织
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_userPO.getOrg_id_());
		outDto.put("org_name_", aos_sys_orgPO.getName_());
		return outDto;
	}

	/**
	 * 保存用户信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto saveUser(Dto inDto) {
		Dto outDto = Dtos.newDto();
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		AOSUtils.copyProperties(inDto, aos_sys_userPO);
		if (!checkAccount(aos_sys_userPO.getAccount_())) {
			outDto.setAppCode(AOSCons.ERROR);
			String msg = AOSUtils.merge("登录帐号[{0}]已被其它用户占用, 请重新输入。", aos_sys_userPO.getAccount_());
			outDto.setAppMsg(msg);
			return outDto;
		}
		aos_sys_userPO.setId_(AOSId.uuid());
		UserInfoVO userInfoVO = inDto.getUserInfo();
		aos_sys_userPO.setCreater_id_(userInfoVO.getId_());
		aos_sys_userPO.setCreate_time_(AOSUtils.getDateTimeStr());
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_userPO.getOrg_id_());
		aos_sys_userPO.setOrg_cascade_id_(aos_sys_orgPO.getCascade_id_());
		String password = encryptPwd(aos_sys_userPO.getPassword_());
		aos_sys_userPO.setPassword_(password);
		aos_sys_userPO.setStatus_(DicCons.USER_STATUS_NORMAL);
		aos_sys_userPO.setType_(DicCons.USER_TYPE_DEFAULT);
		aos_sys_userPO.setDelete_flag_(DicCons.DELETE_FLAG.NO);
		aos_sys_userMapper.insert(aos_sys_userPO);

		// 写用户扩展表
		Aos_sys_user_extPO aos_sys_user_extPO = new Aos_sys_user_extPO();
		AOSUtils.copyProperties(inDto, aos_sys_user_extPO);
		aos_sys_user_extPO.setId_(aos_sys_userPO.getId_());
		aos_sys_user_extMapper.insert(aos_sys_user_extPO);

		// 写用户配置信息表
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = new Aos_sys_user_cfgPO();
		AOSUtils.copyProperties(inDto, aos_sys_user_cfgPO);
		aos_sys_user_cfgPO.setId_(aos_sys_userPO.getId_());
		aos_sys_user_cfgMapper.insert(aos_sys_user_cfgPO);

		outDto.setAppCode(AOSCons.SUCCESS);
		outDto.setAppMsg("操作完成，用户新增成功。");
		return outDto;
	}

	/**
	 * 检测登录帐号的唯一性
	 * 
	 * @param account_
	 * @return
	 */
	public boolean checkAccount(String account_) {
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("account_", account_);
		calcDto.put("delete_flag_", DicCons.DELETE_FLAG.NO);
		Integer countInteger = Integer.valueOf(aos_sys_userMapper.calc(calcDto));
		boolean out = true;
		if (countInteger > 0) {
			out = false;
		}
		return out;
	}

	/**
	 * 修改用户信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto updateUser(Dto inDto) {
		Dto outDto = Dtos.newDto();
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		AOSUtils.copyProperties(inDto, aos_sys_userPO);
		Aos_sys_userPO oldAos_sys_userPO = aos_sys_userMapper.selectByKey(aos_sys_userPO.getId_());
		if (!aos_sys_userPO.getAccount_().equalsIgnoreCase(oldAos_sys_userPO.getAccount_())) {
			if (!checkAccount(aos_sys_userPO.getAccount_())) {
				outDto.setAppCode(AOSCons.ERROR);
				String msg = AOSUtils.merge("登录帐号[{0}]已被其它用户占用, 请重新输入。", aos_sys_userPO.getAccount_());
				outDto.setAppMsg(msg);
				return outDto;
			}
		}
		// 修改了所属部门
		if (!inDto.getString("org_id_").equals(inDto.getString("old_org_id_"))) {
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_userPO.getOrg_id_());
			aos_sys_userPO.setOrg_cascade_id_(aos_sys_orgPO.getCascade_id_());
			// 删除用户-岗位关联表
			sqlDao.delete("Auth.deleteAos_sys_user_postByUser_id_", aos_sys_userPO.getId_());
		}
		// 更新用户基本信息
		aos_sys_userMapper.updateByKey(aos_sys_userPO);
		// 更新用户扩展信息
		Aos_sys_user_extPO aos_sys_user_extPO = new Aos_sys_user_extPO();
		AOSUtils.copyProperties(inDto, aos_sys_user_extPO);
		aos_sys_user_extMapper.updateByKey(aos_sys_user_extPO);
		// 更新用户配置信息
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = new Aos_sys_user_cfgPO();
		AOSUtils.copyProperties(inDto, aos_sys_user_cfgPO);
		aos_sys_user_cfgMapper.updateByKey(aos_sys_user_cfgPO);

		outDto.setAppCode(AOSCons.SUCCESS);
		outDto.setAppMsg("操作完成，用户修改成功。");
		return outDto;
	}

	/**
	 * 删除用户
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deleteUser(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		int cancel = 0, del = 0;
		for (String id_ : selections) {
			Aos_sys_userPO aos_sys_userPO = aos_sys_userMapper.selectByKey(id_);
			if (aos_sys_userPO.getType_().equals(DicCons.USER_TYPE_SUPER)) {
				cancel++;
				continue;
			}
			//判断对象删除规则(物理删除，逻辑删除)			
			String user_obj_del_mode_ = WebCxt.getCfgOfDB("user_obj_del_mode_", AOSCons.OBJECT_DELETE_RULE.UPDATE);
			// 清除和用户相关的资源
			resetWhenDeleteUser(id_,user_obj_del_mode_);
			if (StringUtils.equalsIgnoreCase(user_obj_del_mode_, AOSCons.OBJECT_DELETE_RULE.DELETE)) {
				aos_sys_userMapper.deleteByKey(id_);
			}else {
				aos_sys_userPO.setDelete_flag_(DicCons.DELETE_FLAG.YES);
				aos_sys_userMapper.updateByKey(aos_sys_userPO);
			}
			del++;
		}
		String msg = "操作完成, ";
		if (del > 0) {
			msg = AOSUtils.merge(msg + "成功删除用户数[{0}]个。", del);
		}
		if (cancel > 0) {
			msg = AOSUtils.merge(msg + "取消系统内置用户删除操作[{0}]个。(提示：内置用户不能删除)", cancel);
		}
		outDto.setAppMsg(msg);
		return outDto;
	}

	/**
	 * 清除和用户相关的资源
	 * 
	 * @param user_id_
	 */
	@Transactional
	private void resetWhenDeleteUser(String user_id_, String user_obj_del_mode_) {
		// 删除用户-角色关联表
		sqlDao.delete("Auth.deleteAos_sys_user_roleByUser_id_", Dtos.newDto("user_id_", user_id_));
		// 删除用户-岗位关联表
		sqlDao.delete("Auth.deleteAos_sys_user_postByUser_id_", user_id_);
		// 删除用户-菜单关联表
		sqlDao.delete("Auth.deleteAos_sys_module_userByUser_id_", user_id_);
		// 删除用户-Mac菜单关联表
		sqlDao.delete("Auth.deleteAos_sys_module_user_macstyleByUser_id_", user_id_);
		// 删除用户-页面元素关联表
		sqlDao.delete("Auth.deleteAos_sys_element_grantByUser_id_", user_id_);
		if (StringUtils.equalsIgnoreCase(user_obj_del_mode_, AOSCons.OBJECT_DELETE_RULE.DELETE)) {
			// 删除用户配置表
			aos_sys_user_cfgMapper.deleteByKey(user_id_);
			// 删除用户扩展表
			aos_sys_user_extMapper.deleteByKey(user_id_);			
		}
	}

	/**
	 * 修改用户密码(管理员重置)
	 * 
	 * @param inDto
	 */
	@Transactional
	public void updatePwd(Dto inDto) {
		String[] selections = inDto.getRows();
		String password = encryptPwd(inDto.getString("password_"));
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		for (String user_id_ : selections) {
			aos_sys_userPO.setId_(user_id_);
			aos_sys_userPO.setPassword_(password);
			aos_sys_userMapper.updateByKey(aos_sys_userPO);
		}
	}

	/**
	 * 修改用户密码(自己修改)
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updateMyPwd(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_sys_userPO userPO = aos_sys_userMapper.selectByKey(inDto.getString("id_"));
		if (!StringUtils.equals(userPO.getPassword_(), encryptPwd(inDto.getString("password_")))) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("操作取消，当前密码输入错误。请重新输入。");
			return outDto;
		}
		if (!StringUtils.equals(inDto.getString("new_password_"), inDto.getString("confirm_new_password_"))) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("操作取消，新密码和确认密码不一致。请重新输入。");
			return outDto;
		}
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		aos_sys_userPO.setId_(inDto.getString("id_"));
		aos_sys_userPO.setPassword_(encryptPwd(inDto.getString("new_password_")));
		aos_sys_userMapper.updateByKey(aos_sys_userPO);
		outDto.setAppMsg("操作完成，密码修改成功。");
		return outDto;
	}

	/**
	 * 更新用户状态
	 * 
	 * @param qDto
	 */
	@Transactional
	public void updateStatus(Dto qDto) {
		String[] selections = qDto.getRows();
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		aos_sys_userPO.setStatus_(qDto.getString("status_"));
		for (String aos_sys_usera0 : selections) {
			aos_sys_userPO.setId_(aos_sys_usera0);
			aos_sys_userMapper.updateByKey(aos_sys_userPO);
		}
	}

	/**
	 * 批量更新用户所属部门
	 * 
	 * @param qDto
	 */
	@Transactional
	public void updateUserOrg(Dto qDto) {
		String[] selections = qDto.getRows();
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		aos_sys_userPO.setOrg_id_(qDto.getString("org_id_"));
		for (String id_ : selections) {
			aos_sys_userPO.setId_(id_);
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_userPO.getOrg_id_());
			aos_sys_userPO.setOrg_cascade_id_(aos_sys_orgPO.getCascade_id_());
			aos_sys_userMapper.updateByKey(aos_sys_userPO);
			// 删除用户-岗位关联表
			sqlDao.delete("Auth.deleteAos_sys_user_postByUser_id_", id_);
		}
	}

	/**
	 * 查询组织下辖用户列表
	 * 
	 * @param qDto
	 * @return
	 */
	public List<Dto> getUsersInOrg(Dto qDto) {
		qDto.setOrder("id_ DESC");
		if (qDto.getString("cascade").equals("true")) {
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(qDto.getString("org_id_"));
			if (AOSUtils.isNotEmpty(aos_sys_orgPO)) {
				qDto.put("org_cascade_id_", aos_sys_orgPO.getCascade_id_());
			} else {
				qDto.put("org_cascade_id_", "0");
			}
		}
		List<Dto> userInfos = sqlDao.list("Auth.listUserInfosPage", qDto);
		return userInfos;
	}

	/**
	 * 保存用户-功能模块授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveUserModuleGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		Dto delDto = Dtos.newDto();
		delDto.put("user_id_", pDto.getString("user_id_"));
		delDto.put("grant_type_", pDto.getString("grant_type_"));
		// 每次授权都将历史数据清零
		sqlDao.delete("Auth.deleteAos_sys_module_userByDto", delDto);
		String[] selections = pDto.getRows();
		Aos_sys_module_userPO aos_sys_module_userPO = new Aos_sys_module_userPO();
		for (String module_id_ : selections) {
			aos_sys_module_userPO.setId_(AOSId.uuid());
			aos_sys_module_userPO.setModule_id_(module_id_);
			aos_sys_module_userPO.setUser_id_(pDto.getString("user_id_"));
			aos_sys_module_userPO.setGrant_type_(pDto.getString("grant_type_"));
			aos_sys_module_userPO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_module_userPO.setOperator_id_(userInfoVO.getId_());
			aos_sys_module_userMapper.insert(aos_sys_module_userPO);
		}
	}

	/**
	 * 获取菜单树(一次加载全部节点) 授权选择 (一次性渲染全部节点出来才能完美复选)
	 * 
	 * @param inDto
	 * @return
	 */
	public String getModuleTree4Select(Dto inDto) {
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Aos_sys_modulePO> aos_sys_modulePOs = Lists.newArrayList();
		// 超级用户获取所有菜单
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			inDto.setOrder("sort_no_ ASC");
			inDto.put("status_", DicCons.ENABLED_YES);
			aos_sys_modulePOs = aos_sys_moduleMapper.list(inDto);
		} else {
			// 权限用户 根据管理权限获取可再授权菜单
			Dto grantDto = Dtos.newDto();
			grantDto.putAll(inDto);
			grantDto.put("user_id_", userInfoVO.getId_()); // 当前登录用户
			aos_sys_modulePOs = systemService.getAdminModulesOfUser(grantDto);
		}
		return toTreeModal(aos_sys_modulePOs, inDto);
	}

	/**
	 * 转换为树模型
	 * 
	 * @param inDto
	 * @return
	 */
	private String toTreeModal(List<Aos_sys_modulePO> aos_sys_modulePOs, Dto inDto) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		Dto aos_sys_module_userDto = Dtos.newDto();
		aos_sys_module_userDto.put("user_id_", inDto.getString("user_id_")); // 界面选中的用户
		aos_sys_module_userDto.put("grant_type_", inDto.getString("grant_type_"));
		List<Aos_sys_module_userPO> aos_sys_module_userPOs = aos_sys_module_userMapper.list(aos_sys_module_userDto);
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			boolean checked = false;
			// 可以改成AOSList的写法
			for (Aos_sys_module_userPO aos_sys_module_userPO : aos_sys_module_userPOs) {
				if (aos_sys_module_userPO.getModule_id_().equals(aos_sys_modulePO.getId_())) {
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
		List<Aos_sys_modulePO> aos_sys_modulePOs = sqlDao.list("Auth.listUserModuleSelected", inDto);
		List<TreeNode> treeNodes = moduleService.toTreeModal(aos_sys_modulePOs);
		String jsonString = TreeBuilder.build(treeNodes);
		outDto.setStringA(jsonString);
		return outDto;
	}

	/**
	 * 保存用户-岗位授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveUserPostGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		String[] selections = pDto.getRows();
		Aos_sys_user_postPO aos_sys_user_postPO = new Aos_sys_user_postPO();
		for (String post_id_ : selections) {
			aos_sys_user_postPO.setId_(AOSId.uuid());
			aos_sys_user_postPO.setPost_id_(post_id_);
			aos_sys_user_postPO.setUser_id_(pDto.getString("user_id_"));
			aos_sys_user_postPO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_user_postPO.setOperator_id_(userInfoVO.getId_());
			aos_sys_user_postMapper.insert(aos_sys_user_postPO);
		}
	}

	/**
	 * 取消用户岗位授权
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto delUserPostGrantInfo(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		for (String user_post_id_ : selections) {
			aos_sys_user_postMapper.deleteByKey(user_post_id_);
		}
		outDto.setIntegerA(selections.length);
		return outDto;
	}

	/**
	 * 保存用户-角色授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveUserRoleGrantInfo(Dto pDto) {
		UserInfoVO userInfoVO = pDto.getUserInfo();
		Aos_sys_user_rolePO aos_sys_user_rolePO = new Aos_sys_user_rolePO();
		String[] selections = pDto.getRows();
		for (String role_id_ : selections) {
			aos_sys_user_rolePO.setId_(AOSId.uuid());
			aos_sys_user_rolePO.setRole_id_(role_id_);
			aos_sys_user_rolePO.setUser_id_(pDto.getString("user_id_"));
			aos_sys_user_rolePO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_user_rolePO.setOperator_id_(userInfoVO.getId_());
			aos_sys_user_roleMapper.insert(aos_sys_user_rolePO);
		}
	}

	/**
	 * 取消用户岗位授权
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto delUserRoleGrantInfo(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		for (String user_role_id_ : selections) {
			aos_sys_user_roleMapper.deleteByKey(user_role_id_);
		}
		outDto.setIntegerA(selections.length);
		return outDto;
	}

	/**
	 * 加密登录密码
	 * 
	 * @param pwdString
	 * @return
	 */
	public String encryptPwd(String pwdString) {
		String key = WebCxt.getCfgOfXML("codekey");
		String password = AOSCodec.encrypt(pwdString, key);
		return password;
	}

	/**
	 * 查询用户岗位授权待选岗位
	 * 
	 * @param qDto
	 * @return
	 */
	public List<Dto> getPostsInOrg4Grant(Dto qDto) {
		List<Dto> list = postService.getPostsInOrg(qDto);
		List<Dto> postList = Lists.newArrayList();
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("user_id_", qDto.getString("user_id_"));
		for (Dto postDto : list) {
			calcDto.put("post_id_", postDto.getString("id_"));
			Integer countInteger = Integer.valueOf(aos_sys_user_postMapper.calc(calcDto));
			if (countInteger == 0) {
				postList.add(postDto);
			}
		}
		return postList;
	}

	/**
	 * 查询用户已授权岗位集合
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listGrantedPostsOfUser(Dto inDto) {
		List<Dto> grantedList = sqlDao.list("Auth.listGrantedPostsOfUser", inDto);
		return grantedList;
	}

	/**
	 * 查询可授权角色集合
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listRoles4Grant(Dto inDto) {
		inDto.put("user_id_", inDto.getString("user_id_"));
		String role_grant_mode = WebCxt.getCfgOfDB("role_grant_mode_");
		if (StringUtils.equals(AOSCons.ROLE_GRANT_MODE_NOCASCADE, role_grant_mode)) {
			inDto.put("creater_org_id_", inDto.getUserInfo().getOrg_id_());
		} else if (StringUtils.equals(AOSCons.ROLE_GRANT_MODE_CASCADE, role_grant_mode)) {
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(inDto.getUserInfo().getOrg_id_());
			inDto.put("creater_org_cascade_id_", aos_sys_orgPO.getCascade_id_());
		} else {
			inDto.put("creater_org_id_", inDto.getUserInfo().getOrg_id_());
		}
		List<Dto> roleInfos = sqlDao.list("Auth.listRoleInfos4UserGrant", inDto);
		return roleInfos;
	}

	/**
	 * 查询已授权角色集合
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listGrantedRolesOfUser(Dto inDto) {
		List<Dto> grantedList = sqlDao.list("Auth.listGrantedRolesOfUser", inDto);
		return grantedList;
	}

	/**
	 * 权限预览(用户菜单经办权限)。经过权限计算后的总权限。
	 */
	public String getBizModulesOfUser(Dto inDto) {
		List<Aos_sys_modulePO> aos_sys_modulePOs = systemService.getBizModulesOfUser(inDto);
		return TreeBuilder.build(SystemUtils.toTreeModal(aos_sys_modulePOs));
	}

	/**
	 * 权限预览(用户菜单管理权限)。经过权限计算后的总权限。
	 */
	public String getAdminModulesOfUser(Dto inDto) {
		List<Aos_sys_modulePO> aos_sys_modulePOs = systemService.getAdminModulesOfUser(inDto);
		return TreeBuilder.build(SystemUtils.toTreeModal(aos_sys_modulePOs));
	}

	/**
	 * 权限预览(用户菜单管理权限)。经过权限计算后的总权限。
	 */
	public List<ElementVO> getElementsOfUser(Dto inDto) {
		List<ElementVO> elementVOs = systemService.getElementsOfUser(inDto);
		for (ElementVO elementVO : elementVOs) {
			if (StringUtils.equals(elementVO.getModule_id_(), elementVO.getPage_id_())) {
				elementVO.setPage_name_(elementVO.getModule_name_() + "-主页面");
			}else {
				Aos_sys_pagePO aos_sys_pagePO = aos_sys_pageMapper.selectByKey(elementVO.getPage_id_());
				elementVO.setPage_name_(aos_sys_pagePO.getName_());
			}
		}
		return elementVOs;
	}

}
