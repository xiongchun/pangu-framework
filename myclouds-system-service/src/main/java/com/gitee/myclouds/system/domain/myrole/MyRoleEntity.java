package com.gitee.myclouds.system.domain.myrole;

import com.alibaba.fastjson.annotation.JSONField;
import java.util.Date;
import java.io.Serializable;

import lombok.Data;

/**
 * <b>角色表[my_role]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-05-07 20:42:51
 */
@Data
public class MyRoleEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	// 流水号
	private Integer id;	

	//角色名称
	private String name;	

	//是否启用
	private String is_enable;	

	//角色类型
	private String type;	

	//备注
	private String remark;	

	//扩展字段(JSON)
	private String ext;	

	//创建时间
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	

	//创建人ID
	private Integer create_by_id;	

	//创建人
	private String create_by;	

}