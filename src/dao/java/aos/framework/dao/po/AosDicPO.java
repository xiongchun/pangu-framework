package aos.framework.dao.po;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_dic[aos_dic]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-24 10:46:25
 */
public class AosDicPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 字典名称
	 */
	private String name;
	
	/**
	 * 字典KEY
	 */
	private String dic_key;
	
	/**
	 * 对照码
	 */
	private String code;
	
	/**
	 * 对照值
	 */
	private String dic_desc;
	
	/**
	 * 是否启用
	 */
	private String is_enable;
	
	/**
	 *  热键
	 */
	private String hotkey;
	
	/**
	 * 所属分组
	 */
	private String dic_group;
	
	/**
	 * 排序号
	 */
	private Integer sort_no;
	
	/**
	 * 备注
	 */
	private String remark;
	

	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 字典名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 字典KEY
	 * 
	 * @return dic_key
	 */
	public String getDic_key() {
		return dic_key;
	}
	
	/**
	 * 对照码
	 * 
	 * @return code
	 */
	public String getCode() {
		return code;
	}
	
	/**
	 * 对照值
	 * 
	 * @return dic_desc
	 */
	public String getDic_desc() {
		return dic_desc;
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
	 *  热键
	 * 
	 * @return hotkey
	 */
	public String getHotkey() {
		return hotkey;
	}
	
	/**
	 * 所属分组
	 * 
	 * @return dic_group
	 */
	public String getDic_group() {
		return dic_group;
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
	 * 流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 字典名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 字典KEY
	 * 
	 * @param dic_key
	 */
	public void setDic_key(String dic_key) {
		this.dic_key = dic_key;
	}
	
	/**
	 * 对照码
	 * 
	 * @param code
	 */
	public void setCode(String code) {
		this.code = code;
	}
	
	/**
	 * 对照值
	 * 
	 * @param dic_desc
	 */
	public void setDic_desc(String dic_desc) {
		this.dic_desc = dic_desc;
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
	 *  热键
	 * 
	 * @param hotkey
	 */
	public void setHotkey(String hotkey) {
		this.hotkey = hotkey;
	}
	
	/**
	 * 所属分组
	 * 
	 * @param dic_group
	 */
	public void setDic_group(String dic_group) {
		this.dic_group = dic_group;
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
	

}