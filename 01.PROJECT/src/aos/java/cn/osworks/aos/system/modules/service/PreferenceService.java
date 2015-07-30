package cn.osworks.aos.system.modules.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.asset.IdCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_user_navMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_cfgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_extMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_bytearrayMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_user_navPO;
import cn.osworks.aos.system.dao.po.Aos_sys_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_extPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.auth.UserService;
import cn.osworks.aos.system.modules.service.resource.ModuleService;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * <b>首选项服务</b>
 * 
 * @author OSWorks-XC
 * @date 2015-02-06
 */
@Service
public class PreferenceService {

	@Autowired
	private Aos_sys_userMapper aos_sys_userMapper;
	@Autowired
	private Aos_sys_user_extMapper aos_sys_user_extMapper;
	@Autowired
	private Aos_sys_user_cfgMapper aos_sys_user_cfgMapper;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private Aos_sys_module_user_navMapper aos_sys_module_user_navMapper;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private SqlDao sysDao;
	@Autowired
	private UserService userService;
	@Autowired
	private Aos_sys_bytearrayMapper aos_sys_bytearrayMapper;
	
	/**
	 * 获取首选项使用的用户基本信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto getUserInfo(Dto inDto){
		Dto outDto = userService.getUser(inDto);
		boolean has_head_photo = false;
		String bytearray_id_ = outDto.getString("bytearray_id_");
		if (AOSUtils.isNotEmpty(bytearray_id_)) {
			if (AOSUtils.isNotEmpty(aos_sys_bytearrayMapper.selectByKey(bytearray_id_))) {
				has_head_photo = true;
			}
		}
		outDto.put("has_head_photo", has_head_photo);
		return outDto;
	}

	/**
	 * 修改个人资料信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto updateMyInfo(Dto inDto) {
		Dto outDto = Dtos.newDto();
		Aos_sys_userPO aos_sys_userPO = new Aos_sys_userPO();
		AOSUtils.apply(inDto, aos_sys_userPO);
		// 更新用户基本信息
		aos_sys_userMapper.updateByKey(aos_sys_userPO);
		// 更新用户扩展信息
		Aos_sys_user_extPO aos_sys_user_extPO = new Aos_sys_user_extPO();
		AOSUtils.apply(inDto, aos_sys_user_extPO);
		aos_sys_user_extMapper.updateByKey(aos_sys_user_extPO);
		outDto.setAppMsg("操作完成，我的个人资料信息保存成功。");
		return outDto;
	}

	/**
	 * 修改个人偏好设置
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto updateMySettings(Dto inDto) {
		Dto outDto = Dtos.newDto();
		// 更新用户配置信息
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = new Aos_sys_user_cfgPO();
		AOSUtils.apply(inDto, aos_sys_user_cfgPO);
		aos_sys_user_cfgMapper.updateByKey(aos_sys_user_cfgPO);
		outDto.setAppMsg("操作完成，我的偏好设置数据保存成功。");
		return outDto;
	}
	
	/**
	 * 保存快捷菜单的排序号
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto saveQuickMenuSortNo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_sys_module_user_navPO aos_sys_module_user_navPO = new Aos_sys_module_user_navPO();
		AOSUtils.apply(inDto, aos_sys_module_user_navPO);
		aos_sys_module_user_navMapper.updateByKey(aos_sys_module_user_navPO);
		outDto.setAppMsg("操作完成，快捷菜单排序号保存成功。");
		return outDto;
	}
	
	/**
	 * 保存浮动菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto saveFloatModuleInfo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Dto qDto = Dtos.newDto();
		qDto.put("user_id_", inDto.getUserInfo().getId_());
		qDto.put("module_id_", inDto.getString("module_id_"));
		qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_FLOAT);
	    int rows = aos_sys_module_user_navMapper.rows(qDto);
	    if (rows > 0) {
	    	outDto.setAppCode(AOSCons.ERROR);
	    	outDto.setAppMsg("操作被取消。当前菜单已被绑定，请重新选择。");
	    	return outDto;
		}
		Aos_sys_module_user_navPO aos_sys_module_user_navPO = new Aos_sys_module_user_navPO();
		AOSUtils.apply(inDto, aos_sys_module_user_navPO);
		aos_sys_module_user_navPO.setId_(AOSId.id(IdCons.RID));
		aos_sys_module_user_navPO.setType_(DicCons.MODULE_USER_NAV_TYPE_FLOAT);
		aos_sys_module_user_navPO.setUser_id_(inDto.getUserInfo().getId_());
		aos_sys_module_user_navMapper.insert(aos_sys_module_user_navPO);
		outDto.setAppMsg("操作完成，浮动菜单保存成功。");
		return outDto;
	}
	
	/**
	 * 保存快捷菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto saveQuickModuleInfo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Dto delDto = Dtos.newDto();
		delDto.put("user_id_", inDto.getUserInfo().getId_());
		delDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_QUICK);
		List<Aos_sys_module_user_navPO> aos_sys_module_user_navPOs = aos_sys_module_user_navMapper.list(delDto);
		//清空当前用户快捷菜单信息
		sysDao.delete("Auth.deleteAos_sys_module_user_navByDto", delDto);
		String selecttions[] = inDto.getRows();
		for (String module_id_ : selecttions) {
			Aos_sys_module_user_navPO aos_sys_module_user_navPO = new Aos_sys_module_user_navPO();
			aos_sys_module_user_navPO.setModule_id_(module_id_);
			aos_sys_module_user_navPO.setId_(AOSId.id(IdCons.RID));
			aos_sys_module_user_navPO.setType_(DicCons.MODULE_USER_NAV_TYPE_QUICK);
			aos_sys_module_user_navPO.setUser_id_(inDto.getUserInfo().getId_());
			for (Aos_sys_module_user_navPO oldPO : aos_sys_module_user_navPOs) {
				if (StringUtils.equals(oldPO.getModule_id_(), aos_sys_module_user_navPO.getModule_id_())) {
					aos_sys_module_user_navPO.setSort_no_(oldPO.getSort_no_());
				}
			}
			aos_sys_module_user_navMapper.insert(aos_sys_module_user_navPO);
		}
		outDto.setAppMsg("操作完成，快捷菜单保存成功。");
		return outDto;
	}
	
	/**
	 * 修改浮动菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto updateFloatModuleInfo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_sys_module_user_navPO old_Aos_sys_module_user_navPO = aos_sys_module_user_navMapper.selectByKey(inDto.getString("id_"));
		if (!StringUtils.equals(old_Aos_sys_module_user_navPO.getModule_id_(), inDto.getString("module_id_"))) {
			Dto qDto = Dtos.newDto();
			qDto.put("user_id_", inDto.getUserInfo().getId_());
			qDto.put("module_id_", inDto.getString("module_id_"));
			qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_FLOAT);
		    int rows = aos_sys_module_user_navMapper.rows(qDto);
		    if (rows > 0) {
		    	outDto.setAppCode(AOSCons.ERROR);
		    	outDto.setAppMsg("操作被取消。当前菜单已被绑定，请重新选择。");
		    	return outDto;
			}
		}
		Aos_sys_module_user_navPO aos_sys_module_user_navPO = new Aos_sys_module_user_navPO();
		AOSUtils.apply(inDto, aos_sys_module_user_navPO);
		aos_sys_module_user_navMapper.updateByKey(aos_sys_module_user_navPO);
		outDto.setAppMsg("操作完成，浮动菜单修改成功。");
		return outDto;
	}
	
	/**
	 * 删除浮动菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto delFloatModules(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		String[] selections = inDto.getRows();
		for (String id_ : selections) {
			aos_sys_module_user_navMapper.deleteByKey(id_);
		}
		outDto.setAppMsg("操作完成，浮动菜单删除成功。");
		return outDto;
	}

	/**
	 * 获取当前用户菜单树 浮动菜单绑定
	 * 
	 * @param inDto
	 * @return
	 */
	public String getModuleTree4BindingFloatMenu(Dto inDto) {
		String outJsonString = "";
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Aos_sys_modulePO> aos_sys_modulePOs = Lists.newArrayList();
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			// 超级用户 获取所有菜单 懒惰加载
			inDto.put("status_", DicCons.ENABLED_YES);
			inDto.setOrder("sort_no_");
			aos_sys_modulePOs = aos_sys_moduleMapper.list(inDto);
			outJsonString = AOSJson.toJson(moduleService.toTreeDto(aos_sys_modulePOs));
		} else {
			// 普通用户 获取用户的所有模块权限(用户+岗位+角色)  一次加载
			inDto.put("user_id_", inDto.getUserInfo().getId_());
			aos_sys_modulePOs = systemService.getBizModulesOfUser(inDto);
			outJsonString = TreeBuilder.build(moduleService.toTreeModal(aos_sys_modulePOs));
		}
		return outJsonString;
	}
	
	/**
	 * 获取当前用户菜单树 已选快捷菜单
	 * 
	 * @param inDto
	 * @return
	 */
	public String getModuleTree4QuickMenu(Dto inDto) {
		inDto.put("user_id_", inDto.getUserInfo().getId_());
		inDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_QUICK);
		List<Aos_sys_modulePO> aos_sys_modulePOs = sysDao.list("Auth.listUserQuickModuleSelected", inDto);
		List<TreeNode> treeNodes = moduleService.toTreeModal(aos_sys_modulePOs);
		return TreeBuilder.build(treeNodes);
	}
	
	/**
	 * 获取当前用户菜单树 待选快捷菜单
	 * 
	 * @param inDto
	 * @return
	 */
	public String getModuleCheckTree4QuickMenu(Dto inDto) {
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Aos_sys_modulePO> aos_sys_modulePOs = Lists.newArrayList();
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			// 超级用户 获取所有菜单 
			inDto.put("status_", DicCons.ENABLED_YES);
			inDto.setOrder("sort_no_");
			aos_sys_modulePOs = aos_sys_moduleMapper.list(inDto);
		} else {
			// 普通用户 获取用户的所有模块权限(用户+岗位+角色)
			inDto.put("user_id_", inDto.getUserInfo().getId_());
			aos_sys_modulePOs = systemService.getBizModulesOfUser(inDto);
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
		Dto qDto = Dtos.newDto();
		qDto.put("user_id_", inDto.getUserInfo().getId_());
		qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_QUICK);
		List<Aos_sys_module_user_navPO> aos_sys_module_user_navPOs = aos_sys_module_user_navMapper.list(qDto);
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			boolean checked = false;
			// 可以改成AOSList的写法
			for (Aos_sys_module_user_navPO aos_sys_module_user_navPO : aos_sys_module_user_navPOs) {
				if (aos_sys_module_user_navPO.getModule_id_().equals(aos_sys_modulePO.getId_())) {
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

}
