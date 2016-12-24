package aos.system.modules.module;

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
import aos.system.common.utils.SystemCons;
import aos.system.common.utils.SystemUtils;
import aos.system.dao.AosModuleDao;
import aos.system.dao.AosModulePO;
import aos.system.modules.cache.CacheUserDataService;

/**
 * 模块管理
 * 
 * @author xiongchun
 *
 */
@Service
public class ModuleService extends AOSBaseService {

	@Autowired
	private AosModuleDao aosModuleDao;
	@Autowired
	private CacheUserDataService cacheUserDataService;

	/**
	 * 模块管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		AosModulePO aosModulePO = aosModuleDao.selectOne(Dtos.newDto("parent_id_", SystemCons.ROOTNODE_PARENT_ID));
		httpModel.setAttribute("rootPO", aosModulePO);
		httpModel.setViewPath("system/module.jsp");
	}

	/**
	 * 获取模块导航树
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getTreeData(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		inDto.setOrder("sort_no_");
		List<AosModulePO> aosModulePOs = aosModuleDao.list(inDto);
		List<Dto> modelDtos = Lists.newArrayList();
		for (AosModulePO aosModulePO : aosModulePOs) {
			modelDtos.add(aosModulePO.toDto());
		}
		String treeJson = SystemUtils.toTreeModalAsyncLoad(modelDtos);
		httpModel.setOutMsg(treeJson);
	}

	/**
	 * 查询功能模块列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listModules(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		List<Dto> moduleDtos = sqlDao.list("Module.listModulesPage", qDto);
		httpModel.setOutMsg(AOSJson.toGridJson(moduleDtos, qDto.getPageTotal()));
	}

	/**
	 * 保存功能模块
	 * 
	 * @param httpModel
	 * @return
	 */
	@Transactional
	public void saveModule(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		AosModulePO aosModulePO = new AosModulePO();
		aosModulePO.copyProperties(inDto);
		aosModulePO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
		
		// 生成语义ID
		AosModulePO parentAosModulePO = aosModuleDao.selectByKey(aosModulePO.getParent_id_());
		String max_cascade_id_ = (String)sqlDao.selectOne("Module.getMaxCascadeId", aosModulePO.getParent_id_());
		if (AOSUtils.isEmpty(max_cascade_id_)) {
			String temp = "0";
			if (AOSUtils.isNotEmpty(parentAosModulePO)) {
				temp = parentAosModulePO.getCascade_id_();
			}
			max_cascade_id_ = temp + ".000";
		}
		String cascade_id_ = SystemUtils.genCascadeTreeId(max_cascade_id_, 999);
		aosModulePO.setCascade_id_(cascade_id_);
		
		aosModulePO.setIs_leaf_(SystemCons.IS.YES);
		//对关键字段入库前的trim处理
		aosModulePO.setUrl_(StringUtils.trim(aosModulePO.getUrl_()));
		aosModuleDao.insert(aosModulePO);
		
		//更新父节点的是否叶子节点字段
		AosModulePO updatePO = new AosModulePO();
		updatePO.setId_(aosModulePO.getParent_id_());
		updatePO.setIs_leaf_(SystemCons.IS.NO);
		aosModuleDao.updateByKey(updatePO);
		
		httpModel.setOutMsg("功能模块新增成功。");
	}
	
	/**
	 * 修改功能模块
	 * 
	 * @param httpModel
	 * @return
	 */
	@Transactional
	public void updateModule(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		AosModulePO aosModulePO = new AosModulePO();
		aosModulePO.copyProperties(inDto);
		aosModuleDao.updateByKey(aosModulePO);
		//重置和这个模块相关的授权缓存信息
		resetUserGrantWhenModuleChange(aosModulePO.getId_());
		httpModel.setOutMsg("功能模块修改成功。");
	}
	
	/**
	 * 删除功能模块
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void deleteModule(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		String[] selectionIds = httpModel.getInDto().getRows();
		AosModulePO aosModulePO = (AosModulePO)sqlDao.selectOne("Module.checkRootNode", Dtos.newDto("ids", StringUtils.join(selectionIds, ",")));
		if (AOSUtils.isNotEmpty(aosModulePO)) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("操作失败，根节点[{0}]不能删除。", aosModulePO.getName_()));
		}else {
			for (String id_ : selectionIds) {
				AosModulePO delPO = aosModuleDao.selectByKey(id_); 
				if (AOSUtils.isEmpty(delPO)) {
					continue;
				}
				
				List<AosModulePO> subDelList = aosModuleDao.like(Dtos.newDto("cascade_id_", delPO.getCascade_id_()));
				for (AosModulePO subDelPO : subDelList) {
					aosModuleDao.deleteByKey(subDelPO.getId_());
					//重置和这个模块相关的授权缓存信息
					resetUserGrantWhenModuleChange(subDelPO.getId_());
				}
				
				//更需父节点的是否叶子节点属性
				if (aosModuleDao.rows(Dtos.newDto("parent_id_", delPO.getParent_id_())) == 0) {
					AosModulePO updatePO = new AosModulePO();
					updatePO.setId_(delPO.getParent_id_());
					updatePO.setIs_auto_expand_(SystemCons.IS.NO);
					updatePO.setIs_leaf_(SystemCons.IS.YES);
					aosModuleDao.updateByKey(updatePO);
				}
				
			}
			outDto.setAppMsg("成功删除功能模块数据。");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
	/**
	 * 当模块数据变更时重置用户授权信息
	 * 
	 * @param moduleId
	 */
	private void resetUserGrantWhenModuleChange(String moduleId){
		List<String> userList = sqlDao.list("Module.listUsersDependOnModule", Dtos.newDto("module_id_", moduleId));
		for (String userId : userList) {
			cacheUserDataService.resetGrantInfoOfUser(userId);
		}
	}

}
