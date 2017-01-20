package aos.system.modules.org;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.framework.core.id.AOSId;
import aos.framework.core.service.AOSBaseService;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.common.model.UserModel;
import aos.system.common.utils.SystemCons;
import aos.system.common.utils.SystemUtils;
import aos.system.dao.AosOrgDao;
import aos.system.dao.po.AosOrgPO;

/**
 * 部门管理
 * 
 * @author xiongchun
 *
 */
@Service
public class OrgService extends AOSBaseService{
	
	@Autowired
	private AosOrgDao aosOrgDao;
	
	/**
	 * 部门管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		AosOrgPO aosOrgPO = aosOrgDao.selectOne(Dtos.newDto("parent_id_", SystemCons.ROOTNODE_PARENT_ID));
		httpModel.setAttribute("rootPO", aosOrgPO);
		httpModel.setViewPath("system/org.jsp");
	}
	
	/**
	 * 获取部门导航树
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getTreeData(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		inDto.setOrder("sort_no_");
		inDto.put("is_del_", SystemCons.IS.NO);
		List<AosOrgPO> aosOrgPOs = aosOrgDao.list(inDto);
		List<Dto> modelDtos = Lists.newArrayList();
		for (AosOrgPO aosOrgPO : aosOrgPOs) {
			modelDtos.add(aosOrgPO.toDto());
		}
		String treeJson = SystemUtils.toTreeModalAsyncLoad(modelDtos);
		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 查询部门列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listOrgs(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		qDto.put("is_del_", SystemCons.IS.NO);
		List<Dto> orgDtos = sqlDao.list("Org.listOrgsPage", qDto);
		httpModel.setOutMsg(AOSJson.toGridJson(orgDtos, qDto.getPageTotal()));
	}

	/**
	 * 保存部门
	 * 
	 * @param httpModel
	 * @return
	 */
	@Transactional
	public void saveOrg(HttpModel httpModel) {
		UserModel userModel = httpModel.getUserModel();
		Dto inDto = httpModel.getInDto();
		AosOrgPO aosOrgPO = new AosOrgPO();
		aosOrgPO.copyProperties(inDto);
		aosOrgPO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
		
		// 生成语义ID
		AosOrgPO parentAosOrgPO = aosOrgDao.selectByKey(aosOrgPO.getParent_id_());
		String max_cascade_id_ = (String)sqlDao.selectOne("Org.getMaxCascadeId", aosOrgPO.getParent_id_());
		if (AOSUtils.isEmpty(max_cascade_id_)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentAosOrgPO)) {
				temp = parentAosOrgPO.getCascade_id_();
			}
			max_cascade_id_ = temp + ".000";
		}
		String cascade_id_ = SystemUtils.genCascadeTreeId(max_cascade_id_, 999);
		aosOrgPO.setCascade_id_(cascade_id_);
		
		aosOrgPO.setIs_leaf_(SystemCons.IS.YES);
		aosOrgPO.setCreate_by_(userModel.getId_());
		aosOrgPO.setCreate_time_(AOSUtils.getDateTime());
		aosOrgPO.setIs_del_(SystemCons.IS.NO);
		aosOrgDao.insert(aosOrgPO);
		
		//更新父节点的是否叶子节点字段
		AosOrgPO updatePO = new AosOrgPO();
		updatePO.setId_(aosOrgPO.getParent_id_());
		updatePO.setIs_leaf_(SystemCons.IS.NO);
		aosOrgDao.updateByKey(updatePO);
		
		httpModel.setOutMsg("部门新增成功。");
	}
	
	/**
	 * 修改部门
	 * 
	 * @param httpModel
	 * @return
	 */
	@Transactional
	public void updateOrg(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		AosOrgPO aosOrgPO = new AosOrgPO();
		aosOrgPO.copyProperties(inDto);
		aosOrgDao.updateByKey(aosOrgPO);
		httpModel.setOutMsg("部门修改成功。");
	}
	
	/**
	 * 删除部门
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void deleteOrg(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		String[] selectionIds = httpModel.getInDto().getRows();
		AosOrgPO aosOrgPO = (AosOrgPO)sqlDao.selectOne("Org.checkRootNode", Dtos.newDto("ids", StringUtils.join(selectionIds, ",")));
		if (AOSUtils.isNotEmpty(aosOrgPO)) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("操作失败，根节点[{0}]不能删除。", aosOrgPO.getName_()));
		}else {
			for (String id_ : selectionIds) {
				AosOrgPO delPO = aosOrgDao.selectByKey(id_); 
				if (AOSUtils.isEmpty(delPO)) {
					continue;
				}
				
				List<AosOrgPO> subDelList = aosOrgDao.like(Dtos.newDto("cascade_id_", delPO.getCascade_id_()));
				for (AosOrgPO subDelPO : subDelList) {
					//逻辑删除部门
					subDelPO.setIs_del_(SystemCons.IS.YES);
					aosOrgDao.updateByKey(subDelPO);
					//逻辑删除部门下辖的用户
					sqlDao.update("Org.updateUserInfoByOrgId", subDelPO.getId_());
				}
				
				//更需父节点的是否叶子节点属性
				Dto checkDto = Dtos.newDto("parent_id_", delPO.getParent_id_());
				checkDto.put("is_del_", SystemCons.IS.NO);
				if (aosOrgDao.rows(checkDto) == 0) {
					AosOrgPO updatePO = new AosOrgPO();
					updatePO.setId_(delPO.getParent_id_());
					updatePO.setIs_auto_expand_(SystemCons.IS.NO);
					updatePO.setIs_leaf_(SystemCons.IS.YES);
					aosOrgDao.updateByKey(updatePO);
				}
				
			}
			outDto.setAppMsg("成功删除部门数据。");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
}
