package com.gitee.myclouds.system.domain.myrolemodule;

import com.alibaba.fastjson.annotation.JSONField;
import java.util.Date;
import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * <b>功能模块-角色关联表[my_role_module]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-06-05 15:40:04
 */
@Data
@ToString
// @Accessors(chain = true) 此注解和BeanUtils的属性复制冲突，暂时不适用链式编程注解
public class MyRoleModuleEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	//流水号
	private Integer id;	

	// 角色流水号
	private Integer role_id;	

	//功能模块流水号
	private Integer module_id;	

	//权限类型
	private String grant_type;	

	//创建时间
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	

	//创建人ID
	private Integer create_by;	

}