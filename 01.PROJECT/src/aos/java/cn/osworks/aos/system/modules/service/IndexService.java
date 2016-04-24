package cn.osworks.aos.system.modules.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.dao.asset.DBDialectUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.web.tag.core.model.TreeBuilder;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 首页服务
 * 
 * @author OSWorks-XC
 * @date 2014-05-13
 */
@Service
public class IndexService {
	
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private SystemService systemService;
	
	/**
	 * 获取左侧导航的菜单卡片
	 * 
	 * @return
	 */
	public List<Dto> getLeftNavCradList(Dto inDto) {
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Dto> cardDtos = Lists.newArrayList();
		//超级用户不做任何限制
		if (StringUtils.equals(DicCons.USER_TYPE_SUPER, userInfoVO.getType_())) {
			inDto.put("fnLength", DBDialectUtils.fnLength(sqlDao.getDatabaseId()));
			cardDtos = sqlDao.list("Auth.getLeftNavCradListBasedRoot", inDto);
		}else {
			inDto.put("user_id_", inDto.getUserInfo().getId_());
			//获取语义节点ID为5的那层菜单作为一级导航  查询卡片标题
			inDto.put("length", "5");
			List<Aos_sys_modulePO> aos_sys_modulePOs = systemService.getBizModulesOfUser(inDto);
			for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
				cardDtos.add(aos_sys_modulePO.toDto());
			}
		}
		return cardDtos;
	}
	
	/**
	 * 获取系统导航菜单树
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto getModuleTree(Dto inDto){
		Dto outDto = Dtos.newDto();
		UserInfoVO userInfoVO = inDto.getUserInfo();
		List<Aos_sys_modulePO> aos_sys_modulePOs = Lists.newArrayList();
		if (DicCons.USER_TYPE_SUPER.equals(userInfoVO.getType_())) {
			//超级用户不做任何限制
			aos_sys_modulePOs = sqlDao.list("Auth.getModuleTreeBasedRoot", inDto);
			outDto.setStringA(toTreeModal(aos_sys_modulePOs));
		}else {
			inDto.put("user_id_", inDto.getUserInfo().getId_());
			aos_sys_modulePOs = systemService.getBizModulesOfUser(inDto);
		}
		outDto.setStringA(toTreeModal(aos_sys_modulePOs));
		return outDto;
	}
	
	/**
	 * 将后台树结构转换为前端树模型
	 * 
	 * @param inDto
	 * @return
	 */
	private String toTreeModal(List<Aos_sys_modulePO> aos_sys_modulePOs){
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
