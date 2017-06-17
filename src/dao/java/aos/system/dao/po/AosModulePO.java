package aos.system.dao.po;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_module[aos_module]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-23 17:54:25
 */
public class AosModulePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 功能模块流水号
	 */
	private Integer id;
	
	/**
	 * 节点语义ID
	 */
	private String cascade_id;
	
	/**
	 * 父节点流水号
	 */
	private Integer parent_id;
	
	/**
	 * 功能模块名称
	 */
	private String name;
	
	/**
	 * 主页面URL
	 */
	private String url;
	
	/**
	 * 节点图标文件名称
	 */
	private String icon_name;
	
	/**
	 * 是否叶子节点
	 */
	private String is_leaf;
	
	/**
	 * 是否自动展开
	 */
	private String is_auto_expand;
	
	/**
	 * 是否启用
	 */
	private String is_enable;
	
	/**
	 * 矢量图标
	 */
	private String vector;
	
	/**
	 * 排序号
	 */
	private Integer sort_no;
	

	/**
	 * 功能模块流水号
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
	 * 父节点流水号
	 * 
	 * @return parent_id
	 */
	public Integer getParent_id() {
		return parent_id;
	}
	
	/**
	 * 功能模块名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 主页面URL
	 * 
	 * @return url
	 */
	public String getUrl() {
		return url;
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
	 * 是否启用
	 * 
	 * @return is_enable
	 */
	public String getIs_enable() {
		return is_enable;
	}
	
	/**
	 * 矢量图标
	 * 
	 * @return vector
	 */
	public String getVector() {
		return vector;
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
	 * 功能模块流水号
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
	 * 父节点流水号
	 * 
	 * @param parent_id
	 */
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	
	/**
	 * 功能模块名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 主页面URL
	 * 
	 * @param url
	 */
	public void setUrl(String url) {
		this.url = url;
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
	 * 是否启用
	 * 
	 * @param is_enable
	 */
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	
	/**
	 * 矢量图标
	 * 
	 * @param vector
	 */
	public void setVector(String vector) {
		this.vector = vector;
	}
	
	/**
	 * 排序号
	 * 
	 * @param sort_no
	 */
	public void setSort_no(Integer sort_no) {
		this.sort_no = sort_no;
	}
	

}