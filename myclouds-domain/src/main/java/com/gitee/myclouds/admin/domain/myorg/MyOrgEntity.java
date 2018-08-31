package com.gitee.myclouds.admin.domain.myorg;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.Entity;

import java.util.Date;

/**
 * <b>组织机构表[my_org]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-08-04 17:44:42
 */
public class MyOrgEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 组织名称
	 */
	private String name;	
	/**
	 * 父节点流水号
	 */
	private Integer parent_id;	
	/**
	 * 是否自动展开
	 */
	private String is_expanded;	
	/**
	 * 节点图标
	 */
	private String icon;	
	/**
	 * 组织类型
	 */
	private String type;	
	/**
	 * 扩展码
	 */
	private String biz_code;	
	/**
	 * 排序号
	 */
	private Integer sort_no;	
	/**
	 * 扩展JSON
	 */
	private String ext;	
	/**
	 * 创建时间
	 */
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	
	/**
	 * 创建人ID
	 */
	private Integer create_by_id;	
	/**
	 * 创建人
	 */
	private String create_by;	
	/**
	 * 备注
	 */
	private String remark;	

	/**
	 * 将参数对象中的属性复制到当前对象中
	 * 
	 * @param inObj 参数对象
	 * @return
	 */
	public MyOrgEntity copyFrom(Object inObj) {
		super.copyProperties(inObj);
		return this;
	}
	
	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 组织名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 父节点流水号
	 * 
	 * @return parent_id
	 */
	public Integer getParent_id() {
		return parent_id;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @return is_expanded
	 */
	public String getIs_expanded() {
		return is_expanded;
	}
	
	/**
	 * 节点图标
	 * 
	 * @return icon
	 */
	public String getIcon() {
		return icon;
	}
	
	/**
	 * 组织类型
	 * 
	 * @return type
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * 扩展码
	 * 
	 * @return biz_code
	 */
	public String getBiz_code() {
		return biz_code;
	}
	
	/**
	 * 排序号
	 * 
	 * @return sort_no
	 */
	public Integer getSort_no() {
		return sort_no;
	}
	
	/**
	 * 扩展JSON
	 * 
	 * @return ext
	 */
	public String getExt() {
		return ext;
	}
	
	/**
	 * 创建时间
	 * 
	 * @return create_time
	 */
	public Date getCreate_time() {
		return create_time;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @return create_by_id
	 */
	public Integer getCreate_by_id() {
		return create_by_id;
	}
	
	/**
	 * 创建人
	 * 
	 * @return create_by
	 */
	public String getCreate_by() {
		return create_by;
	}
	
	/**
	 * 备注
	 * 
	 * @return remark
	 */
	public String getRemark() {
		return remark;
	}
	

	/**
	 * 流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 组织名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 父节点流水号
	 * 
	 * @param parent_id
	 */
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @param is_expanded
	 */
	public void setIs_expanded(String is_expanded) {
		this.is_expanded = is_expanded;
	}
	
	/**
	 * 节点图标
	 * 
	 * @param icon
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	/**
	 * 组织类型
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 扩展码
	 * 
	 * @param biz_code
	 */
	public void setBiz_code(String biz_code) {
		this.biz_code = biz_code;
	}
	
	/**
	 * 排序号
	 * 
	 * @param sort_no
	 */
	public void setSort_no(Integer sort_no) {
		this.sort_no = sort_no;
	}
	
	/**
	 * 扩展JSON
	 * 
	 * @param ext
	 */
	public void setExt(String ext) {
		this.ext = ext;
	}
	
	/**
	 * 创建时间
	 * 
	 * @param create_time
	 */
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @param create_by_id
	 */
	public void setCreate_by_id(Integer create_by_id) {
		this.create_by_id = create_by_id;
	}
	
	/**
	 * 创建人
	 * 
	 * @param create_by
	 */
	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}