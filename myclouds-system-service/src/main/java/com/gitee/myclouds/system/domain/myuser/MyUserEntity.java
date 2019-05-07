package com.gitee.myclouds.system.domain.myuser;

import com.alibaba.fastjson.annotation.JSONField;
import java.util.Date;
import java.io.Serializable;

import lombok.Data;

/**
 * <b>后台用户基本信息表[my_user]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-05-07 20:42:52
 */
@Data
public class MyUserEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	//流水号
	private Integer id;	

	//用户登录帐号
	private String account;	

	//密码
	private String password;	

	//用户姓名
	private String name;	

	//性别
	private String sex;	

	//用户状态
	private String status;	

	//用户类型
	private String type;	

	//所属部门流水号
	private Integer org_id;	

	//电子邮件
	private String email;	

	//联系电话
	private String mobile;	

	//身份证号
	private String idno;	

	//扩展码
	private String biz_code;	

	//扩展JSON
	private String ext;	

	//创建时间
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	

	//创建人ID
	private Integer create_by_id;	

	//创建人
	private String create_by;	

	//备注
	private String remark;	

}