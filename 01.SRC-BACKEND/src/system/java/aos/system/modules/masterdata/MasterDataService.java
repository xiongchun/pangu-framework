package aos.system.modules.masterdata;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import aos.framework.core.cache.CacheMasterDataService;
import aos.framework.core.dao.SqlDao;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.AosDicDao;
import aos.framework.dao.AosParamsDao;
import aos.framework.dao.po.AosDicPO;
import aos.framework.dao.po.AosParamsPO;
import aos.framework.web.router.HttpModel;
import aos.system.common.id.IdService;
import aos.system.common.utils.SystemCons;

/**
 * 基础数据管理
 * 
 * @author xiongchun
 *
 */
@Service
public class MasterDataService{
	
	@Autowired
	private AosParamsDao aosParamsDao;
	@Autowired
	private AosDicDao aosDicDao;
	@Autowired
	private CacheMasterDataService cacheMasterDataService;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private IdService idService;

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
		if (aosParamsDao.rows(Dtos.newDto("params_key", inDto.getString("params_key"))) > 0) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("操作失败，键[{0}]已经存在。", inDto.getString("params_key")));
		}else {
			AosParamsPO aos_paramsPO = new AosParamsPO();
			aos_paramsPO.copyProperties(inDto);
			aos_paramsPO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
			aosParamsDao.insert(aos_paramsPO);
			cacheMasterDataService.cacheParamOption(aos_paramsPO.getParams_key(), aos_paramsPO.getValue());
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
		AosParamsPO aos_paramsOldPO = aosParamsDao.selectByKey(inDto.getInteger("id"));
		if (!StringUtils.equals(aos_paramsOldPO.getParams_key(), inDto.getString("params_key"))) {
			if (aosParamsDao.rows(Dtos.newDto("params_key", inDto.getString("params_key"))) > 0) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("操作失败，键[{0}]已经存在。", inDto.getString("params_key")));
			}
		}
		if (StringUtils.equals(outDto.getAppCode(), SystemCons.SUCCESS)) {
			AosParamsPO aos_paramsPO = new AosParamsPO();
			aos_paramsPO.copyProperties(inDto);
			aosParamsDao.updateByKey(aos_paramsPO);
			cacheMasterDataService.cacheParamOption(aos_paramsPO.getParams_key(), aos_paramsPO.getValue());
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
		for (String id : selectionIds) {
			AosParamsPO aos_paramsPO = aosParamsDao.selectByKey(Integer.valueOf(id));
			aosParamsDao.deleteByKey(Integer.valueOf(id));
			cacheMasterDataService.delParamOption(aos_paramsPO.getParams_key());
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
		Dto checkDto = Dtos.newDto("dic_key", inDto.getString("dic_key"));
		checkDto.put("code", inDto.getString("code"));
		if (aosDicDao.rows(checkDto) > 0) {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("操作失败，字典[{0}]的代码对照[{1}]已经存在。", inDto.getString("dic_key"), inDto.getString("code")));
		}else {
			AosDicPO aos_dicPO = new AosDicPO();
			aos_dicPO.copyProperties(inDto);
			aos_dicPO.setId(idService.nextValue(SystemCons.SEQ.SEQ_SYSTEM).intValue());
			aosDicDao.insert(aos_dicPO);
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
		AosDicPO aos_dicOldPO = aosDicDao.selectByKey(inDto.getInteger("id"));
		if (!StringUtils.equals(aos_dicOldPO.getCode(), inDto.getString("code"))) {
			Dto checkDto = Dtos.newDto("dic_key", inDto.getString("dic_key"));
			checkDto.put("code", inDto.getString("code"));
			if (aosDicDao.rows(checkDto) > 0) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("操作失败，字典[{0}]的代码对照[{1}]已经存在。", inDto.getString("dic_key"), inDto.getString("code")));
			}
		}else {
			AosDicPO aos_dicPO = new AosDicPO();
			aos_dicPO.copyProperties(inDto);
			aosDicDao.updateByKey(aos_dicPO);
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
		for (String id : selectionIds) {
			AosDicPO aos_dicPO = aosDicDao.selectByKey(Integer.valueOf(id));
			aosDicDao.deleteByKey(Integer.valueOf(id));
			cacheMasterDataService.delDic(aos_dicPO);
			rows++;
		}
		httpModel.setOutMsg(AOSUtils.merge("操作成功，成功删除[{0}]条字典数据。", rows));
	}
	
}
