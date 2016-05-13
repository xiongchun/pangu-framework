package cn.osworks.aos.system.modules.service.masterdata;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dicMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dic_indexMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_catalogPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dic_indexPO;


/**
 * <b>数据字典服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class DictionaryService {
	
	@Autowired
	private Aos_sys_dic_indexMapper aos_sys_dic_indexMapper;
	@Autowired
	private Aos_sys_catalogMapper aos_sys_catalogMapper;
	@Autowired
	private Aos_sys_dicMapper aos_sys_dicMapper;
	
	/**
	 * 保存数据字典索引信息
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto saveIndex(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String key_ = qDto.getString("key_");
		if (checkDicIndexUkey(key_)) {
			Aos_sys_dic_indexPO aos_sys_dic_indexPO = new Aos_sys_dic_indexPO();
			AOSUtils.copyProperties(qDto, aos_sys_dic_indexPO);
			aos_sys_dic_indexPO.setId_(AOSId.uuid());
			Aos_sys_catalogPO aos_sys_catalogPO = aos_sys_catalogMapper.selectByKey(aos_sys_dic_indexPO.getCatalog_id_());
			aos_sys_dic_indexPO.setCatalog_cascade_id_(aos_sys_catalogPO.getCascade_id_());
			aos_sys_dic_indexMapper.insert(aos_sys_dic_indexPO);
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
	@Transactional
	public Dto updateIndex(Dto qDto) {
		Dto outDto = Dtos.newDto();
		String key_ = qDto.getString("key_");
		Aos_sys_dic_indexPO check_aos_sys_dic_indexPO = aos_sys_dic_indexMapper.selectByKey(qDto.getString("id_"));
		if (!key_.equals(check_aos_sys_dic_indexPO.getKey_())) {
			if (!checkDicIndexUkey(key_)) {
				outDto.setAppCode(AOSCons.ERROR);
				outDto.setAppMsg(AOSUtils.merge("字典标识{0}已经存在，请重新输入。", key_));
				return outDto;
			}
		}
		Aos_sys_dic_indexPO aos_sys_dic_indexPO = new Aos_sys_dic_indexPO();
		AOSUtils.copyProperties(qDto, aos_sys_dic_indexPO);
		Aos_sys_catalogPO aos_sys_catalogPO = aos_sys_catalogMapper.selectByKey(aos_sys_dic_indexPO.getCatalog_id_());
		aos_sys_dic_indexPO.setCatalog_cascade_id_(aos_sys_catalogPO.getCascade_id_());
		aos_sys_dic_indexMapper.updateByKey(aos_sys_dic_indexPO);
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
		int rows = aos_sys_dic_indexMapper.rows(pDto);
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
	@Transactional
	public void saveDic(Dto qDto) {
		Aos_sys_dicPO aos_sys_dicPO = new Aos_sys_dicPO();
		AOSUtils.copyProperties(qDto, aos_sys_dicPO);
		aos_sys_dicPO.setId_(AOSId.uuid());
		if (AOSUtils.isEmpty(aos_sys_dicPO.getStatus_())) {
			aos_sys_dicPO.setStatus_(AOSCons.NO);
		}
		aos_sys_dicPO.println();
		aos_sys_dicMapper.insert(aos_sys_dicPO);
	}
	
	/**
	 * 修改数据字典对照信息
	 * 
	 * @param qDto
	 */
	@Transactional
	public void updateDic(Dto qDto) {
		Aos_sys_dicPO aos_sys_dicPO = new Aos_sys_dicPO();
		AOSUtils.copyProperties(qDto, aos_sys_dicPO);
		aos_sys_dicMapper.updateByKey(aos_sys_dicPO);
	}
	
	/**
	 * 删除数据字典索引数据
	 * 
	 * @param qDto
	 */
	@Transactional
	public int deleteIndex(Dto qDto) {
		String[] selections = qDto.getRows();
		int rows = 0;
		Dto pDto = Dtos.newDto();
		for (String dic_index_id_ : selections) {
			pDto.put("dic_index_id_", dic_index_id_);
			List<Aos_sys_dicPO> dicList = aos_sys_dicMapper.list(pDto);
			for (Aos_sys_dicPO aos_sys_dicPO : dicList) {
				aos_sys_dicMapper.deleteByKey(aos_sys_dicPO.getId_());
			}
			aos_sys_dic_indexMapper.deleteByKey(dic_index_id_);
			rows++;
		}
		return rows;
	}
	
	/**
	 * 删除数据字典对照数据
	 * 
	 * @param qDto
	 */
	@Transactional
	public int deleteDic(Dto qDto) {
		String[] selections = qDto.getRows();
		int rows = 0;
		for (String id_ : selections) {
			aos_sys_dicMapper.deleteByKey(id_);
			rows++;
		}
		return rows;
	}

}
