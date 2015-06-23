package cn.osworks.aos.modules.system.service.resource;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.asset.AOSXmlParam;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_moduleMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_page_elMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_modulePO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_page_elPO;
import cn.osworks.aos.web.tag.core.model.TreeNode;
import cn.osworks.aos.web.misc.IdCons;

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
	private Aos_au_moduleMapper aos_au_moduleMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_au_page_elMapper aos_au_page_elMapper;

	/**
	 * 保存功能模块菜单信息
	 * 
	 * @param inDto
	 */
	public void saveModule(Dto inDto) {
		Aos_au_modulePO aos_au_modulePO = new Aos_au_modulePO();
		AOSUtils.apply(inDto, aos_au_modulePO);
		aos_au_modulePO.setId_(AOSId.id(IdCons.GID));
		// 生成语义ID
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", aos_au_modulePO.getParent_id_());
		String maxAos_au_modulea1 = aos_au_moduleMapper.calc(calcDto);
		Aos_au_modulePO parentAos_au_modulePO = aos_au_moduleMapper.selectByKey(aos_au_modulePO.getParent_id_());
		if (AOSUtils.isEmpty(maxAos_au_modulea1)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentAos_au_modulePO)) {
				temp = parentAos_au_modulePO.getCascade_id_();
			}
			maxAos_au_modulea1 = temp + ".000";
		}
		String cascade_id_ = AOSId.treeId(maxAos_au_modulea1, 999);
		aos_au_modulePO.setCascade_id_(cascade_id_);
		String aos_au_moduleb1 = "root";
		if (AOSUtils.isNotEmpty(parentAos_au_modulePO)) {
			aos_au_moduleb1 = parentAos_au_modulePO.getName_();
		}
		aos_au_modulePO.setParent_name_(aos_au_moduleb1);
		aos_au_moduleMapper.insert(aos_au_modulePO);
		// 更新父节点是否叶子节点属性
		parentAos_au_modulePO.setIs_leaf_(AOSCons.NO);
		aos_au_moduleMapper.updateByKey(parentAos_au_modulePO);
	}

	/**
	 * 修改功能模块菜单信息
	 * 
	 * @param inDto
	 */
	public Dto updateModule(Dto inDto) {
		Dto outDto = Dtos.newDto();
		// 修改属性后的节点
		Aos_au_modulePO updatePO = new Aos_au_modulePO();
		AOSUtils.apply(inDto, updatePO);
		// 修改属性前的节点
		Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey(updatePO.getId_());
		if (!updatePO.getName_().equals(aos_au_modulePO.getName_())) {
			// 修改了菜单名称，则更新以此节点作为父节点名称的冗余字段
			Dto dto = Dtos.newDto();
			dto.put("parent_id_", updatePO.getId_());
			dto.put("parent_name_", updatePO.getName_());
			sqlDao.update("Resource.updateModuleByParent_id_", dto);
		}
		if (!updatePO.getParent_id_().equals(aos_au_modulePO.getParent_id_())) {
			//outDto.setAppCode(1); // 是否更新了上级菜单
			// 如果修改了上级菜单，则做相应的处理。
			// 修改属性后的节点的父节点
			Aos_au_modulePO pPO = aos_au_moduleMapper.selectByKey(updatePO.getParent_id_());
			Aos_au_modulePO updatePO2 = new Aos_au_modulePO();
			updatePO2.setId_(updatePO.getId_());
			updatePO2.setParent_name_(pPO.getName_());
			// 更新当前节点变更后的新父节点的名称
			aos_au_moduleMapper.updateByKey(updatePO2);
			// 更新节点、循环处理当前节点及其所有子孙节点的语义节点ID属性
			updateAos_au_module(aos_au_modulePO, updatePO);
			// 更新当前节点修改之前的父节点的是否叶子节点属性
			updateIsLeafNode(aos_au_modulePO.getParent_id_());
			// 更新当前节点修改之后的父节点的是否叶子节点属性
			updateIsLeafNode(updatePO.getParent_id_());
		} else {
			// 更新节点
			aos_au_moduleMapper.updateByKey(updatePO);
		}
		return outDto;
	}

	/**
	 * 更新节点、循环处理当前节点及其所有子孙节点的语义节点ID属性
	 * 
	 * @param aos_au_modulePO
	 *            原节点
	 * @param updatePO
	 *            新节点
	 */
	private void updateAos_au_module(Aos_au_modulePO aos_au_modulePO, Aos_au_modulePO updatePO) {
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", updatePO.getParent_id_());
		String maxAos_au_modulea1 = aos_au_moduleMapper.calc(calcDto);
		if (AOSUtils.isEmpty(maxAos_au_modulea1)) {
			Aos_au_modulePO aos_au_modulePO2 = aos_au_moduleMapper.selectByKey(updatePO.getParent_id_());
			maxAos_au_modulea1 = aos_au_modulePO2.getCascade_id_() + ".000";
		}
		String new_cascade_id_ = AOSId.treeId(maxAos_au_modulea1, 999);
		updatePO.setCascade_id_(new_cascade_id_);
		Dto qDto = Dtos.newDto();
		String old_cascade_id_ = aos_au_modulePO.getCascade_id_();
		qDto.put("cascade_id_", old_cascade_id_);
		List<Aos_au_modulePO> subNodeList = aos_au_moduleMapper.like(qDto);
		for (Aos_au_modulePO po : subNodeList) {
			String cur_cascade_id_ = po.getCascade_id_();
			if (cur_cascade_id_.equals(old_cascade_id_)) {
				continue;
			}
			String cascade_id_ = StringUtils.replace(cur_cascade_id_, old_cascade_id_, new_cascade_id_);
			po.setCascade_id_(cascade_id_);
			// 更新子节点的语义ID
			aos_au_moduleMapper.updateByKey(po);
		}
		// 更新节点
		aos_au_moduleMapper.updateByKey(updatePO);
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
		String count = aos_au_moduleMapper.calc(calcDto);
		Aos_au_modulePO aos_au_modulePO = new Aos_au_modulePO();
		aos_au_modulePO.setId_(nodeid);
		if (Integer.valueOf(count) > 0) {
			aos_au_modulePO.setIs_leaf_(AOSCons.NO);
		} else {
			aos_au_modulePO.setIs_leaf_(AOSCons.YES);
		}
		aos_au_moduleMapper.updateByKey(aos_au_modulePO);
	}

	/**
	 * 获取功能模块树节点集合
	 * 
	 * @param qDto
	 */
	public List<Dto> getModulesTree(Dto qDto) {
		List<Aos_au_modulePO> list = aos_au_moduleMapper.list(qDto);
		return toTreeDto(list);
	}

	/**
	 * 删除功能模块菜单
	 * 
	 * @param qDto
	 */
	public Dto deleteModule(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String[] selections = qDto.getSelection();
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
			Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey(id_);
			if (aos_au_modulePO.getCascade_id_().length() < length) {
				parent_id_ = aos_au_modulePO.getParent_id_();
				length = aos_au_modulePO.getCascade_id_().length();
			}
		}

		for (String id_ : selList) {
			Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey(id_);
			if (AOSUtils.isEmpty(aos_au_modulePO)) {
				continue;
			}
			Dto dto = Dtos.newDto();
			dto.put("cascade_id_", aos_au_modulePO.getCascade_id_());
			List<Aos_au_modulePO> list = aos_au_moduleMapper.like(dto);
			for (Aos_au_modulePO aos_au_modulePO2 : list) {
				aos_au_moduleMapper.deleteByKey(aos_au_modulePO2.getId_());
				updateIsLeafNode(aos_au_modulePO2.getParent_id_());
				//删除该模块下的页面元素的授权资源
				List<Aos_au_page_elPO> aos_au_page_elPOs = aos_au_page_elMapper.list(Dtos.newDto("module_id_", aos_au_modulePO2.getId_()));
				for (Aos_au_page_elPO aos_au_page_elPO : aos_au_page_elPOs) {
					sqlDao.delete("Resource.deleteAos_au_page_el_grant", aos_au_page_elPO.getId_());
				}
				// 删除该模块下的页面元素
				sqlDao.delete("Resource.deleteAos_au_page_elPOByModule_id_", aos_au_modulePO2.getId_());
				//删除该模块下的页面
				sqlDao.delete("Resource.deleteAos_au_page", aos_au_modulePO2.getId_());
			}
		}

		//计算前端菜单树刷新节点ID
		Aos_au_modulePO aos_au_modulePO = aos_au_moduleMapper.selectByKey(parent_id_);
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("parent_id_", parent_id_);
		String count = aos_au_moduleMapper.calc(calcDto);
		if (Integer.valueOf(count) > 0) {
			outDto.put("nodeid", aos_au_modulePO.getId_());
		} else {
			Aos_au_modulePO aos_au_modulePO2 = aos_au_moduleMapper.selectByKey(aos_au_modulePO.getParent_id_());
			if (aos_au_modulePO.getId_().equals("0")) {
				outDto.put("nodeid", "0");
			}else {
				outDto.put("nodeid", aos_au_modulePO2.getId_());
			}
		}
		outDto.setAppMsg("操作完成，成功删除数据。");
		return outDto;
	}
	
	/**
	 * 将模型集合转换为模型树
	 * 
	 * @param aos_au_modulePOs
	 * @return
	 */
	public List<Dto>toTreeDto(List<Aos_au_modulePO> aos_au_modulePOs){
		List<Dto> treeNodes = new ArrayList<Dto>();
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlParam.getValue("icon_path");
		for (Aos_au_modulePO aos_au_modulePO : aos_au_modulePOs) {
			Dto treeNode = Dtos.newDto();
			treeNode.put("id", aos_au_modulePO.getId_());
			treeNode.put("text", aos_au_modulePO.getName_());
			treeNode.put("cascade_id_", aos_au_modulePO.getCascade_id_());
			String icon_ = aos_au_modulePO.getIcon_name_();
			if (AOSUtils.isNotEmpty(icon_)) {
				treeNode.put("icon", iconPath + icon_);
			}
			String is_leaf_ = aos_au_modulePO.getIs_leaf_();
			if (AOSCons.YES.equals(is_leaf_)) {
				treeNode.put("leaf", true);
			} else {
				treeNode.put("leaf", false);
			}
			String is_auto_expand_ = aos_au_modulePO.getIs_auto_expand_();
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
	 * @param aos_au_modulePOs
	 * @return
	 */
	public List<TreeNode> toTreeModal(List<Aos_au_modulePO> aos_au_modulePOs){
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_au_modulePO aos_au_modulePO : aos_au_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_au_modulePO.getId_());
			treeNode.setText(aos_au_modulePO.getName_());
			treeNode.setParentId(aos_au_modulePO.getParent_id_());
			treeNode.setIcon(aos_au_modulePO.getIcon_name_());
			treeNode.setA(aos_au_modulePO.getUrl_());
			boolean leaf = true;
			if (aos_au_modulePO.getIs_leaf_().equals(AOSCons.NO)) {
				leaf = false;
			}
			treeNode.setLeaf(leaf);
			boolean expanded = true;
			if (aos_au_modulePO.getIs_auto_expand_().equals(AOSCons.NO)) {
				expanded = false;
			}
			treeNode.setExpanded(expanded);
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

}
