package cn.osworks.aos.demo.modules.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;

/**
 * 范例模块杂项服务
 * 
 * @author AHei
 */
@Service
public class MiscService {

	@Autowired
	private SqlDao sysDao;

	/**
	 * 存储过程调用1
	 * 
	 * @param request
	 * @param response
	 */
	@Transactional
	public Dto callProc1(Dto inDto) {
		sysDao.call("Demo.aos_proc_demo", inDto);
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
		sysDao.call("Demo.aos_proc_demo2", inDto);
		@SuppressWarnings("unchecked")
		List<Dto> outList = (List<Dto>) inDto.getList("cur_list_");
		// Oracle游标返回的结果集对象中的属性Key不能和其他sql一样通过拦截器统一转换为小写。所以如果前台需要小写的话，在这里显式转换一下。
		outList = AOSUtils.lowercaseDtos(outList);
		return outList;
	}

}
