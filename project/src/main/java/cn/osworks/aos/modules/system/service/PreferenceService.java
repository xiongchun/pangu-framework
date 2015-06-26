package cn.osworks.aos.modules.system.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_moduleMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_module_user_navMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_userMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_user_cfgMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_user_extMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_bytearrayMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_modulePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_module_user_navPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_userPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_user_cfgPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_user_extPO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.modules.system.service.auth.UserService;
import cn.osworks.aos.modules.system.service.resource.ModuleService;
import cn.osworks.aos.web.misc.DicCons;
import cn.osworks.aos.web.misc.IdCons;
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
	private Aos_au_userMapper aos_au_userMapper;
	@Autowired
	private Aos_au_user_extMapper aos_au_user_extMapper;
	@Autowired
	private Aos_au_user_cfgMapper aos_au_user_cfgMapper;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Aos_au_moduleMapper aos_au_moduleMapper;
	@Autowired
	private Aos_au_module_user_navMapper aos_au_module_user_navMapper;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private UserService userService;
	@Autowired
	private Aos_ge_bytearrayMapper aos_ge_bytearrayMapper;
	
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
			if (AOSUtils.isNotEmpty(aos_ge_bytearrayMapper.selectByKey(bytearray_id_))) {
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
	public Dto updateMyInfo(Dto inDto) {
		Dto outDto = Dtos.newDto();
		Aos_au_userPO aos_au_userPO = new Aos_au_userPO();
		AOSUtils.apply(inDto, aos_au_userPO);
		// 更新用户基本信息
		aos_au_userMapper.updateByKey(aos_au_userPO);
		// 更新用户扩展信息
		Aos_au_user_extPO aos_au_user_extPO = new Aos_au_user_extPO();
		AOSUtils.apply(inDto, aos_au_user_extPO);
		aos_au_user_extMapper.updateByKey(aos_au_user_extPO);
		outDto.setAppMsg("操作完成，我的个人资料信息保存成功。");
		return outDto;
	}

	/**
	 * 修改个人偏好设置
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto updateMySettings(Dto inDto) {
		Dto outDto = Dtos.newDto();
		// 更新用户配置信息
		Aos_au_user_cfgPO aos_au_user_cfgPO = new Aos_au_user_cfgPO();
		AOSUtils.apply(inDto, aos_au_user_cfgPO);
		aos_au_user_cfgMapper.updateByKey(aos_au_user_cfgPO);
		outDto.setAppMsg("操作完成，我的偏好设置数据保存成功。");
		return outDto;
	}
	
	/**
	 * 保存快捷菜单的排序号
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto saveQuickMenuSortNo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_au_module_user_navPO aos_au_module_user_navPO = new Aos_au_module_user_navPO();
		AOSUtils.apply(inDto, aos_au_module_user_navPO);
		aos_au_module_user_navMapper.updateByKey(aos_au_module_user_navPO);
		outDto.setAppMsg("操作完成，快捷菜单排序号保存成功。");
		return outDto;
	}
	
	/**
	 * 保存浮动菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto saveFloatModuleInfo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Dto qDto = Dtos.newDto();
		qDto.put("user_id_", inDto.getUserInfo().getId_());
		qDto.put("module_id_", inDto.getString("module_id_"));
		qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_FLOAT);
	    int rows = aos_au_module_user_navMapper.rows(qDto);
	    if (rows > 0) {
	    	outDto.setAppCode(AOSCons.ERROR);
	    	outDto.setAppMsg("操作被取消。当前菜单已被绑定，请重新选择。");
	    	return outDto;
		}
		Aos_au_module_user_navPO aos_au_module_user_navPO = new Aos_au_module_user_navPO();
		AOSUtils.apply(inDto, aos_au_module_user_navPO);
		aos_au_module_user_navPO.setId_(AOSId.id(IdCons.RID));
		aos_au_module_user_navPO.setType_(DicCons.MODULE_USER_NAV_TYPE_FLOAT);
		aos_au_module_user_navPO.setUser_id_(inDto.getUserInfo().getId_());
		aos_au_module_user_navMapper.insert(aos_au_module_user_navPO);
		outDto.setAppMsg("操作完成，浮动菜单保存成功。");
		return outDto;
	}
	
	/**
	 * 保存快捷菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto saveQuickModuleInfo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Dto delDto = Dtos.newDto();
		delDto.put("user_id_", inDto.getUserInfo().getId_());
		delDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_QUICK);
		List<Aos_au_module_user_navPO> aos_au_module_user_navPOs = aos_au_module_user_navMapper.list(delDto);
		//清空当前用户快捷菜单信息
		sqlDao.delete("Auth.deleteAos_au_module_user_navByDto", delDto);
		String selecttions[] = inDto.getSelection();
		for (String module_id_ : selecttions) {
			Aos_au_module_user_navPO aos_au_module_user_navPO = new Aos_au_module_user_navPO();
			aos_au_module_user_navPO.setModule_id_(module_id_);
			aos_au_module_user_navPO.setId_(AOSId.id(IdCons.RID));
			aos_au_module_user_navPO.setType_(DicCons.MODULE_USER_NAV_TYPE_QUICK);
			aos_au_module_user_navPO.setUser_id_(inDto.getUserInfo().getId_());
			for (Aos_au_module_user_navPO oldPO : aos_au_module_user_navPOs) {
				if (StringUtils.equals(oldPO.getModule_id_(), aos_au_module_user_navPO.getModule_id_())) {
					aos_au_module_user_navPO.setSort_no_(oldPO.getSort_no_());
				}
			}
			aos_au_module_user_navMapper.insert(aos_au_module_user_navPO);
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
	public Dto updateFloatModuleInfo(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_au_module_user_navPO old_Aos_au_module_user_navPO = aos_au_module_user_navMapper.selectByKey(inDto.getString("id_"));
		if (!StringUtils.equals(old_Aos_au_module_user_navPO.getModule_id_(), inDto.getString("module_id_"))) {
			Dto qDto = Dtos.newDto();
			qDto.put("user_id_", inDto.getUserInfo().getId_());
			qDto.put("module_id_", inDto.getString("module_id_"));
			qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_FLOAT);
		    int rows = aos_au_module_user_navMapper.rows(qDto);
		    if (rows > 0) {
		    	outDto.setAppCode(AOSCons.ERROR);
		    	outDto.setAppMsg("操作被取消。当前菜单已被绑定，请重新选择。");
		    	return outDto;
			}
		}
		Aos_au_module_user_navPO aos_au_module_user_navPO = new Aos_au_module_user_navPO();
		AOSUtils.apply(inDto, aos_au_module_user_navPO);
		aos_au_module_user_navMapper.updateByKey(aos_au_module_user_navPO);
		outDto.setAppMsg("操作完成，浮动菜单修改成功。");
		return outDto;
	}
	
	/**
	 * 删除浮动菜单信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delFloatModules(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		String[] selections = inDto.getSelection();
		for (String id_ : selections) {
			aos_au_module_user_navMapper.deleteByKey(id_);
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
		List<Aos_au_modulePO> aos_au_modulePOs = Lists.newArrayList();
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			// 超级用户 获取所有菜单 懒惰加载
			inDto.put("status_", DicCons.ENABLED_YES);
			inDto.setOrder("sort_no_");
			aos_au_modulePOs = aos_au_moduleMapper.list(inDto);
			outJsonString = AOSJson.toJson(moduleService.toTreeDto(aos_au_modulePOs));
		} else {
			// 普通用户 获取用户的所有模块权限(用户+岗位+角色)  一次加载
			inDto.put("user_id_", inDto.getUserInfo().getId_());
			aos_au_modulePOs = systemService.getBizModulesOfUser(inDto);
			outJsonString = TreeBuilder.build(moduleService.toTreeModal(aos_au_modulePOs));
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
		List<Aos_au_modulePO> aos_au_modulePOs = sqlDao.list("Auth.listUserQuickModuleSelected", inDto);
		List<TreeNode> treeNodes = moduleService.toTreeModal(aos_au_modulePOs);
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
		List<Aos_au_modulePO> aos_au_modulePOs = Lists.newArrayList();
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			// 超级用户 获取所有菜单 
			inDto.put("status_", DicCons.ENABLED_YES);
			inDto.setOrder("sort_no_");
			aos_au_modulePOs = aos_au_moduleMapper.list(inDto);
		} else {
			// 普通用户 获取用户的所有模块权限(用户+岗位+角色)
			inDto.put("user_id_", inDto.getUserInfo().getId_());
			aos_au_modulePOs = systemService.getBizModulesOfUser(inDto);
		}
		return toTreeModal(aos_au_modulePOs, inDto);
	}
	
	/**
	 * 转换为树模型
	 * 
	 * @param inDto
	 * @return
	 */
	private String toTreeModal(List<Aos_au_modulePO> aos_au_modulePOs, Dto inDto) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		Dto qDto = Dtos.newDto();
		qDto.put("user_id_", inDto.getUserInfo().getId_());
		qDto.put("type_", DicCons.MODULE_USER_NAV_TYPE_QUICK);
		List<Aos_au_module_user_navPO> aos_au_module_user_navPOs = aos_au_module_user_navMapper.list(qDto);
		for (Aos_au_modulePO aos_au_modulePO : aos_au_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_au_modulePO.getId_());
			treeNode.setText(aos_au_modulePO.getName_());
			treeNode.setParentId(aos_au_modulePO.getParent_id_());
			treeNode.setIcon(aos_au_modulePO.getIcon_name_());
			boolean checked = false;
			// 可以改成AOSList的写法
			for (Aos_au_module_user_navPO aos_au_module_user_navPO : aos_au_module_user_navPOs) {
				if (aos_au_module_user_navPO.getModule_id_().equals(aos_au_modulePO.getId_())) {
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

}
