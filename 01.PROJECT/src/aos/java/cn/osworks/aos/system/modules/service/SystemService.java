package cn.osworks.aos.system.modules.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSListUtils;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.dao.asset.DBDialectUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.asset.MasterDetailModel;
import cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_catalogPO;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_pagePO;
import cn.osworks.aos.system.modules.dao.vo.ElementVO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.service.ResourceCacheService;

import com.google.common.collect.Lists;

/**
 * <b>系统公用服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-07-06
 */
@Service
public class SystemService {

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_catalogMapper aos_sys_catalogMapper;
	@Autowired
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private ResourceCacheService resourceCacheService;

	/**
	 * 获取用户的所有模块权限(用户+岗位+角色)
	 * 
	 * 提示：如果数据结构中出现某个节点是树枝节点，但在结果集中又没返回他的子节点。则会导致前端UI不断查询的问题。
	 * 
	 * @return
	 */
	public List<Aos_sys_modulePO> getBizModulesOfUser(Dto inDto) {
		inDto.put("grant_type_", DicCons.GRANT_TYPE_BIZ);
		List<Aos_sys_modulePO> listAos_sys_modulePO = getModulesByUser(inDto);
		listAos_sys_modulePO.addAll(getModulesByPost(inDto));
		listAos_sys_modulePO.addAll(getModulesByRole(inDto));
		// 去除重复值记录
		List<Aos_sys_modulePO> outList = AOSListUtils.distinct(listAos_sys_modulePO, Aos_sys_modulePO.class);
		String jqlText = "SELECT * FROM :AOSList ORDER BY sort_no_ ASC";
		outList = AOSListUtils.select(outList, Aos_sys_modulePO.class, jqlText, null);
		return outList;
	}

