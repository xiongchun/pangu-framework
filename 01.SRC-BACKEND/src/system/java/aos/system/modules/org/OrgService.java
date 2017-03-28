package aos.system.modules.org;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.framework.core.dao.SqlDao;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.common.id.IdService;
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
public class OrgService {
	
	@Autowired
	private AosOrgDao aosOrgDao;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private IdService idService;	
	
	/**
	 * 部门管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		AosOrgPO aosOrgPO = aosOrgDao.selectOne(Dtos.newDto("parent_id", SystemCons.ROOTNODE_PARENT_ID));
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
		inDto.setOrder("sort_no");
		inDto.put("is_del", SystemCons.IS.NO);
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
		qDto.put("is_del", SystemCons.IS.NO);
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
		aosOrgPO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
		
		// 生成语义ID
		AosOrgPO parentAosOrgPO = aosOrgDao.selectByKey(aosOrgPO.getParent_id());
		String max_cascade_id = (String)sqlDao.selectOne("Org.getMaxCascadeId", aosOrgPO.getParent_id());
		if (AOSUtils.isEmpty(max_cascade_id)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentAosOrgPO)) {
				temp = parentAosOrgPO.getCascade_id();
			}
			max_cascade_id = temp + ".000";
		}
		String cascade_id = SystemUtils.genCascadeTreeId(max_cascade_id, 999);
		aosOrgPO.setCascade_id(cascade_id);
		
		aosOrgPO.setIs_leaf(SystemCons.IS.YES);
		aosOrgPO.setCreate_by(userModel.getId());
		aosOrgPO.setCreate_time(AOSUtils.getDateTime());
		aosOrgPO.setIs_del(SystemCons.IS.NO);
		aosOrgDao.insert(aosOrgPO);
		
		//更新父节点的是否叶子节点字段
		AosOrgPO updatePO = new AosOrgPO();
		updatePO.setId(aosOrgPO.getParent_id());
		updatePO.setIs_leaf(SystemCons.IS.NO);
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
			outDto.setAppMsg(AOSUtils.merge("操作失败，根节点[{0}]不能删除。", aosOrgPO.getName()));
		}else {
			for (String id : selectionIds) {
				AosOrgPO delPO = aosOrgDao.selectByKey(Integer.valueOf(id)); 
				if (AOSUtils.isEmpty(delPO)) {
					continue;
				}
				
				List<AosOrgPO> subDelList = aosOrgDao.like(Dtos.newDto("cascade_id", delPO.getCascade_id()));
				for (AosOrgPO subDelPO : subDelList) {
					//逻辑删除部门
					subDelPO.setIs_del(SystemCons.IS.YES);
					aosOrgDao.updateByKey(subDelPO);
					//逻辑删除部门下辖的用户
					sqlDao.update("Org.updateUserInfoByOrgId", subDelPO.getId());
				}
				
				//更需父节点的是否叶子节点属性
				Dto checkDto = Dtos.newDto("parent_id", delPO.getParent_id());
				checkDto.put("is_del", SystemCons.IS.NO);
				if (aosOrgDao.rows(checkDto) == 0) {
					AosOrgPO updatePO = new AosOrgPO();
					updatePO.setId(delPO.getParent_id());
					updatePO.setIs_auto_expand(SystemCons.IS.NO);
					updatePO.setIs_leaf(SystemCons.IS.YES);
					aosOrgDao.updateByKey(updatePO);
				}
				
			}
			outDto.setAppMsg("成功删除部门数据。");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
}
