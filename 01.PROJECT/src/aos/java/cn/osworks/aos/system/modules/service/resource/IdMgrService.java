package cn.osworks.aos.system.modules.service.resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_sequenceMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_sequencePO;


/**
 * <b>ID管理服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class IdMgrService {
	
	@Autowired
	private Aos_sys_sequenceMapper aos_sys_sequenceMapper;

	/**
	 * 保存ID信息
	 * 
	 * @param qDto
	 */
	@Transactional
	public Dto saveId(Dto qDto) {
		Dto outDto = Dtos.newDto();
		Aos_sys_sequencePO aos_sys_sequencePO = new Aos_sys_sequencePO();
		aos_sys_sequencePO.setName_(qDto.getString("name_"));
		int rows = aos_sys_sequenceMapper.rows(aos_sys_sequencePO.toDto());
		if (rows > 0) {
			outDto.setAppCode(-1);
			outDto.setAppMsg("ID名称已存在，请修改。");
		}else {
			aos_sys_sequencePO.clear();
			AOSUtils.copyProperties(qDto, aos_sys_sequencePO);
			aos_sys_sequencePO.setId_(AOSId.uuid());
			aos_sys_sequenceMapper.insert(aos_sys_sequencePO);
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
		Aos_sys_sequencePO aos_sys_sequencePO = new Aos_sys_sequencePO();
		AOSUtils.copyProperties(qDto, aos_sys_sequencePO);
		aos_sys_sequenceMapper.updateByKey(aos_sys_sequencePO);
	}
	
	/**
	 * 删除参数数据
	 * 
	 * @param qDto
	 */
	@Transactional
	public int deleteId(Dto qDto) {
		String[] selections = qDto.getRows();
		int rows = 0;
		for (String aos_sys_sequencea0 : selections) {
			aos_sys_sequenceMapper.deleteByKey(aos_sys_sequencea0);
			rows++;
		}
		return rows;
	}
	
}
