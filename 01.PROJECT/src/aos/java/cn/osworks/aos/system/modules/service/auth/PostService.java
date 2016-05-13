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
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_postMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_postPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 岗位与授权
 * 
 * @author OSWorks-XC
 * @date 2014-08-16
 */
@Service
public class PostService {
	
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private Aos_sys_postMapper aos_sys_postMapper;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private Aos_sys_module_postMapper aos_sys_module_postMapper;
	@Autowired
	private Aos_sys_user_postMapper aos_sys_user_postMapper;
	@Autowired
	private SystemService systemService;
	@Autowired 
	private UserService userService;
	
	/**
	 * 保存岗位信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public void savePost(Dto inDto) {
		Aos_sys_postPO aos_sys_postPO = new Aos_sys_postPO();
		AOSUtils.copyProperties(inDto, aos_sys_postPO);
		aos_sys_postPO.setId_(AOSId.uuid());
		UserInfoVO userInfoVO = inDto.getUserInfo();
		aos_sys_postPO.setCreater_id_(userInfoVO.getId_());
		aos_sys_postPO.setCreate_time_(AOSUtils.getDateTimeStr());
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_postPO.getOrg_id_());
		aos_sys_postPO.setOrg_cascade_id_(aos_sys_orgPO.getCascade_id_());
		aos_sys_postMapper.insert(aos_sys_postPO);
	}
	
	/**
	 * 修改岗位信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public void updatePost(Dto inDto) {
		Aos_sys_postPO aos_sys_postPO = new Aos_sys_postPO();
		AOSUtils.copyProperties(inDto, aos_sys_postPO);
		//修改了所属部门
		if (!inDto.getString("org_id_").equals(inDto.getString("old_org_id_"))) {
			//修改部门名称
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_postPO.getOrg_id_());
			aos_sys_postPO.setOrg_cascade_id_(aos_sys_orgPO.getCascade_id_());
	    	//删除岗位-用户关联表
	    	sqlDao.delete("Auth.deleteAos_sys_user_postByPost_id_", Dtos.newDto("post_id_", aos_sys_postPO.getId_()));
		}
		aos_sys_postMapper.updateByKey(aos_sys_postPO);
	}
	
	/**
	 * 删除岗位
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deletePost(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		int del = 0;
		for (String id_ : selections) {
			aos_sys_postMapper.deleteByKey(id_);
	    	//删除岗位-用户关联表
	    	sqlDao.delete("Auth.deleteAos_sys_user_postByPost_id_", Dtos.newDto("post_id_", id_));
	    	//删除岗位-菜单关联表
	    	sqlDao.delete("Auth.deleteAos_sys_module_postByPost_id_", Dtos.newDto("post_id_", id_));
	    	//删除岗位-页面元素关联表
	    	sqlDao.delete("Auth.deleteAos_sys_element_grantByPost_id_", id_);
	    	del++;
		}
		String msg = "操作完成, ";
		if (del > 0) {
			msg = AOSUtils.merge(msg + "成功删除岗位数[{0}]个。", del);
		}
		outDto.setAppMsg(msg);
		return outDto;
	}
		
	/**
	 * 更新岗位状态
	 * 
	 * @param qDto
	 */
	@Transactional
	public void updateStatus(Dto qDto) {
		String[] selections = qDto.getRows();
		Aos_sys_postPO aos_sys_postPO = new Aos_sys_postPO();
		aos_sys_postPO.setStatus_(qDto.getString("status_"));
		for (String id_ : selections) {
			aos_sys_postPO.setId_(id_);
			aos_sys_postMapper.updateByKey(aos_sys_postPO);
		}
	}
	
	/**
	 * 批量更新岗位所属部门
	 * 
	 * @param qDto
	 */
	@Transactional
	public void updatePostOrgBatch(Dto qDto) {
		String[] selections = qDto.getRows();
		Aos_sys_postPO aos_sys_postPO = new Aos_sys_postPO();
		aos_sys_postPO.setOrg_id_(qDto.getString("org_id_"));
		for (String id_ : selections) {
			aos_sys_postPO.setId_(id_);
			//修改部门信息
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(aos_sys_postPO.getOrg_id_());
			aos_sys_postPO.setOrg_cascade_id_(aos_sys_orgPO.getCascade_id_());
	    	//删除岗位-用户关联表
	    	sqlDao.delete("Auth.deleteAos_sys_user_postByPost_id_", Dtos.newDto("post_id_", id_));
			aos_sys_postMapper.updateByKey(aos_sys_postPO);
		}
	}
	
