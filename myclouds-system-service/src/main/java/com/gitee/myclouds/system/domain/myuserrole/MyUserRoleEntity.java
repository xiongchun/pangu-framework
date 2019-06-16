package com.gitee.myclouds.system.domain.myuserrole;

import com.alibaba.fastjson.annotation.JSONField;
import java.util.Date;
import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * <b>用户-角色关联表[my_user_role]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-06-10 22:02:05
 */
@Data
@ToString
// @Accessors(chain = true) 此注解和BeanUtils的属性复制冲突，暂时不适用链式编程注解
public class MyUserRoleEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	//流水号
	private Integer id;	

	//用户流水号
	private Integer user_id;	

	//角色流水号
	private Integer role_id;	

	//创建时间
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	

	//创建人ID
	private Integer create_by_id;	

	//创建人
	private String create_by;	

}