	/**
	 * 超级用户和普通用户：获取用户的所有模块权限(用户+岗位+角色)
	 * 
	 * @return
	 */
	public List<Aos_sys_modulePO> getBizModulesOfUserOrRoot(Dto inDto) {
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Aos_sys_modulePO> aos_sys_modulePOs = Lists.newArrayList();
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			// 超级用户不做任何限制
			inDto.put("cascade_id_", "0");
			aos_sys_modulePOs = sqlDao.list("Auth.getModuleTreeBasedRoot", inDto);
		} else {
			aos_sys_modulePOs = getBizModulesOfUser(inDto);
		}
		return aos_sys_modulePOs;
	}

	/**
	 * 获取用户的所有模块管理权限(用户+角色)
	 * 
	 * 提示：如果数据结构中出现某个节点是树枝节点，但在结果集中又没返回他的子节点。则会导致前端UI不断查询的问题。
	 * 
	 * @return
	 */
	public List<Aos_sys_modulePO> getAdminModulesOfUser(Dto inDto) {
		inDto.put("grant_type_", DicCons.GRANT_TYPE_ADMIN);
		List<Aos_sys_modulePO> listAos_sys_modulePO = getModulesByUser(inDto);
		listAos_sys_modulePO.addAll(getModulesByRole(inDto));
		// 去除重复值记录
		List<Aos_sys_modulePO> outList = AOSListUtils.distinct(listAos_sys_modulePO, Aos_sys_modulePO.class);
		String jqlText = "SELECT * FROM :AOSList ORDER BY sort_no_ ASC";
		outList = AOSListUtils.select(outList, Aos_sys_modulePO.class, jqlText, null);
		return outList;
	}

	/**
	 * 根据用户获取用户-菜单之间关联模块
	 * 
	 * @return
	 */
	public List<Aos_sys_modulePO> getModulesByUser(Dto inDto) {
		inDto.put("fnLength", DBDialectUtils.fnLength(sqlDao.getDatabaseId()));
		List<Aos_sys_modulePO> modulesList = sqlDao.list("Auth.getModulesByUser", inDto);
		return modulesList;
	}

	/**
	 * 根据用户查询通过岗位得到的授权集合
	 * 
	 * @return
	 */
	public List<Aos_sys_modulePO> getModulesByPost(Dto inDto) {
		inDto.put("fnLength", DBDialectUtils.fnLength(sqlDao.getDatabaseId()));
		List<Aos_sys_modulePO> modulesList = sqlDao.list("Auth.getModulesByPost", inDto);
		return modulesList;
	}

	/**
	 * 根据用户查询通过角色得到的授权集合
	 * 
	 * @return
	 */
	public List<Aos_sys_modulePO> getModulesByRole(Dto inDto) {
		inDto.put("fnLength", DBDialectUtils.fnLength(sqlDao.getDatabaseId()));
		List<Aos_sys_modulePO> modulesList = sqlDao.list("Auth.getModulesByRole", inDto);
		return modulesList;
	}

	/**
	 * 查询用户关联岗位的页面元素授权信息
	 * 
	 * @return
	 */
	public List<ElementVO> getElementsByPost(Dto inDto) {
		return resourceCacheService.getElementsByPost(inDto);
	}

	/**
	 * 查询用户关联角色的页面元素授权信息
	 * 
	 * @return
	 */
	public List<ElementVO> getElementsByRole(Dto inDto) {
		return resourceCacheService.getElementsByRole(inDto);
	}

	/**
	 * 查询用户直接自己的页面元素授权信息
	 * 
	 * @return
	 */
	public List<ElementVO> getElementsByUser(Dto inDto) {
		return resourceCacheService.getElementsByUser(inDto);
	}

	/**
	 * 查询用户所有的页面元素授权信息(用户+角色+岗位)
	 * 
	 * 注：标签权限授权也是调用此方法
	 * 
	 * @return
	 */
	public List<ElementVO> getElementsOfUser(Dto inDto) {
		List<ElementVO> cmpList = getElementsByPost(inDto);
		cmpList.addAll(getElementsByRole(inDto));
		cmpList.addAll(getElementsByUser(inDto));
		cmpList = AOSListUtils.distinct(cmpList, ElementVO.class);
		return cmpList;
	}

	/**
	 * 获取分类树节点集合
	 * 
	 * @param qDto
	 */
	public List<Dto> listCatalogs(Dto qDto) {
		qDto.setOrder("sort_no_");
		List<Aos_sys_catalogPO> list = aos_sys_catalogMapper.list(qDto);
		List<Dto> treeNodes = new ArrayList<Dto>();
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlOptionsHandler.getValue("icon_path");
		for (Aos_sys_catalogPO aos_sys_catalogPO : list) {
			Dto treeNode = Dtos.newDto();
			AOSUtils.copyProperties(aos_sys_catalogPO, treeNode);
			treeNode.put("id", aos_sys_catalogPO.getId_());
			treeNode.put("text", aos_sys_catalogPO.getName_());
			String icon_name_ = aos_sys_catalogPO.getIcon_name_();
			if (AOSUtils.isNotEmpty(icon_name_)) {
				treeNode.put("icon", iconPath + icon_name_);
			}
			String is_leaf_ = aos_sys_catalogPO.getIs_leaf_();
			if (AOSCons.YES.equals(is_leaf_)) {
				treeNode.put("leaf", true);
			} else {
				treeNode.put("leaf", false);
			}
			String is_auto_expand_ = aos_sys_catalogPO.getIs_auto_expand_();
			if (AOSCons.YES.equals(is_auto_expand_)) {
				treeNode.put("expanded", true);
			} else {
				treeNode.put("expanded", false);
			}
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

	/**
	 * 过滤用户自定义菜单(快捷菜单和浮动菜单)
	 * 
	 * @param inDto
	 * @param quickAos_sys_modulePOs
	 * @return
	 */
	public List<Aos_sys_modulePO> filterQuickModules1(Dto inDto, List<Aos_sys_modulePO> quickAos_sys_modulePOs) {
		List<Aos_sys_modulePO> outList = Lists.newArrayList();
		List<Aos_sys_modulePO> curAos_sys_modulePOs = getBizModulesOfUserOrRoot(inDto);
		String jql = "SELECT * FROM :AOSList WHERE id_ = :id_";
		Dto checkDto = Dtos.newDto();
		for (Aos_sys_modulePO aos_sys_modulePO : quickAos_sys_modulePOs) {
			checkDto.put("id_", aos_sys_modulePO.getId_());
			List<Aos_sys_modulePO> tempList = AOSListUtils.select(curAos_sys_modulePOs, Aos_sys_modulePO.class, jql,
					checkDto);
			if (AOSUtils.isNotEmpty(tempList)) {
				outList.addAll(tempList);
			}
		}
		return outList;
	}

	/**
	 * 清除快捷菜单和浮动菜单的垃圾数据
	 * 
	 * 
	 * <p>
	 * 1)、用户自定义菜单后，自定义菜单的权限被管理员收回则会产生垃圾数据。
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public void clearRubbishQuiclModules(Dto inDto) {
		UserInfoVO userInfoVO = inDto.getUserInfo();
		inDto.put("user_id_", userInfoVO.getId_());
		// 快捷菜单和浮动菜单集合，可能含有垃圾数据
		// 参数不含自定义菜单类型
		List<Aos_sys_modulePO> quickSys_modulePOs = sqlDao.list("Auth.listUserQuickModuleSelected", inDto);
		// 当前用户所有菜单节点
		List<Aos_sys_modulePO> curAos_sys_modulePOs = getBizModulesOfUserOrRoot(inDto);
		String jql = "SELECT * FROM :AOSList WHERE id_ = :id_";
		Dto checkDto = Dtos.newDto();
		Dto delDto = Dtos.newDto("user_id_", userInfoVO.getId_());
		// 这个for里只能清除叶子节点的垃圾数据。quick里的树枝节点可能也是当前节点中的本应存在的叶子节点的树枝节点。
		for (Aos_sys_modulePO aos_sys_modulePO : quickSys_modulePOs) {
			checkDto.put("id_", aos_sys_modulePO.getId_());
			List<Aos_sys_modulePO> tempList = AOSListUtils.select(curAos_sys_modulePOs, Aos_sys_modulePO.class, jql,
					checkDto);
			if (AOSUtils.isEmpty(tempList)) {
				// 删除垃圾数据
				delDto.put("module_id_", aos_sys_modulePO.getId_());
				sqlDao.delete("Auth.deleteAos_sys_module_user_navByDto2", delDto);
			}
		}
		// 再次清理树枝节点
		inDto.put("is_leaf_", AOSCons.NO);
		quickSys_modulePOs = sqlDao.list("Auth.listUserQuickModuleSelected", inDto);
		// 进行排序，先清理深度较深的树枝节点
		// Java再排序规避DB兼容性问题
		String jql2 = "SELECT * FROM :AOSList ORDER BY toNumber(id_) DESC";
		quickSys_modulePOs = AOSListUtils.select(quickSys_modulePOs, Aos_sys_modulePO.class, jql2, null);
		for (Aos_sys_modulePO aos_sys_modulePO : quickSys_modulePOs) {
			inDto.put("module_id_", aos_sys_modulePO.getId_());
			// 删除自定义菜单映射表里没有子孙节点的树枝节点
			int rows = (Integer) sqlDao.selectOne("Auth.rows_aos_sys_module", inDto);
			if (rows == 0) {
				delDto.put("module_id_", aos_sys_modulePO.getId_());
				sqlDao.delete("Auth.deleteAos_sys_module_user_navByDto2", delDto);
			}
		}
	}

	/**
	 * 获取组织树节点集合
	 * 
	 * @param qDto
	 */
	public List<Dto> getOrgTree(Dto qDto) {
		qDto.setOrder("sort_no_");
		List<Aos_sys_orgPO> list = aos_sys_orgMapper.list(qDto);
		List<Dto> treeNodes = new ArrayList<Dto>();
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlOptionsHandler.getValue("icon_path");
		for (Aos_sys_orgPO aos_sys_orgPO : list) {
			Dto treeNode = Dtos.newDto();
			treeNode.put("id", aos_sys_orgPO.getId_());
			String name_ = aos_sys_orgPO.getName_();
			treeNode.put("text", name_);
			treeNode.put("cascade_id_", aos_sys_orgPO.getCascade_id_());
			String icon_name_ = aos_sys_orgPO.getIcon_name_();
			if (AOSUtils.isNotEmpty(icon_name_)) {
				treeNode.put("icon", iconPath + icon_name_);
			}
			String is_leaf_ = aos_sys_orgPO.getIs_leaf_();
			if (AOSCons.YES.equals(is_leaf_)) {
				treeNode.put("leaf", true);
			} else {
				treeNode.put("leaf", false);
			}
			String is_auto_expand_ = aos_sys_orgPO.getIs_auto_expand_();
			if (AOSCons.YES.equals(is_auto_expand_)) {
				treeNode.put("expanded", true);
			} else {
				treeNode.put("expanded", false);
			}
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

	/**
	 * 获取功能模块树节点集合
	 * 
	 * @param qDto
	 */
	public List<Dto> listModuleTree(Dto qDto) {
		List<Aos_sys_modulePO> list = aos_sys_moduleMapper.list(qDto);
		List<Dto> treeNodes = new ArrayList<Dto>();
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlOptionsHandler.getValue("icon_path");
		for (Aos_sys_modulePO aos_sys_modulePO : list) {
			Dto treeNode = Dtos.newDto();
			treeNode.put("id", aos_sys_modulePO.getId_());
			treeNode.put("text", aos_sys_modulePO.getName_());
			treeNode.put("cascade_id_", aos_sys_modulePO.getCascade_id_());
			String icon_ = aos_sys_modulePO.getIcon_name_();
			if (AOSUtils.isNotEmpty(icon_)) {
				treeNode.put("icon", iconPath + icon_);
			}
			String is_leaf_ = aos_sys_modulePO.getIs_leaf_();
			if (AOSCons.YES.equals(is_leaf_)) {
				treeNode.put("leaf", true);
			} else {
				treeNode.put("leaf", false);
			}
			String is_auto_expand_ = aos_sys_modulePO.getIs_auto_expand_();
			if (AOSCons.YES.equals(is_auto_expand_)) {
				treeNode.put("expanded", true);
			} else {
				treeNode.put("expanded", false);
			}
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

	/**
	 * 根据模块编号获取模块的子页面导航菜单
	 * 
	 * @param inDto
	 * @return
	 */
	public MasterDetailModel getMasterDetailPageModel(Dto inDto) {
		MasterDetailModel masterDetailPageModel = new MasterDetailModel();
		inDto.put("module_id_", inDto.getString(AOSCons.MODULE_ID_KEY));
		List<Aos_sys_pagePO> aos_sys_pagePOs = sqlDao.list("Resource.getSubNavMenuByModuleID", inDto);
		masterDetailPageModel.setSubPages(aos_sys_pagePOs);
		for (Aos_sys_pagePO aos_sys_pagePO : aos_sys_pagePOs) {
			if (StringUtils.equals(aos_sys_pagePO.getIs_default_(), AOSCons.YES)) {
				masterDetailPageModel.setDefaultPage(aos_sys_pagePO);
			}
		}
		return masterDetailPageModel;
	}

}
