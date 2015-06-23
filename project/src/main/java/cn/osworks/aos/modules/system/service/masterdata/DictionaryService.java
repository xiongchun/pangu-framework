package cn.osworks.aos.modules.system.service.masterdata;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_catalogMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_dicMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_dic_indexMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_catalogPO;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_dicPO;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_dic_indexPO;
import cn.osworks.aos.web.misc.IdCons;


/**
 * <b>数据字典服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class DictionaryService {
	
	@Autowired
	private Aos_ge_dic_indexMapper aos_ge_dic_indexMapper;
	@Autowired
	private Aos_ge_catalogMapper aos_ge_catalogMapper;
	@Autowired
	private Aos_ge_dicMapper aos_ge_dicMapper;
	
	/**
	 * 保存数据字典索引信息
	 * 
	 * @param qDto
	 */
	public Dto saveIndex(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String key_ = qDto.getString("key_");
		if (checkDicIndexUkey(key_)) {
			Aos_ge_dic_indexPO aos_ge_dic_indexPO = new Aos_ge_dic_indexPO();
			AOSUtils.apply(qDto, aos_ge_dic_indexPO);
			aos_ge_dic_indexPO.setId_(AOSId.id(IdCons.GID));
			Aos_ge_catalogPO aos_ge_catalogPO = aos_ge_catalogMapper.selectByKey(aos_ge_dic_indexPO.getCatalog_id_());
			aos_ge_dic_indexPO.setCatalog_cascade_id_(aos_ge_catalogPO.getCascade_id_());
			aos_ge_dic_indexMapper.insert(aos_ge_dic_indexPO);
			outDto.setAppCode(AOSCons.SUCCESS);
			outDto.setAppMsg("操作完成，数据字典新增成功。");
		}else {
			outDto.setAppCode(AOSCons.ERROR);
			outDto.setAppMsg(AOSUtils.merge("字典标识{0}已经存在，请重新输入。", key_));
		}
		return outDto;
	}
	
	/**
	 * 修改数据字典索引信息
	 * 
	 * @param qDto
	 */
	public Dto updateIndex(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String key_ = qDto.getString("key_");
		Aos_ge_dic_indexPO check_aos_ge_dic_indexPO = aos_ge_dic_indexMapper.selectByKey(qDto.getString("id_"));
		if (!key_.equals(check_aos_ge_dic_indexPO.getKey_())) {
			if (!checkDicIndexUkey(key_)) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("字典标识{0}已经存在，请重新输入。", key_));
				return outDto;
			}
		}
		Aos_ge_dic_indexPO aos_ge_dic_indexPO = new Aos_ge_dic_indexPO();
		AOSUtils.apply(qDto, aos_ge_dic_indexPO);
		Aos_ge_catalogPO aos_ge_catalogPO = aos_ge_catalogMapper.selectByKey(aos_ge_dic_indexPO.getCatalog_id_());
		aos_ge_dic_indexPO.setCatalog_cascade_id_(aos_ge_catalogPO.getCascade_id_());
		aos_ge_dic_indexMapper.updateByKey(aos_ge_dic_indexPO);
		outDto.setAppCode(AOSCons.SUCCESS);
		outDto.setAppMsg("操作完成，数据字典修改成功。");
		return outDto;
	}
	
	/**
	 * 检查数据字典唯一性
	 * 
	 * @param key_
	 * @return Boolean 是否唯一
	 */
	private Boolean checkDicIndexUkey(String key_){
		Boolean outBoolean = true;
		Dto pDto = Dtos.newDto();
		pDto.put("key_", key_);
		int rows = aos_ge_dic_indexMapper.rows(pDto);
		if (rows >= 1) {
			outBoolean =  false;
		}
		return outBoolean;
	}
	
	/**
	 * 保存数据字典对照信息
	 * 
	 * @param qDto
	 */
	public void saveDic(Dto qDto) {
		Aos_ge_dicPO aos_ge_dicPO = new Aos_ge_dicPO();
		AOSUtils.apply(qDto, aos_ge_dicPO);
		aos_ge_dicPO.setId_(AOSId.id(IdCons.GID));
		if (AOSUtils.isEmpty(aos_ge_dicPO.getStatus_())) {
			aos_ge_dicPO.setStatus_(AOSCons.NO);
		}
		aos_ge_dicPO.println();
		aos_ge_dicMapper.insert(aos_ge_dicPO);
	}
	
	/**
	 * 修改数据字典对照信息
	 * 
	 * @param qDto
	 */
	public void updateDic(Dto qDto) {
		Aos_ge_dicPO aos_ge_dicPO = new Aos_ge_dicPO();
		AOSUtils.apply(qDto, aos_ge_dicPO);
		aos_ge_dicMapper.updateByKey(aos_ge_dicPO);
	}
	
	/**
	 * 删除数据字典索引数据
	 * 
	 * @param qDto
	 */
	public int deleteIndex(Dto qDto) {
		String[] selections = qDto.getSelection();
		int rows = 0;
		Dto pDto = Dtos.newDto();
		for (String dic_index_id_ : selections) {
			pDto.put("dic_index_id_", dic_index_id_);
			List<Aos_ge_dicPO> dicList = aos_ge_dicMapper.list(pDto);
			for (Aos_ge_dicPO aos_ge_dicPO : dicList) {
				aos_ge_dicMapper.deleteByKey(aos_ge_dicPO.getId_());
			}
			aos_ge_dic_indexMapper.deleteByKey(dic_index_id_);
			rows++;
		}
		return rows;
	}
	
	/**
	 * 删除数据字典对照数据
	 * 
	 * @param qDto
	 */
	public int deleteDic(Dto qDto) {
		String[] selections = qDto.getSelection();
		int rows = 0;
		for (String id_ : selections) {
			aos_ge_dicMapper.deleteByKey(id_);
			rows++;
		}
		return rows;
	}

}
