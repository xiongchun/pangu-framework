package cn.osworks.aos.system.modules.service.resource;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_page_elMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_page_elPO;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;


/**
 * 功能模块服务
 * 
 * @author OSWorks-XC
 * @date 2014-07-13
 */
@Service
public class ModuleService {

	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_page_elMapper aos_sys_page_elMapper;

	/**
	 * 保存功能模块菜单信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public void saveModule(Dto inDto) {
		Aos_sys_modulePO aos_sys_modulePO = new Aos_sys_modulePO();
		AOSUtils.copyProperties(inDto, aos_sys_modulePO);
		aos_sys_modulePO.setId_(AOSId.uuid());
		// 生成语义ID
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", aos_sys_modulePO.getParent_id_());
		String maxAos_sys_modulea1 = aos_sys_moduleMapper.calc(calcDto);
		Aos_sys_modulePO parentAos_sys_modulePO = aos_sys_moduleMapper.selectByKey(aos_sys_modulePO.getParent_id_());
		if (AOSUtils.isEmpty(maxAos_sys_modulea1)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentAos_sys_modulePO)) {
				temp = parentAos_sys_modulePO.getCascade_id_();
			}
			maxAos_sys_modulea1 = temp + ".000";
		}
		String cascade_id_ = AOSId.treeId(maxAos_sys_modulea1, 999);
		aos_sys_modulePO.setCascade_id_(cascade_id_);
		String aos_sys_moduleb1 = "root";
		if (AOSUtils.isNotEmpty(parentAos_sys_modulePO)) {
			aos_sys_moduleb1 = parentAos_sys_modulePO.getName_();
		}
		aos_sys_modulePO.setParent_name_(aos_sys_moduleb1);
		aos_sys_moduleMapper.insert(aos_sys_modulePO);
		// 更新父节点是否叶子节点属性
		parentAos_sys_modulePO.setIs_leaf_(AOSCons.NO);
		aos_sys_moduleMapper.updateByKey(parentAos_sys_modulePO);
	}

	/**
	 * 修改功能模块菜单信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updateModule(Dto inDto) {
		Dto outDto = Dtos.newDto();
		// 修改属性后的节点
		Aos_sys_modulePO updatePO = new Aos_sys_modulePO();
		AOSUtils.copyProperties(inDto, updatePO);
		// 修改属性前的节点
		Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(updatePO.getId_());
		if (!updatePO.getName_().equals(aos_sys_modulePO.getName_())) {
			// 修改了菜单名称，则更新以此节点作为父节点名称的冗余字段
			Dto dto = Dtos.newDto();
			dto.put("parent_id_", updatePO.getId_());
			dto.put("parent_name_", updatePO.getName_());
			sqlDao.update("Resource.updateModuleByParent_id_", dto);
		}
		if (!updatePO.getParent_id_().equals(aos_sys_modulePO.getParent_id_())) {
			//outDto.setAppCode(1); // 是否更新了上级菜单
			// 如果修改了上级菜单，则做相应的处理。
			// 修改属性后的节点的父节点
			Aos_sys_modulePO pPO = aos_sys_moduleMapper.selectByKey(updatePO.getParent_id_());
			Aos_sys_modulePO updatePO2 = new Aos_sys_modulePO();
			updatePO2.setId_(updatePO.getId_());
			updatePO2.setParent_name_(pPO.getName_());
			// 更新当前节点变更后的新父节点的名称
			aos_sys_moduleMapper.updateByKey(updatePO2);
			// 更新节点、循环处理当前节点及其所有子孙节点的语义节点ID属性
			updateAos_sys_module(aos_sys_modulePO, updatePO);
			// 更新当前节点修改之前的父节点的是否叶子节点属性
			updateIsLeafNode(aos_sys_modulePO.getParent_id_());
			// 更新当前节点修改之后的父节点的是否叶子节点属性
			updateIsLeafNode(updatePO.getParent_id_());
		} else {
			// 更新节点
			aos_sys_moduleMapper.updateByKey(updatePO);
		}
		return outDto;
	}

	/**
	 * 更新节点、循环处理当前节点及其所有子孙节点的语义节点ID属性
	 * 
	 * @param aos_sys_modulePO
	 *            原节点
	 * @param updatePO
	 *            新节点
	 */
	@Transactional
	private void updateAos_sys_module(Aos_sys_modulePO aos_sys_modulePO, Aos_sys_modulePO updatePO) {
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", updatePO.getParent_id_());
		String maxAos_sys_modulea1 = aos_sys_moduleMapper.calc(calcDto);
		if (AOSUtils.isEmpty(maxAos_sys_modulea1)) {
			Aos_sys_modulePO aos_sys_modulePO2 = aos_sys_moduleMapper.selectByKey(updatePO.getParent_id_());
			maxAos_sys_modulea1 = aos_sys_modulePO2.getCascade_id_() + ".000";
		}
		String new_cascade_id_ = AOSId.treeId(maxAos_sys_modulea1, 999);
		updatePO.setCascade_id_(new_cascade_id_);
		Dto qDto = Dtos.newDto();
		String old_cascade_id_ = aos_sys_modulePO.getCascade_id_();
		qDto.put("cascade_id_", old_cascade_id_);
		List<Aos_sys_modulePO> subNodeList = aos_sys_moduleMapper.like(qDto);
		for (Aos_sys_modulePO po : subNodeList) {
			String cur_cascade_id_ = po.getCascade_id_();
			if (cur_cascade_id_.equals(old_cascade_id_)) {
				continue;
			}
			String cascade_id_ = StringUtils.replace(cur_cascade_id_, old_cascade_id_, new_cascade_id_);
			po.setCascade_id_(cascade_id_);
			// 更新子节点的语义ID
			aos_sys_moduleMapper.updateByKey(po);
		}
		// 更新节点
		aos_sys_moduleMapper.updateByKey(updatePO);
	}

