package aos.system.dao.po;

import aos.framework.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_role[aos_role]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-23 17:54:25
 */
public class AosRolePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 *  流水号
	 */
	private Integer id;
	
	/**
	 * 角色名称
	 */
	private String name;
	
	/**
	 * 是否启用
	 */
	private String is_enable;
	
	/**
	 * 角色类型
	 */
	private String type;
	
	/**
	 * 扩展码
	 */
	private String biz_code;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 创建时间
	 */
	private Date create_time;
	
	/**
	 * 创建人ID
	 */
	private Integer create_by;
	

	/**
	 *  流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 角色名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 是否启用
	 * 
	 * @return is_enable
	 */
	public String getIs_enable() {
		return is_enable;
	}
	
	/**
	 * 角色类型
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
	 * 备注
	 * 
	 * @return remark
	 */
	public String getRemark() {
		return remark;
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
	 * @return create_by
	 */
	public Integer getCreate_by() {
		return create_by;
	}
	

	/**
	 *  流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 角色名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 是否启用
	 * 
	 * @param is_enable
	 */
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	
	/**
	 * 角色类型
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
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
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
	 * @param create_by
	 */
	public void setCreate_by(Integer create_by) {
		this.create_by = create_by;
	}
	

}