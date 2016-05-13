package cn.osworks.aos.system.modules.service.workflow;

import java.util.List;

import org.activiti.engine.RuntimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

import com.google.common.collect.Lists;


/**
 * 流程实例服务
 * 
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class ProcInstService {

	@Autowired
	private RuntimeService runtimeServic;
	@Autowired
	private SqlDao sqlDao;
	
	/**
	 * 查询流程实例列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto>listProcInsts(Dto inDto){
/*		List<Dto> list = sqlDao.list("Workflow.listProcInstsPage", inDto);
		for (Dto dto : list) {
			if (AOSUtils.isEmpty(dto.getString("end_time_"))) {
				dto.put("procinst_status_", DicCons.PROCINST_STATUS_RUNNING);
			}else {
				dto.put("procinst_status_", DicCons.PROCINST_STATUS_COMPLETED);
				dto.put("suspension_state_", Integer.valueOf(DicCons.SUSPENSION_STATE_COMPLETED));
			}
		}*/
		return Lists.newArrayList();
	}

	/**
	 * 删除流程实例
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public Dto delProcInst(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		String ids[] = inDto.getRows();
		int del = 0;
		for (String id : ids) {
			runtimeServic.deleteProcessInstance(id, "管理员删除");			
			del++;
		}
		outDto.setAppMsg(AOSUtils.merge("操作完成，成功删除{0}条流程数据。", del));
		return outDto;
	}
}