	/**
	 * 更新该节点的是否叶子节点属性
	 * 
	 * @param nodeid
	 *            节点ID
	 */
	private void updateIsLeafNode(String nodeid) {
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("parent_id_", nodeid);
		String count = aos_sys_moduleMapper.calc(calcDto);
		Aos_sys_modulePO aos_sys_modulePO = new Aos_sys_modulePO();
		aos_sys_modulePO.setId_(nodeid);
		if (Integer.valueOf(count) > 0) {
			aos_sys_modulePO.setIs_leaf_(AOSCons.NO);
		} else {
			aos_sys_modulePO.setIs_leaf_(AOSCons.YES);
		}
		aos_sys_moduleMapper.updateByKey(aos_sys_modulePO);
	}

	/**
	 * 获取功能模块树节点集合
	 * 
	 * @param qDto
	 */
	public List<Dto> getModulesTree(Dto qDto) {
		List<Aos_sys_modulePO> list = aos_sys_moduleMapper.list(qDto);
		return toTreeDto(list);
	}

	/**
	 * 删除功能模块菜单
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deleteModule(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getRows();
		List<String> selList = Arrays.asList(selections);
		for (String id_ : selList) {
			if (id_.equals("0")) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg("根节点不能删除，请重新选择。");
				return outDto;
			}
		}
		int length = 100; // 语义节点ID长度最短值
		String parent_id_ = "";
		for (String id_ : selList) {
			Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(id_);
			if (aos_sys_modulePO.getCascade_id_().length() < length) {
				parent_id_ = aos_sys_modulePO.getParent_id_();
				length = aos_sys_modulePO.getCascade_id_().length();
			}
		}

		for (String id_ : selList) {
			Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(id_);
			if (AOSUtils.isEmpty(aos_sys_modulePO)) {
				continue;
			}
			Dto dto = Dtos.newDto();
			dto.put("cascade_id_", aos_sys_modulePO.getCascade_id_());
			List<Aos_sys_modulePO> list = aos_sys_moduleMapper.like(dto);
			for (Aos_sys_modulePO aos_sys_modulePO2 : list) {
				aos_sys_moduleMapper.deleteByKey(aos_sys_modulePO2.getId_());
				updateIsLeafNode(aos_sys_modulePO2.getParent_id_());
				//删除该模块下的页面元素的授权资源
				List<Aos_sys_page_elPO> aos_sys_page_elPOs = aos_sys_page_elMapper.list(Dtos.newDto("module_id_", aos_sys_modulePO2.getId_()));
				for (Aos_sys_page_elPO aos_sys_page_elPO : aos_sys_page_elPOs) {
					sqlDao.delete("Resource.deleteAos_sys_page_el_grant", aos_sys_page_elPO.getId_());
				}
				// 删除该模块下的页面元素
				sqlDao.delete("Resource.deleteAos_sys_page_elPOByModule_id_", aos_sys_modulePO2.getId_());
				//删除该模块下的页面
				sqlDao.delete("Resource.deleteAos_sys_page", aos_sys_modulePO2.getId_());
				
				/*删除该模块的页面授权信息  没有对父节点进行级联处理，有可能产生垃圾数据 
				应该级联判断删除本节点后他的父节点是否为空的树枝节点，如果是则级联删除，但是逻辑实在太复杂了，得考虑多种情况
				目前尚我找到一个高效便捷的算法。所以垃圾数据忽略了。*/
				sqlDao.delete("Resource.deleteAos_sys_module_user", aos_sys_modulePO2.getId_());
				sqlDao.delete("Resource.deleteAos_sys_module_user_nav", aos_sys_modulePO2.getId_());
				sqlDao.delete("Resource.deleteAos_sys_module_role", aos_sys_modulePO2.getId_());
				sqlDao.delete("Resource.deleteAos_sys_module_post", aos_sys_modulePO2.getId_());
				
			}
		}

		//计算前端菜单树刷新节点ID
		Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(parent_id_);
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("parent_id_", parent_id_);
		String count = aos_sys_moduleMapper.calc(calcDto);
		if (Integer.valueOf(count) > 0) {
			outDto.put("nodeid", aos_sys_modulePO.getId_());
		} else {
			Aos_sys_modulePO aos_sys_modulePO2 = aos_sys_moduleMapper.selectByKey(aos_sys_modulePO.getParent_id_());
			if (aos_sys_modulePO.getId_().equals("0")) {
				outDto.put("nodeid", "0");
			}else {
				outDto.put("nodeid", aos_sys_modulePO2.getId_());
			}
		}
		outDto.setAppMsg("操作完成，成功删除数据。");
		return outDto;
	}
	
	/**
	 * 将模型集合转换为模型树
	 * 
	 * @param aos_sys_modulePOs
	 * @return
	 */
	public List<Dto>toTreeDto(List<Aos_sys_modulePO> aos_sys_modulePOs){
		List<Dto> treeNodes = new ArrayList<Dto>();
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlOptionsHandler.getValue("icon_path");
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
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
	 * 将模型集合转换为模型树
	 * 
	 * @param aos_sys_modulePOs
	 * @return
	 */
	public List<TreeNode> toTreeModal(List<Aos_sys_modulePO> aos_sys_modulePOs){
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			treeNode.setA(aos_sys_modulePO.getUrl_());
			boolean leaf = true;
			if (aos_sys_modulePO.getIs_leaf_().equals(AOSCons.NO)) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_sys_modulePO.getIs_auto_expand_().equals(AOSCons.NO)) {
				expanded = false;
			}
			treeNode.setExpanded(expanded);
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

}
