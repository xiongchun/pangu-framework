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
	 * 查询参数列表
	 * 
	 * @param inDto
	 * @return
	 */
	public String listAll(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyParamEntity> myParamEntities = myParamMapper.list(inDto);
		outDto.put("data", myParamEntities);
		outDto.put("recordsTotal", myParamEntities.size());
		outDto.put("recordsFiltered", myParamEntities.size());
		return JSON.toJSONString(outDto);
	}

	/**
	 * 保存参数信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto saveParam(Dto inDto) {
		Dto outDto = null;
		MyParamEntity myParamEntity = new MyParamEntity().copyFrom(inDto);
		if (MyUtil.isEmpty(myParamMapper.selectByUkey1(myParamEntity.getParam_key()))) {
			myParamMapper.insert(myParamEntity);
			cacheCfgService.cacheParam(myParamEntity);
			outDto = Dtos.newPlainDto("code:1", "msg:键值参数保存成功");
		} else {
			outDto = Dtos.newPlainDto("code:-1", "msg:参数键已经存在，请重新输入...");
		}
		return outDto;
	}

	/**
	 * 删除参数信息
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto deleteParam(Dto inDto) {
		Dto outDto = null;
		myParamMapper.deleteByKey(inDto.getInteger("id"));
		cacheCfgService.deleteParamFromCache(inDto.getString("param_key"));
		outDto = Dtos.newPlainDto("code:1", "msg:键值参数删除成功");
		return outDto;
	}

}
