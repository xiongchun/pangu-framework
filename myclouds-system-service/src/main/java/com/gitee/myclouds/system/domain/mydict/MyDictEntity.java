package com.gitee.myclouds.system.domain.mydict;

import com.alibaba.fastjson.annotation.JSONField;
import java.util.Date;
import java.io.Serializable;

import lombok.Data;

/**
 * <b>数据字典表[my_dict]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-05-07 20:42:50
 */
@Data
public class MyDictEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	//流水号
	private Integer id;	

	//类型
	private String dict_type;	

	//名称
	private String dict_name;	

	//数据字典KEY
	private String dict_key;	

	//字典对照值
	private String dict_value;	

	//是否启用
	private String is_enable;	

	//排序号
	private Integer sort_no;	

	//更新时间
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date update_time;	

	//备注
	private String remark;	

}