	/**
	 * 查询组织下辖岗位列表
	 * 
	 * @param qDto
	 * @return
	 */
	public List<Dto> getPostsInOrg(Dto qDto) {
		qDto.setOrder("id_ DESC");
		if (qDto.getString("cascade").equals("true")) {
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(qDto.getString("org_id_"));
			if(AOSUtils.isNotEmpty(aos_sys_orgPO)){
				qDto.put("org_cascade_id_", aos_sys_orgPO.getCascade_id_());
			}else {
				qDto.put("org_cascade_id_", "0");
			}
		}
		List<Dto> postInfos = sqlDao.list("Auth.listPostInfosPage", qDto);
		return postInfos;
	}
	
	/**
	 * 查询岗位已授权用户集合
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listGrantedUsersOfPost(Dto inDto){
		List<Dto> grantedList = sqlDao.list("Auth.listGrantedUsersOfPost", inDto);
		return grantedList;
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
		    //权限用户	根据管理权限获取再授权菜单
			inDto.put("user_id_", inDto.getUserInfo().getId_());
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
	private String toTreeModal(List<Aos_sys_modulePO> aos_sys_modulePOs, Dto inDto){
		List<TreeNode> treeNodes = Lists.newArrayList();
		Dto aos_sys_module_postDto = Dtos.newDto();
		aos_sys_module_postDto.put("post_id_", inDto.getString("post_id_"));
		aos_sys_module_postDto.put("grant_type_", DicCons.GRANT_TYPE_BIZ);
		List<Aos_sys_module_postPO> aos_sys_module_postPOs = aos_sys_module_postMapper.list(aos_sys_module_postDto);
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			boolean checked = false;
			for (Aos_sys_module_postPO aos_sys_module_postPO : aos_sys_module_postPOs) {
				if (aos_sys_module_postPO.getModule_id_().equals(aos_sys_modulePO.getId_())) {
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
	public Dto getModuleTree4Selected(Dto inDto){
		inDto.setOrder("sort_no_ ASC");
		Dto outDto = Dtos.newDto();
		List<Aos_sys_modulePO> aos_sys_modulePOs = sqlDao.list("Auth.listPostModuleSelected", inDto);
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
	 * 保存岗位-功能模块授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void savePostModuleGrantInfo(Dto pDto){
		String grant_type_ = DicCons.GRANT_TYPE_BIZ;   //岗位职能授予经办权限
		UserInfoVO userInfoVO = pDto.getUserInfo();
		Dto delDto = Dtos.newDto();
		delDto.put("post_id_", pDto.getString("post_id_"));
		delDto.put("grant_type_", grant_type_);
		//每次授权都将历史数据清零
		sqlDao.delete("Auth.deleteAos_sys_module_postByPost_id_", delDto);
		String[] selections = pDto.getRows();
		Aos_sys_module_postPO aos_sys_module_postPO = new Aos_sys_module_postPO();
		for (String id_ : selections) {
			aos_sys_module_postPO.setId_(AOSId.uuid());
			aos_sys_module_postPO.setModule_id_(id_);
			aos_sys_module_postPO.setPost_id_(pDto.getString("post_id_"));
			aos_sys_module_postPO.setGrant_type_(grant_type_);
			aos_sys_module_postPO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_module_postPO.setOperator_id_(userInfoVO.getId_());
			aos_sys_module_postMapper.insert(aos_sys_module_postPO);
		}
	}
	
	/**
	 * 保存岗位-用户授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void savePostUserGrantInfo(Dto pDto){
		UserInfoVO userInfoVO = pDto.getUserInfo();
		String[] selections = pDto.getRows();
		Aos_sys_user_postPO aos_sys_user_postPO = new Aos_sys_user_postPO();
		for (String user_id_ : selections) {
			aos_sys_user_postPO.setId_(AOSId.uuid());
			aos_sys_user_postPO.setPost_id_(pDto.getString("post_id_"));
			aos_sys_user_postPO.setUser_id_(user_id_);
			aos_sys_user_postPO.setOperate_time_(AOSUtils.getDateTimeStr());
			aos_sys_user_postPO.setOperator_id_(userInfoVO.getId_());
			aos_sys_user_postMapper.insert(aos_sys_user_postPO);
		}
	}
	
	/**
	 * 查询岗位用户授权待选用户
	 * @param qDto
	 * @return
	 */
	public List<Dto> getUsersInOrg4Grant(Dto qDto) {
		List<Dto> list = userService.getUsersInOrg(qDto);
		List<Dto> userList = Lists.newArrayList();
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("post_id_", qDto.getString("post_id_"));
		for (Dto userDto : list) {
			calcDto.put("user_id_", userDto.getString("id_"));
			Integer countInteger = Integer.valueOf(aos_sys_user_postMapper.calc(calcDto));
			if (countInteger == 0) {
				userList.add(userDto);
			}
		}
		return userList;
	}
	
	/**
	 * 取消岗位用户授权
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto delPostUserGrantInfo(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		for (String id_ : selections) {
			aos_sys_user_postMapper.deleteByKey(id_);
		}
		outDto.setIntegerA(selections.length);
		return outDto;
	}
	
}
