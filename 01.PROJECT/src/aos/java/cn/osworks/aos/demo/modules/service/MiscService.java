package cn.osworks.aos.demo.modules.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;

/**
 * 范例模块杂项服务
 * 
 * @author AHei
 */
@Service
public class MiscService {

	@Autowired
	private SqlDao sqlDao;
	@Autowired 
	private Aos_sys_orgMapper aos_sys_orgMapper;
	
	/**
	 * 查询组织信息列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Aos_sys_orgPO> listOrgs(Dto inDto){
		//也可以调用自己写的SQL，也可以返回List<Dto>
		List<Aos_sys_orgPO> aos_sys_orgPOs = aos_sys_orgMapper.likePage(inDto);
		return aos_sys_orgPOs;
	}
	
	/**
	 * 查询组织信息列表
	 * 
	 * @param inDto
	 * @return
	 */
	public Aos_sys_orgPO getOrgInfo(Dto inDto){
		Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(inDto.getString("id_"));
		return aos_sys_orgPO;
	}
	
	/**
	 * 查询参数信息列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<Dto> listParams(Dto inDto){
		List<Dto> outList = sqlDao.list("MasterData.listParamInfos4Page", inDto);
		return outList;
	}

	/**
	 * 存储过程调用1
	 * 
	 * @param request
	 * @param response
	 */
	@Transactional
	public Dto callProc1(Dto inDto) {
		sqlDao.call("Demo.aos_proc_demo", inDto);
		// 入参和出参都包装在了inDto。直接返回即可。
		return inDto;
	}

	/**
	 * 存储过程调用2：返回游标结果集
	 * 
	 * @param request
	 * @param response
	 */
	@Transactional
	public List<Dto> callProc2(Dto inDto) {
		sqlDao.call("Demo.aos_proc_demo2", inDto);
		@SuppressWarnings("unchecked")
		List<Dto> outList = (List<Dto>) inDto.getList("cur_list_");
		// Oracle游标返回的结果集对象中的属性Key不能和其他sql一样通过拦截器统一转换为小写。所以如果前台需要小写的话，在这里显式转换一下。
		outList = AOSUtils.lowercaseDtos(outList);
		return outList;
	}

}
