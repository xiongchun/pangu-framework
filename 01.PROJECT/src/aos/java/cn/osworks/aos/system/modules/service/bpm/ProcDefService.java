package cn.osworks.aos.system.modules.service.bpm;

import java.util.List;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_wf_procdefMapper;
import cn.osworks.aos.system.dao.mapper.Aos_act_re_procdefMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_wf_procdefPO;
import cn.osworks.aos.system.dao.po.Aos_act_re_procdefPO;


/**
 * 流程定义服务
 * 
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class ProcDefService {
	
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private SqlDao sysDao;
	@Autowired
	private Aos_act_re_procdefMapper aos_act_re_procdefMapper;
	@Autowired
	private Aos_sys_wf_procdefMapper aos_sys_wf_procdefMapper;
	
    /**
     * 查询流程定义列表
     *
     * @param request
     * @param response
     */
    public List<Dto> listProcdefs(Dto inDto) {
        List<Dto> list = sysDao.list("Bpm.listProcDefsPage", inDto);
        return list;
    }
	
	/**
	 * 删除流程定义
	 *
	 * @param inDto
	 */
	//TODO 需要完善常规删除和级联删除的用户交互逻辑 常规删除时候自动检测并跳过不能删除的数据
    @Transactional
	public Dto delProcDef(Dto inDto) {
		Dto outDto = Dtos.newOutDto();
		String ids[] = inDto.getRows();
		int del = 0;
		//是否强制级联删除
		boolean cascade = false; 
		if (StringUtils.equals(AOSCons.YES, inDto.getString("cascade"))) {
			cascade = true;
		}
		for (String id_ : ids) {
			Aos_sys_wf_procdefPO aos_sys_wf_procdefPO = aos_sys_wf_procdefMapper.selectByKey(id_);
	        ProcessDefinition processDefinition = repositoryService.getProcessDefinition(aos_sys_wf_procdefPO.getProc_def_id_());
	        //级联强制删除
	        repositoryService.deleteDeployment(processDefinition.getDeploymentId(), cascade);
	        //删除扩展表
	        aos_sys_wf_procdefMapper.deleteByKey(id_);
	        del++;
		}
		outDto.setAppMsg(AOSUtils.merge("操作完成，成功删除{0}条流程数据。", del));
		return outDto;
	}
	
	/**
	 * 更新流程基本属性
	 * 
	 * @param inDto
	 */
	public void updateProcProps(Dto inDto) {
		Aos_act_re_procdefPO aos_act_re_procdefPO = new Aos_act_re_procdefPO();
		AOSUtils.copyProperties(inDto, aos_act_re_procdefPO);
		aos_act_re_procdefMapper.updateByKey(aos_act_re_procdefPO);
	}

}
