package cn.osworks.aos.system.modules.service.resource;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSListUtils;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_pageMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_page_elMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_page_el_grantMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_pagePO;
import cn.osworks.aos.system.dao.po.Aos_sys_page_elPO;
import cn.osworks.aos.system.dao.po.Aos_sys_page_el_grantPO;
import cn.osworks.aos.system.modules.dao.vo.PageVO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 页面组件服务
 * 
 * @author OSWorks-XC
 * @date 2014-07-13
 */
@Service
public class PageService {

	@Autowired
	private Aos_sys_page_elMapper aos_sys_page_elMapper;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_page_el_grantMapper aos_sys_page_el_grantMapper;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Aos_sys_pageMapper aos_sys_pageMapper;

	/**
	 * 查询页面信息
	 * 
	 * @param inDto
	 * @return
	 */
	public List<PageVO> listPages4Mgr(Dto inDto) {
		List<PageVO> list = sqlDao.list("Resource.listPages4Mgr", inDto);
		List<PageVO> mainList = sqlDao.list("Resource.listModuleMainPages", inDto);
		list.addAll(mainList);
		for (PageVO pageVO : mainList) {
			pageVO.setName_(pageVO.getName_() + "-主页面");
		}
		String jqlText = "SELECT * FROM :AOSList ORDER BY module_id_ ASC, sort_no_ ASC";
		list = AOSListUtils.select(list, PageVO.class, jqlText, null);
		return list;
	}

