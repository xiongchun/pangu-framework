package cn.osworks.aos.modules.system.service.resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_sequenceMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_sequencePO;
import cn.osworks.aos.web.misc.IdCons;


/**
 * <b>ID管理服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class IdMgrService {
	
	@Autowired
	private Aos_ge_sequenceMapper aos_ge_sequenceMapper;

	/**
	 * 保存ID信息
	 * 
	 * @param qDto
	 */
	public Dto saveId(Dto qDto) {
		Dto outDto = Dtos.newDto();
		Aos_ge_sequencePO aos_ge_sequencePO = new Aos_ge_sequencePO();
		aos_ge_sequencePO.setName_(qDto.getString("name_"));
		int rows = aos_ge_sequenceMapper.rows(aos_ge_sequencePO.toDto());
		if (rows > 0) {
			outDto.setAppCode(-1);
			outDto.setAppMsg("ID名称已存在，请修改。");
		}else {
			aos_ge_sequencePO.clear();
			AOSUtils.apply(qDto, aos_ge_sequencePO);
			aos_ge_sequencePO.setId_(AOSId.id(IdCons.GID));
			aos_ge_sequenceMapper.insert(aos_ge_sequencePO);
			outDto.setAppMsg("操作完成，ID新增成功。");
		}
		return outDto;
	}
	
	/**
	 * 修改参数信息
	 * 
	 * @param qDto
	 */
	public void updateId(Dto qDto) {
		Aos_ge_sequencePO aos_ge_sequencePO = new Aos_ge_sequencePO();
		AOSUtils.apply(qDto, aos_ge_sequencePO);
		aos_ge_sequenceMapper.updateByKey(aos_ge_sequencePO);
	}
	
	/**
	 * 删除参数数据
	 * 
	 * @param qDto
	 */
	public int deleteId(Dto qDto) {
		String[] selections = qDto.getSelection();
		int rows = 0;
		for (String aos_ge_sequencea0 : selections) {
			aos_ge_sequenceMapper.deleteByKey(aos_ge_sequencea0);
			rows++;
		}
		return rows;
	}
	
}
