package aos.system.modules.masterdata;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import aos.framework.core.cache.CacheMasterDataService;
import aos.framework.core.id.AOSId;
import aos.framework.core.service.AOSBaseService;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.Aos_dicDao;
import aos.framework.dao.Aos_dicPO;
import aos.framework.dao.Aos_paramsDao;
import aos.framework.dao.Aos_paramsPO;
import aos.framework.web.router.HttpModel;
import aos.system.common.utils.SystemCons;

/**
 * 基础数据管理
 * 
 * @author xiongchun
 *
 */
@Service
public class MasterDataService extends AOSBaseService{
	
	@Autowired
	private Aos_paramsDao aos_paramsDao;
	@Autowired
	private Aos_dicDao aos_dicDao;
	@Autowired
	private CacheMasterDataService cacheMasterDataService;

	/**
	 * 键值参数管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initParam(HttpModel httpModel) {

		httpModel.setViewPath("system/param.jsp");
	}
	
	/**
	 * 数据字典管理页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initDictionary(HttpModel httpModel) {

		httpModel.setViewPath("system/dictionary.jsp");
	}
	
	/**
	 * 查询键值参数列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listParam(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		List<Dto> paramDtos = sqlDao.list("MasterData.listParamInfosPage", qDto);
		httpModel.setOutMsg(AOSJson.toGridJson(paramDtos, qDto.getPageTotal()));
	}
	
	/**
	 * 保存键值参数
	 * 
	 * @param httpModel
	 * @return
	 */
	public void saveParam(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		Dto inDto = httpModel.getInDto();
		if (aos_paramsDao.rows(Dtos.newDto("key_", inDto.getString("key_"))) > 0) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("操作失败，键[{0}]已经存在。", inDto.getString("key_")));
		}else {
			Aos_paramsPO aos_paramsPO = new Aos_paramsPO();
			aos_paramsPO.copyProperties(inDto);
			aos_paramsPO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
			aos_paramsDao.insert(aos_paramsPO);
			cacheMasterDataService.cacheParamOption(aos_paramsPO.getKey_(), aos_paramsPO.getValue_());
			outDto.setAppMsg("键值参数新增成功");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改键值参数
	 * 
	 * @param httpModel
	 * @return
	 */
	public void updateParam(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		Dto inDto = httpModel.getInDto();
		Aos_paramsPO aos_paramsOldPO = aos_paramsDao.selectByKey(inDto.getString("id_"));
		if (!StringUtils.equals(aos_paramsOldPO.getKey_(), inDto.getString("key_"))) {
			if (aos_paramsDao.rows(Dtos.newDto("key_", inDto.getString("key_"))) > 0) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("操作失败，键[{0}]已经存在。", inDto.getString("key_")));
			}
		}
		if (StringUtils.equals(outDto.getAppCode(), SystemCons.SUCCESS)) {
			Aos_paramsPO aos_paramsPO = new Aos_paramsPO();
			aos_paramsPO.copyProperties(inDto);
			aos_paramsDao.updateByKey(aos_paramsPO);
			cacheMasterDataService.cacheParamOption(aos_paramsPO.getKey_(), aos_paramsPO.getValue_());
			outDto.setAppMsg("键值参数修改成功");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
	/**
	 * 删除参数数据
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void deleteParam(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		int rows = 0;
		for (String id_ : selectionIds) {
			Aos_paramsPO aos_paramsPO = aos_paramsDao.selectByKey(id_);
			aos_paramsDao.deleteByKey(id_);
			cacheMasterDataService.delParamOption(aos_paramsPO.getKey_());
			rows++;
		}
		httpModel.setOutMsg(AOSUtils.merge("操作成功，成功删除[{0}]条参数数据。", rows));
	}
	
	/**
	 * 查询字典列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listDic(HttpModel httpModel) {
		Dto qDto = httpModel.getInDto();
		List<Dto> paramDtos = sqlDao.list("MasterData.listDicsPage", qDto);
		httpModel.setOutMsg(AOSJson.toGridJson(paramDtos, qDto.getPageTotal()));
	}
	
	/**
	 * 保存字典
	 * 
	 * @param httpModel
	 * @return
	 */
	public void saveDic(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		Dto inDto = httpModel.getInDto();
		Dto checkDto = Dtos.newDto("key_", inDto.getString("key_"));
		checkDto.put("code_", inDto.getString("code_"));
		if (aos_dicDao.rows(checkDto) > 0) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("操作失败，字典[{0}]的代码对照[{1}]已经存在。", inDto.getString("key_"), inDto.getString("code_")));
		}else {
			Aos_dicPO aos_dicPO = new Aos_dicPO();
			aos_dicPO.copyProperties(inDto);
			aos_dicPO.setId_(AOSId.appId(SystemCons.ID.SYSTEM));
			aos_dicDao.insert(aos_dicPO);
			cacheMasterDataService.cacheDic(aos_dicPO);
			outDto.setAppMsg("数据字典新增成功。");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改字典
	 * 
	 * @param httpModel
	 * @return
	 */
	public void updateDic(HttpModel httpModel) {
		Dto outDto = Dtos.newOutDto();
		Dto inDto = httpModel.getInDto();
		Aos_dicPO aos_dicOldPO = aos_dicDao.selectByKey(inDto.getString("id_"));
		if (!StringUtils.equals(aos_dicOldPO.getCode_(), inDto.getString("code_"))) {
			Dto checkDto = Dtos.newDto("key_", inDto.getString("key_"));
			checkDto.put("code_", inDto.getString("code_"));
			if (aos_dicDao.rows(checkDto) > 0) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("操作失败，字典[{0}]的代码对照[{1}]已经存在。", inDto.getString("key_"), inDto.getString("code_")));
			}
		}else {
			Aos_dicPO aos_dicPO = new Aos_dicPO();
			aos_dicPO.copyProperties(inDto);
			aos_dicDao.updateByKey(aos_dicPO);
			cacheMasterDataService.cacheDic(aos_dicPO);
			outDto.setAppMsg("数据字典修改成功。");
		}
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
	/**
	 * 删除字典
	 * 
	 * @param httpModel
	 */
	public void deleteDic(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		int rows = 0;
		for (String id_ : selectionIds) {
			Aos_dicPO aos_dicPO = aos_dicDao.selectByKey(id_);
			aos_dicDao.deleteByKey(id_);
			cacheMasterDataService.delDic(aos_dicPO);
			rows++;
		}
		httpModel.setOutMsg(AOSUtils.merge("操作成功，成功删除[{0}]条字典数据。", rows));
	}
	
}
