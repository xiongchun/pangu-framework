package com.gitee.myclouds.admin.modules.param;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamMapper;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;
import com.gitee.myclouds.toolbox.util.MyUtil;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 键值参数服务
 * 
 * @author xiongchun
 *
 */
@Service
public class ParamService {

	@Autowired
	private MyParamMapper myParamMapper;
	@Autowired
	private CacheCfgService cacheCfgService;

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyParamEntity> myParamEntities = myParamMapper.list(inDto);
		outDto.put("data", myParamEntities);
		outDto.put("recordsTotal", myParamEntities.size());
		outDto.put("recordsFiltered", myParamEntities.size());
		return JSON.toJSONString(outDto);
	}

	/**
	 * 保存
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto) {
		Dto outDto = null;
		//拷贝参数对象中的属性到实体对象中
		MyParamEntity myParamEntity = new MyParamEntity().copyFrom(inDto);
		if (MyUtil.isEmpty(myParamMapper.selectByUkey1(myParamEntity.getParam_key()))) {
			myParamMapper.insert(myParamEntity);
			cacheCfgService.cacheParam(myParamEntity);
			outDto = Dtos.newDto().put2("code", "1").put2("msg", "键值参数保存成功");
		} else {
			outDto = Dtos.newDto().put2("code", "-1").put2("msg", "参数键已经存在，请重新输入...");
		}
		return outDto;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		myParamMapper.deleteByKey(inDto.getInteger("id"));
		cacheCfgService.deleteParamFromCache(inDto.getString("param_key"));
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "参数键删除成功");
		return outDto;
	}

}
