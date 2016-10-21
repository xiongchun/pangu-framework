package aos.system.dao;

import aos.framework.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_role[aos_role]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2016-10-10 23:40:42
 */
public class Aos_rolePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 *  流水号
	 */
	private String id_;
	
	/**
	 * 角色名称
	 */
	private String name_;
	
	/**
	 * 是否启用
	 */
	private String is_enable_;
	
	/**
	 * 角色类型
	 */
	private String type_;
	
	/**
	 * 扩展码
	 */
	private String biz_code_;
	
	/**
	 * 备注
	 */
	private String remark_;
	
	/**
	 * 创建时间
	 */
	private Date create_time_;
	
	/**
	 * 创建人ID
	 */
	private String create_by_;
	

	/**
	 *  流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 角色名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 是否启用
	 * 
	 * @return is_enable_
	 */
	public String getIs_enable_() {
		return is_enable_;
	}
	
	/**
	 * 角色类型
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
	}
	
	/**
	 * 扩展码
	 * 
	 * @return biz_code_
	 */
	public String getBiz_code_() {
		return biz_code_;
	}
	
	/**
	 * 备注
	 * 
	 * @return remark_
	 */
	public String getRemark_() {
		return remark_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @return create_time_
	 */
	public Date getCreate_time_() {
		return create_time_;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @return create_by_
	 */
	public String getCreate_by_() {
		return create_by_;
	}
	

	/**
	 *  流水号
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 角色名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 是否启用
	 * 
	 * @param is_enable_
	 */
	public void setIs_enable_(String is_enable_) {
		this.is_enable_ = is_enable_;
	}
	
	/**
	 * 角色类型
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
	}
	
	/**
	 * 扩展码
	 * 
	 * @param biz_code_
	 */
	public void setBiz_code_(String biz_code_) {
		this.biz_code_ = biz_code_;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark_
	 */
	public void setRemark_(String remark_) {
		this.remark_ = remark_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @param create_time_
	 */
	public void setCreate_time_(Date create_time_) {
		this.create_time_ = create_time_;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @param create_by_
	 */
	public void setCreate_by_(String create_by_) {
		this.create_by_ = create_by_;
	}
	

}