	/**
	 * 查询页面元素 管理使用
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listElements4Mgr(Dto inDto) {
		inDto.setOrder("id_ DESC");
		List<Dto> list = sqlDao.list("Resource.listElements4Mgr", inDto);
		for (Dto dto : list) {
			if (StringUtils.equals(dto.getString("page_id_"), dto.getString("module_id_"))) {
				//主页面
				Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(dto.getString("module_id_"));
				if (AOSUtils.isNotEmpty(aos_sys_modulePO)) {
					dto.put("page_name_", aos_sys_modulePO.getName_() + "-主页面");
				}
			}
		}
		return list;
	}

	/**
	 * 保存页面信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto savePage(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		if (StringUtils.equals(inDto.getString("type_"), DicCons.PAGE_TYPE_SUB)
				&& StringUtils.equals(inDto.getString("is_default_"), AOSCons.YES)) {
			Dto qDto = Dtos.newDto();
			qDto.put("module_id_", inDto.getString("module_id_"));
			qDto.put("type_", DicCons.PAGE_TYPE_SUB);
			qDto.put("is_default_", AOSCons.YES);
			int rows = aos_sys_pageMapper.rows(qDto);
			if (rows > 0) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg("操作取消，同一模块的子页面中只能将1个页面设置为缺省页。");
				return outDto;
			}
		}
		Aos_sys_pagePO aos_sys_pagePO = new Aos_sys_pagePO();
		AOSUtils.copyProperties(inDto, aos_sys_pagePO);
		aos_sys_pagePO.setId_(AOSId.uuid());
		aos_sys_pageMapper.insert(aos_sys_pagePO);
		outDto.setAppMsg("操作完成，页面新增成功。");
		return outDto;
	}

	/**
	 * 修改页面信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updatePage(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		if (StringUtils.equals(inDto.getString("type_"), DicCons.PAGE_TYPE_SUB)
				&& StringUtils.equals(inDto.getString("is_default_"), AOSCons.YES)) {
			// 子页面才做这些判断
			Aos_sys_pagePO oldPO = aos_sys_pageMapper.selectByKey(inDto.getString("id_"));
			if (!StringUtils.equals(oldPO.getIs_default_(), inDto.getString("is_default_"))) {
				Dto qDto = Dtos.newDto();
				qDto.put("module_id_", inDto.getString("module_id_"));
				qDto.put("type_", inDto.getString("type_"));
				qDto.put("is_default_", AOSCons.YES);
				int rows = aos_sys_pageMapper.rows(qDto);
				if (rows > 0) {
					outDto.setAppCode(AOSCons.ERROR);
					outDto.setAppMsg("操作取消，同一模块的子页面中只能将1个页面设置为缺省页。");
					return outDto;
				}
			}
		}
		Aos_sys_pagePO aos_sys_pagePO = new Aos_sys_pagePO();
		AOSUtils.copyProperties(inDto, aos_sys_pagePO);
		aos_sys_pageMapper.updateByKey(aos_sys_pagePO);
		outDto.setAppMsg("操作完成，页面修改成功。");
		return outDto;
	}

	/**
	 * 删除页面
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deletePage(Dto qDto) {
		Dto outDto = Dtos.newOutDto();
		String[] selections = qDto.getRows();
		int cancel = 0, del = 0;
		for (String page_id_ : selections) {
			Aos_sys_pagePO aos_sys_pagePO = aos_sys_pageMapper.selectByKey(page_id_);
			if (AOSUtils.isEmpty(aos_sys_pagePO)) {
				cancel++;
				continue;
			}
			List<Aos_sys_page_elPO> aos_sys_page_elPOs = aos_sys_page_elMapper.list(Dtos.newDto("page_id_", page_id_));
			for (Aos_sys_page_elPO aos_sys_page_elPO : aos_sys_page_elPOs) {
				// 清除页面元素授权资源
				sqlDao.delete("Resource.deleteAos_sys_page_el_grant", aos_sys_page_elPO.getId_());
				// 清除页面元素
				aos_sys_page_elMapper.deleteByKey(aos_sys_page_elPO.getId_());
			}
			// 清除页面
			aos_sys_pageMapper.deleteByKey(page_id_);
			del++;
		}
		String msg = AOSUtils.merge("操作完成，删除{0}条页面记录。", del);
		if (cancel > 0) {
			msg = msg + AOSUtils.merge("取消删除{0}条主页面记录。", cancel) + "(提示：主页面不能删除。)";
		}
		outDto.setAppMsg(msg);
		return outDto;
	}

	/**
	 * 保存页面元素信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto saveElement(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("dom_id_", inDto.getString("dom_id_"));
		calcDto.put("module_id_", inDto.getString("module_id_"));
		calcDto.put("page_id_", inDto.getString("page_id_"));
		int rows = aos_sys_page_elMapper.rows(calcDto);
		if (rows > 0) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg("当前页面元素Dom标识已被占用，请重新输入。");
			return outDto;
		}
		Aos_sys_page_elPO aos_sys_page_elPO = new Aos_sys_page_elPO();
		AOSUtils.copyProperties(inDto, aos_sys_page_elPO);
		aos_sys_page_elPO.setId_(AOSId.uuid());
		aos_sys_page_elMapper.insert(aos_sys_page_elPO);
		outDto.setAppMsg("操作完成，页面元素新增成功。");
		return outDto;
	}

	/**
	 * 修改页面元素信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updateElement(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		Aos_sys_page_elPO aos_sys_page_elPO = aos_sys_page_elMapper.selectByKey(inDto.getString("id_"));
		if (!inDto.getString("dom_id_").equals(aos_sys_page_elPO.getDom_id_())) {
			// 修改了页面元素ID属性
			Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
			calcDto.put("dom_id_", inDto.getString("dom_id_"));
			calcDto.put("module_id_", inDto.getString("module_id_"));
			calcDto.put("page_id_", inDto.getString("page_id_"));
			int rows = aos_sys_page_elMapper.rows(calcDto);
			if (rows > 0) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg("当前页面元素Dom ID已被占用，请重新输入。");
				return outDto;
			}
		}
		Aos_sys_page_elPO aos_sys_page_elPO2 = new Aos_sys_page_elPO();
		AOSUtils.copyProperties(inDto, aos_sys_page_elPO2);
		aos_sys_page_elMapper.updateByKey(aos_sys_page_elPO2);
		outDto.setAppMsg("操作完成，页面元素修改成功。");
		return outDto;
	}

	/**
	 * 删除页面元素
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deleteElement(Dto qDto) {
		Dto outDto = Dtos.newOutDto();
		String[] selections = qDto.getRows();
		for (String id_ : selections) {
			aos_sys_page_elMapper.deleteByKey(id_);
			// 清除授权资源
			sqlDao.delete("Resource.deleteAos_sys_page_el_grant", id_);
		}
		outDto.setAppMsg(AOSUtils.merge("操作成功，删除{0}条页面元素记录。", selections.length));
		return outDto;
	}

	/**
	 * 查询页面元素 授权使用
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listElement4Grant(Dto inDto) {
		inDto.setOrder("module_id_, id_ DESC");
		List<Dto> elementInfos = sqlDao.list("Resource.listElement4Grant", inDto);
		Dto qDto = Dtos.newDto();
		for (Dto elementDto : elementInfos) {
			qDto.put("el_id_", elementDto.getString("id_"));
			qDto.put("post_id_", inDto.getString("post_id_"));
			qDto.put("role_id_", inDto.getString("role_id_"));
			qDto.put("user_id_", inDto.getString("user_id_"));
			Aos_sys_page_el_grantPO aos_sys_page_el_grantPO = aos_sys_page_el_grantMapper.selectOne(qDto);
			if (AOSUtils.isEmpty(aos_sys_page_el_grantPO)) {
				elementDto.put("grant_type_", DicCons.ELEMENT_GRANT_TYPE_WSQ);
			} else {
				elementDto.put("grant_type_", aos_sys_page_el_grantPO.getGrant_type_());
				elementDto.put("element_grant_id_", aos_sys_page_el_grantPO.getId_());
			}
			//处理主页面时的所属页面
			if (AOSUtils.isEmpty(elementDto.getString("page_name_"))) {
				elementDto.put("page_name_", elementDto.getString("module_name_") + "-主页面");
			}
		}
		return elementInfos;
	}

	/**
	 * 保存\取消元素授权信息
	 * 
	 * @param pDto
	 */
	@Transactional
	public void saveElementGrantInfo(Dto pDto) {
		Aos_sys_page_el_grantPO aos_sys_page_el_grantPO = new Aos_sys_page_el_grantPO();
		AOSUtils.copyProperties(pDto, aos_sys_page_el_grantPO);
		String grant_type_ = pDto.getString("grant_type_");
		aos_sys_page_el_grantPO.setGrant_type_(grant_type_);
		aos_sys_page_el_grantPO.setEl_id_(pDto.getString("id_"));
		aos_sys_page_el_grantPO.setId_(pDto.getString("element_grant_id_"));
		// 新授权
		if (AOSUtils.isEmpty(pDto.getString("element_grant_id_"))) {
			// 如果授权类型为撤销授权，则不进行授权写表操作
			if (!StringUtils.equals(DicCons.ELEMENT_GRANT_TYPE_CXSQ, grant_type_)) {
				aos_sys_page_el_grantPO.setId_(AOSId.uuid());
				aos_sys_page_el_grantMapper.insert(aos_sys_page_el_grantPO);
			}
		} else {
			if (StringUtils.equals(DicCons.ELEMENT_GRANT_TYPE_CXSQ, grant_type_)) {
				// 撤销授权
				aos_sys_page_el_grantMapper.deleteByKey(aos_sys_page_el_grantPO.getId_());
			} else {
				// 修改授权类型
				aos_sys_page_el_grantMapper.updateByKey(aos_sys_page_el_grantPO);
			}
		}
	}

	/**
	 * 查询页面元素授权窗口上的功能模块树
	 * 
	 * @return
	 */
	public String getModulesTree4CmpGrant(Dto inDto) {
		UserInfoVO userInfoVO = inDto.getUserInfo();
		if (StringUtils.equals(userInfoVO.getType_(), DicCons.USER_TYPE_SUPER)) {
			// 超级用户可以对所有菜单托管下的页面元素进行授权
			return AOSJson.toJson(moduleService.getModulesTree(inDto));
		} else {
			// 普通用户则根据其拥有的菜单管理权限而定
			inDto.put("user_id_", userInfoVO.getId_());
			List<Aos_sys_modulePO> aos_sys_modulePOs = systemService.getAdminModulesOfUser(inDto);
			return toTreeModal(aos_sys_modulePOs);
		}
	}

	/**
	 * 将后台树结构转换为前端树模型
	 * 
	 * @param inDto
	 * @return
	 */
	private String toTreeModal(List<Aos_sys_modulePO> aos_sys_modulePOs) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			treeNode.setA(aos_sys_modulePO.getUrl_());
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
		return jsonString;
	}
}
