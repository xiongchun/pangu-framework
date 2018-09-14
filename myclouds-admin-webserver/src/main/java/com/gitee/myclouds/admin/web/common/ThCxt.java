package com.gitee.myclouds.admin.web.common;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.common.MyCxt;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.ModuleVO;
import com.google.common.collect.Lists;

/**
 * Thymeleaf模版引擎上下文
 * 
 * <p>提示：此类仅提供模版文件中调用后台服务使用
 * 
 * @author xiongchun
 *
 */
@Service
public class ThCxt {
	
	@Autowired
	private MyCxt myCxt;
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	/**
	 * 获取键值参数值
	 * 
	 * @param paramKey
	 * @return
	 */
	public String param(String paramKey) {
		return myCxt.getParamValue(paramKey);
	}
	
	/**
	 * 获取面包屑导航提示路径集合
	 * 
	 * @return
	 */
	public List<ModuleVO> listPath(String moduleId){
		moduleId = MyUtil.isEmpty(moduleId) ? "1" : moduleId;
		List<ModuleVO>myModuleEntities = Lists.newArrayList();
		ModuleVO moduleVO = myCxt.getModuleVOFromCacheById(moduleId);
		if (moduleVO == null) {
			//模块ID传入错误或者模块菜单数据没有加载到缓存
			return myModuleEntities;
		}
		myModuleEntities.add(moduleVO);
		int parentId = moduleVO.getParent_id();
		while(parentId != 0) {
			ModuleVO parentEntity = myCxt.getModuleVOFromCacheById(String.valueOf(parentId));
			myModuleEntities.add(parentEntity);
			parentId = parentEntity.getParent_id();
		}
		Collections.reverse(myModuleEntities);
		return myModuleEntities;
	}
	
	/**
	 * 获取当前模块的的父菜单模块
	 * 
	 * @return
	 */
	public Integer parentId(String moduleId, String userId){
		//刚登陆进来，url上面没有mid参数
		moduleId = MyUtil.isEmpty(moduleId) ? "-1" : moduleId;
		Integer parentId = null;
		ModuleVO moduleVO = myCxt.getModuleVOFromCacheById(moduleId);
		if (moduleVO != null) {
			parentId = moduleVO.getParent_id();
		}
		//如果没有找到parentID，则展开缺省一级菜单
		if (parentId == null) {
			parentId = Integer.valueOf(String.valueOf(stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.DefaultOpenMenuId.getValue(), userId)));
		}
		return parentId;
	}
	
}
