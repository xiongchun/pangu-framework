package cn.osworks.aos.modules.system.service.auth;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_orgMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_postMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_userMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_au_user_cfgMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_au_orgPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_postPO;
import cn.osworks.aos.modules.system.dao.po.Aos_au_userPO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.web.misc.IdCons;


/**
 * 组织架构
 * 
 * @author OSWorks-XC
 * @date 2014-07-16
 */
@Service
public class OrgService {

	@Autowired
	private Aos_au_orgMapper aos_au_orgMapper;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_au_postMapper aos_au_postMapper;
	@Autowired
	private Aos_au_userMapper aos_au_userMapper;
	@Autowired
	private Aos_au_user_cfgMapper aos_au_user_cfgMapper;

	/**
	 * 保存组织信息
	 * 
	 * @param inDto
	 */
	public void saveOrg(Dto inDto) {
		Aos_au_orgPO aos_au_orgPO = new Aos_au_orgPO();
		AOSUtils.apply(inDto, aos_au_orgPO);
		aos_au_orgPO.setId_(AOSId.id(IdCons.GID));
		// 生成语义ID
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", aos_au_orgPO.getParent_id_());
		String maxCascade_id_ = aos_au_orgMapper.calc(calcDto);
		Aos_au_orgPO parentPO = aos_au_orgMapper.selectByKey(aos_au_orgPO.getParent_id_());
		if (AOSUtils.isEmpty(maxCascade_id_)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentPO)) {
				temp = parentPO.getCascade_id_();
			}
			maxCascade_id_ = temp + ".000";
		}
		String cascade_id_ = AOSId.treeId(maxCascade_id_, 999);
		aos_au_orgPO.setCascade_id_(cascade_id_);
		String pareant_name_ = "root";
		if (AOSUtils.isNotEmpty(parentPO)) {
			pareant_name_ = parentPO.getName_();
		}
		aos_au_orgPO.setPareant_name_(pareant_name_);
		UserInfoVO userInfoVO = inDto.getUserInfo();
		aos_au_orgPO.setCreater_id_(userInfoVO.getId_());
		aos_au_orgPO.setCreate_time_(AOSUtils.getDateTimeStr());
		aos_au_orgMapper.insert(aos_au_orgPO);
		// 更新父节点是否叶子节点属性
		parentPO.setIs_leaf_(AOSCons.NO);
		aos_au_orgMapper.updateByKey(parentPO);
	}

	/**
	 * 修改组织信息
	 * 
	 * @param inDto
	 */
	public Dto updateOrg(Dto inDto) {
		Dto outDto = Dtos.newDto();
		// 修改属性后的节点
		Aos_au_orgPO updatePO = new Aos_au_orgPO();
		AOSUtils.apply(inDto, updatePO);
		// 修改属性前的节点
		Aos_au_orgPO aos_au_orgPO = aos_au_orgMapper.selectByKey(updatePO.getId_());
		if (!updatePO.getName_().equals(aos_au_orgPO.getName_())) {
			// 修改了部门名称，则更新以此节点作为父节点名称的冗余字段
			Dto dto = Dtos.newDto();
			dto.put("parent_id_", updatePO.getId_());
			dto.put("pareant_name_", updatePO.getName_());
			sqlDao.update("Auth.updateAos_au_orgByParent_id_", dto);
		}
		// 更新节点
		aos_au_orgMapper.updateByKey(updatePO);
		return outDto;
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
		String count = aos_au_orgMapper.calc(calcDto);
		Aos_au_orgPO aos_au_orgPO = new Aos_au_orgPO();
		aos_au_orgPO.setId_(nodeid);
		if (Integer.valueOf(count) > 0) {
			aos_au_orgPO.setIs_leaf_(AOSCons.NO);
		} else {
			aos_au_orgPO.setIs_leaf_(AOSCons.YES);
		}
		aos_au_orgMapper.updateByKey(aos_au_orgPO);
	}

	/**
	 * 删除组织
	 * 
	 * @param qDto
	 */
	public Dto deleteOrg(Dto qDto) {
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
			Aos_au_orgPO aos_au_orgPO = aos_au_orgMapper.selectByKey(id_);
			if (aos_au_orgPO.getCascade_id_().length() < length) {
				parent_id_ = aos_au_orgPO.getParent_id_();
				length = aos_au_orgPO.getCascade_id_().length();
			}
		}

		// 删除组织操作
		for (String id_ : selList) {
			Aos_au_orgPO aos_au_orgPO = aos_au_orgMapper.selectByKey(id_);
			if (AOSUtils.isEmpty(aos_au_orgPO)) {
				continue;
			}
			Dto dto = Dtos.newDto();
			dto.put("cascade_id_", aos_au_orgPO.getCascade_id_());
			List<Aos_au_orgPO> list = aos_au_orgMapper.like(dto);
			for (Aos_au_orgPO aos_au_orgPO2 : list) {
				aos_au_orgMapper.updateByKey(aos_au_orgPO2);
				aos_au_orgMapper.deleteByKey(aos_au_orgPO2.getId_());
				updateIsLeafNode(aos_au_orgPO2.getParent_id_());
				// 删除相关授权信息
				resetWhenDeleteOrg(aos_au_orgPO2.getId_());
			}
		}

		// 计算前端组织树刷新节点ID
		Aos_au_orgPO aos_au_orgPO = aos_au_orgMapper.selectByKey(parent_id_);
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("parent_id_", parent_id_);
		String count = aos_au_orgMapper.calc(calcDto);
		if (Integer.valueOf(count) > 0) {
			// 刷新自己
			outDto.put("nodeid", aos_au_orgPO.getId_());
		} else {
			Aos_au_orgPO aos_au_orgPO2 = aos_au_orgMapper.selectByKey(aos_au_orgPO.getParent_id_());
			if (aos_au_orgPO.getId_().equals("0")) {
				// 刷新根节点
				outDto.put("nodeid", "0");
			} else {
				// 刷新父节点
				outDto.put("nodeid", aos_au_orgPO2.getId_());
			}
		}
		outDto.setAppMsg("操作完成，成功删除数据。");
		return outDto;
	}

	/**
	 * 删除组织时的相关资源清理操作
	 * 
	 * @param id_
	 *            组织流水号
	 */
	public void resetWhenDeleteOrg(String id_) {
		//待删岗位集合
		List<Aos_au_postPO> aos_au_postPOs = aos_au_postMapper.list(Dtos.newDto("id_", id_));
		//待删人员集合(如果以后改为人员可以属于多个组织的话，这里需要重新实现)
	    List<Aos_au_userPO> aos_au_userPOs = aos_au_userMapper.list(Dtos.newDto("id_", id_));
	    
	    for (Aos_au_postPO aos_au_postPO : aos_au_postPOs) {
			//删除岗位-菜单关联表
	    	sqlDao.delete("Auth.deleteAos_au_module_postByPost_id_", Dtos.newDto("post_id_", aos_au_postPO.getId_()));
	    	//删除岗位-用户关联表
	    	sqlDao.delete("Auth.deleteAos_au_user_postByPost_id_", Dtos.newDto("post_id_", aos_au_postPO.getId_()));
	    	//删除岗位自己
	    	aos_au_postMapper.deleteByKey(aos_au_postPO.getId_());
		}
	    
	    for (Aos_au_userPO aos_au_userPO : aos_au_userPOs) {
	    	//删除用户-菜单关联表
	    	sqlDao.delete("Auth.deleteAos_au_module_userByUser_id_", aos_au_userPO.getId_());
	    	//删除用户-岗位关联表
	    	sqlDao.delete("Auth.deleteAos_au_user_postByUser_id_", Dtos.newDto("user_id_", Dtos.newDto("user_id_", aos_au_userPO.getId_())));
	    	//删除用户配置表
	    	aos_au_user_cfgMapper.deleteByKey(aos_au_userPO.getId_());
	    	//删除用户自己
	    	aos_au_userMapper.deleteByKey(aos_au_userPO.getId_());
		}
		
	}

}
