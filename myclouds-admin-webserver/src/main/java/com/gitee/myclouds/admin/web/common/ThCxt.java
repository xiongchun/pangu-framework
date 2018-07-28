package com.gitee.myclouds.admin.web.common;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.admin.domain.mymodule.MyModuleEntity;
import com.gitee.myclouds.common.MyCacheCxt;
import com.gitee.myclouds.toolbox.util.MyUtil;
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
	private MyCacheCxt myCacheCxt;
	
	/**
	 * 获取键值参数值
	 * 
	 * @param paramKey
	 * @return
	 */
	public String param(String paramKey) {
		return myCacheCxt.getParamValue(paramKey);
	}
	
	/**
	 * 获取面包屑导航提示路径集合
	 * 
	 * @return
	 */
	public List<MyModuleEntity> listPath(String moduleId){
		moduleId = MyUtil.isEmpty(moduleId) ? "1" : moduleId;
		List<MyModuleEntity>myModuleEntities = Lists.newArrayList();
		MyModuleEntity myModuleEntity = myCacheCxt.getMyModuleEntityFromCacheById(moduleId);
		if (myModuleEntity == null) {
			//模块ID传入错误或者模块菜单数据没有加载到缓存
			return myModuleEntities;
		}
		myModuleEntities.add(myModuleEntity);
		int parentId = myModuleEntity.getParent_id();
		while(parentId != 0) {
			MyModuleEntity parentEntity = myCacheCxt.getMyModuleEntityFromCacheById(String.valueOf(parentId));
			myModuleEntities.add(parentEntity);
			parentId = parentEntity.getParent_id();
		}
		Collections.reverse(myModuleEntities);
		return myModuleEntities;
	}
	
}
