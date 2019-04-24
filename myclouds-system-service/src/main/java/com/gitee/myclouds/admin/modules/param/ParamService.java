package com.gitee.myclouds.admin.modules.param;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamMapper;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

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
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyParamEntity> myParamEntities = sqlSession.selectList("sql.param.pageParam",inDto);
		Integer total = sqlSession.selectOne("sql.param.pageParamCount", inDto);
		outDto.put("data", myParamEntities);
		outDto.put("recordsTotal", total);
		outDto.put("recordsFiltered", total);
		return JSON.toJSONString(outDto);
	}
	
	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public String get(Integer id) {
		MyParamEntity myParamEntity = myParamMapper.selectByKey(id);
		return JSON.toJSONString(myParamEntity);
	}

	/**
	 * 保存
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto) {
		Dto outDto = null;
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
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto update(Dto inDto) {
		Dto outDto = null;
		//拷贝参数对象中的属性到实体对象中
		MyParamEntity myParamEntity = new MyParamEntity().copyFrom(inDto);
		MyParamEntity oldEntity = myParamMapper.selectByKey(myParamEntity.getId());
		if (!StringUtils.equalsIgnoreCase(myParamEntity.getParam_key(), oldEntity.getParam_key())) {
			if (MyUtil.isNotEmpty(myParamMapper.selectByUkey1(myParamEntity.getParam_key()))) {
				outDto = Dtos.newDto().put2("code", "-1").put2("msg", "参数键已经存在，请重新输入...");
				return outDto;
			}
		}
		myParamMapper.updateByKey(myParamEntity);
		cacheCfgService.cacheParam(myParamEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "键值参数修改成功");
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
