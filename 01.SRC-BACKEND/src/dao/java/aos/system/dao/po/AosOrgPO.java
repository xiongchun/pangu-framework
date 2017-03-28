package aos.system.dao.po;

import aos.framework.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_org[aos_org]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-23 17:54:25
 */
public class AosOrgPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 节点语义ID
	 */
	private String cascade_id;
	
	/**
	 * 组织名称
	 */
	private String name;
	
	/**
	 * 热键
	 */
	private String hotkey;
	
	/**
	 * 父节点流水号
	 */
	private Integer parent_id;
	
	/**
	 * 是否叶子节点
	 */
	private String is_leaf;
	
	/**
	 * 是否自动展开
	 */
	private String is_auto_expand;
	
	/**
	 * 节点图标文件名称
	 */
	private String icon_name;
	
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
	 * 备注
	 */
	private String remark;
	
	/**
	 * 是否已删除
	 */
	private String is_del;
	
	/**
	 * 创建时间
	 */
	private Date create_time;
	
	/**
	 * 创建人ID
	 */
	private Integer create_by;
	

	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 节点语义ID
	 * 
	 * @return cascade_id
	 */
	public String getCascade_id() {
		return cascade_id;
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
	 * 热键
	 * 
	 * @return hotkey
	 */
	public String getHotkey() {
		return hotkey;
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
	 * 是否叶子节点
	 * 
	 * @return is_leaf
	 */
	public String getIs_leaf() {
		return is_leaf;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @return is_auto_expand
	 */
	public String getIs_auto_expand() {
		return is_auto_expand;
	}
	
	/**
	 * 节点图标文件名称
	 * 
	 * @return icon_name
	 */
	public String getIcon_name() {
		return icon_name;
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
	 * 备注
	 * 
	 * @return remark
	 */
	public String getRemark() {
		return remark;
	}
	
	/**
	 * 是否已删除
	 * 
	 * @return is_del
	 */
	public String getIs_del() {
		return is_del;
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
	 * 流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 节点语义ID
	 * 
	 * @param cascade_id
	 */
	public void setCascade_id(String cascade_id) {
		this.cascade_id = cascade_id;
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
	 * 热键
	 * 
	 * @param hotkey
	 */
	public void setHotkey(String hotkey) {
		this.hotkey = hotkey;
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
	 * 是否叶子节点
	 * 
	 * @param is_leaf
	 */
	public void setIs_leaf(String is_leaf) {
		this.is_leaf = is_leaf;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @param is_auto_expand
	 */
	public void setIs_auto_expand(String is_auto_expand) {
		this.is_auto_expand = is_auto_expand;
	}
	
	/**
	 * 节点图标文件名称
	 * 
	 * @param icon_name
	 */
	public void setIcon_name(String icon_name) {
		this.icon_name = icon_name;
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
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	/**
	 * 是否已删除
	 * 
	 * @param is_del
	 */
	public void setIs_del(String is_del) {
		this.is_del = is_del;
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