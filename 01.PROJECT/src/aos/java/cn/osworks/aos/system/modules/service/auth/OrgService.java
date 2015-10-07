package cn.osworks.aos.system.modules.service.auth;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.IdCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_cfgMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_userPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;


/**
 * 组织架构
 * 
 * @author OSWorks-XC
 * @date 2014-07-16
 */
@Service
public class OrgService {

	@Autowired
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private SqlDao sysDao;
	@Autowired
	private Aos_sys_postMapper aos_sys_postMapper;
	@Autowired
	private Aos_sys_userMapper aos_sys_userMapper;
	@Autowired
	private Aos_sys_user_cfgMapper aos_sys_user_cfgMapper;

	/**
	 * 保存组织信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public void saveOrg(Dto inDto) {
		Aos_sys_orgPO aos_sys_orgPO = new Aos_sys_orgPO();
		AOSUtils.apply(inDto, aos_sys_orgPO);
		aos_sys_orgPO.setId_(AOSId.id(IdCons.GID));
		// 生成语义ID
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", aos_sys_orgPO.getParent_id_());
		String maxCascade_id_ = aos_sys_orgMapper.calc(calcDto);
		Aos_sys_orgPO parentPO = aos_sys_orgMapper.selectByKey(aos_sys_orgPO.getParent_id_());
		if (AOSUtils.isEmpty(maxCascade_id_)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentPO)) {
				temp = parentPO.getCascade_id_();
			}
			maxCascade_id_ = temp + ".000";
		}
		String cascade_id_ = AOSId.treeId(maxCascade_id_, 999);
		aos_sys_orgPO.setCascade_id_(cascade_id_);
		String pareant_name_ = "root";
		if (AOSUtils.isNotEmpty(parentPO)) {
			pareant_name_ = parentPO.getName_();
		}
		aos_sys_orgPO.setPareant_name_(pareant_name_);
		UserInfoVO userInfoVO = inDto.getUserInfo();
		aos_sys_orgPO.setCreater_id_(userInfoVO.getId_());
		aos_sys_orgPO.setCreate_time_(AOSUtils.getDateTimeStr());
		aos_sys_orgMapper.insert(aos_sys_orgPO);
		// 更新父节点是否叶子节点属性
		parentPO.setIs_leaf_(AOSCons.NO);
		aos_sys_orgMapper.updateByKey(parentPO);
	}

	/**
	 * 修改组织信息
	 * 
	 * @param inDto
	 */
	@Transactional
	public Dto updateOrg(Dto inDto) {
		Dto outDto = Dtos.newDto();
		// 修改属性后的节点
		Aos_sys_orgPO updatePO = new Aos_sys_orgPO();
		AOSUtils.apply(inDto, updatePO);
		// 修改属性前的节点
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(updatePO.getId_());
		if (!updatePO.getName_().equals(aos_sys_orgPO.getName_())) {
			// 修改了部门名称，则更新以此节点作为父节点名称的冗余字段
			Dto dto = Dtos.newDto();
			dto.put("parent_id_", updatePO.getId_());
			dto.put("pareant_name_", updatePO.getName_());
			sysDao.update("Auth.updateAos_sys_orgByParent_id_", dto);
		}
		// 更新节点
		aos_sys_orgMapper.updateByKey(updatePO);
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
		String count = aos_sys_orgMapper.calc(calcDto);
		Aos_sys_orgPO aos_sys_orgPO = new Aos_sys_orgPO();
		aos_sys_orgPO.setId_(nodeid);
		if (Integer.valueOf(count) > 0) {
			aos_sys_orgPO.setIs_leaf_(AOSCons.NO);
		} else {
			aos_sys_orgPO.setIs_leaf_(AOSCons.YES);
		}
		aos_sys_orgMapper.updateByKey(aos_sys_orgPO);
	}

	/**
	 * 删除组织
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto deleteOrg(Dto qDto) {
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
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(id_);
			if (aos_sys_orgPO.getCascade_id_().length() < length) {
				parent_id_ = aos_sys_orgPO.getParent_id_();
				length = aos_sys_orgPO.getCascade_id_().length();
			}
		}

		// 删除组织操作
		for (String id_ : selList) {
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(id_);
			if (AOSUtils.isEmpty(aos_sys_orgPO)) {
				continue;
			}
			Dto dto = Dtos.newDto();
			dto.put("cascade_id_", aos_sys_orgPO.getCascade_id_());
			List<Aos_sys_orgPO> list = aos_sys_orgMapper.like(dto);
			for (Aos_sys_orgPO aos_sys_orgPO2 : list) {
				aos_sys_orgMapper.updateByKey(aos_sys_orgPO2);
				aos_sys_orgMapper.deleteByKey(aos_sys_orgPO2.getId_());
				updateIsLeafNode(aos_sys_orgPO2.getParent_id_());
				// 删除相关授权信息
				resetWhenDeleteOrg(aos_sys_orgPO2.getId_());
			}
		}

		// 计算前端组织树刷新节点ID
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(parent_id_);
		Dto calcDto = Dtos.newCalcDto("COUNT(id_)");
		calcDto.put("parent_id_", parent_id_);
		String count = aos_sys_orgMapper.calc(calcDto);
		if (Integer.valueOf(count) > 0) {
			// 刷新自己
			outDto.put("nodeid", aos_sys_orgPO.getId_());
		} else {
			Aos_sys_orgPO aos_sys_orgPO2 = aos_sys_orgMapper.selectByKey(aos_sys_orgPO.getParent_id_());
			if (aos_sys_orgPO.getId_().equals("0")) {
				// 刷新根节点
				outDto.put("nodeid", "0");
			} else {
				// 刷新父节点
				outDto.put("nodeid", aos_sys_orgPO2.getId_());
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
	@Transactional
	public void resetWhenDeleteOrg(String id_) {
		//待删岗位集合
		List<Aos_sys_postPO> aos_sys_postPOs = aos_sys_postMapper.list(Dtos.newDto("org_id_", id_));
		//待删人员集合(如果以后改为人员可以属于多个组织的话，这里需要重新实现)
	    List<Aos_sys_userPO> aos_sys_userPOs = aos_sys_userMapper.list(Dtos.newDto("org_id_", id_));
	    
	    for (Aos_sys_postPO aos_sys_postPO : aos_sys_postPOs) {
			//删除岗位-菜单关联表
	    	sysDao.delete("Auth.deleteAos_sys_module_postByPost_id_", Dtos.newDto("post_id_", aos_sys_postPO.getId_()));
	    	//删除岗位-用户关联表
	    	sysDao.delete("Auth.deleteAos_sys_user_postByPost_id_", Dtos.newDto("post_id_", aos_sys_postPO.getId_()));
	    	//删除岗位自己
	    	aos_sys_postMapper.deleteByKey(aos_sys_postPO.getId_());
		}
	    
	    for (Aos_sys_userPO aos_sys_userPO : aos_sys_userPOs) {
	    	//删除用户-菜单关联表
	    	sysDao.delete("Auth.deleteAos_sys_module_userByUser_id_", aos_sys_userPO.getId_());
	    	//删除用户-岗位关联表
	    	sysDao.delete("Auth.deleteAos_sys_user_postByUser_id_", Dtos.newDto("user_id_", Dtos.newDto("user_id_", aos_sys_userPO.getId_())));
	    	//删除用户配置表
	    	aos_sys_user_cfgMapper.deleteByKey(aos_sys_userPO.getId_());
	    	//删除用户自己
	    	aos_sys_userMapper.deleteByKey(aos_sys_userPO.getId_());
		}
		
	}

}
