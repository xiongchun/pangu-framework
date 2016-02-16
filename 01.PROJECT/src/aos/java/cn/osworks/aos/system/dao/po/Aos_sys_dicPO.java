package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>数据字典明细表[aos_sys_dic]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:30
 */
public class Aos_sys_dicPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 字典对照码
	 */
	private String code_;
	
	/**
	 * 字典对照值
	 */
	private String desc_;
	
	/**
	 *  热键
	 */
	private String hotkey_;
	
	/**
	 * 当前状态
	 */
	private String status_;
	
	/**
	 * 所属字典流水号
	 */
	private String dic_index_id_;
	
	/**
	 * 备注
	 */
	private String remark_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 字典对照码
	 * 
	 * @return code_
	 */
	public String getCode_() {
		return code_;
	}
	
	/**
	 * 字典对照值
	 * 
	 * @return desc_
	 */
	public String getDesc_() {
		return desc_;
	}
	
	/**
	 *  热键
	 * 
	 * @return hotkey_
	 */
	public String getHotkey_() {
		return hotkey_;
	}
	
	/**
	 * 当前状态
	 * 
	 * @return status_
	 */
	public String getStatus_() {
		return status_;
	}
	
	/**
	 * 所属字典流水号
	 * 
	 * @return dic_index_id_
	 */
	public String getDic_index_id_() {
		return dic_index_id_;
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
	 * 流水号
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 字典对照码
	 * 
	 * @param code_
	 */
	public void setCode_(String code_) {
		this.code_ = code_;
	}
	
	/**
	 * 字典对照值
	 * 
	 * @param desc_
	 */
	public void setDesc_(String desc_) {
		this.desc_ = desc_;
	}
	
	/**
	 *  热键
	 * 
	 * @param hotkey_
	 */
	public void setHotkey_(String hotkey_) {
		this.hotkey_ = hotkey_;
	}
	
	/**
	 * 当前状态
	 * 
	 * @param status_
	 */
	public void setStatus_(String status_) {
		this.status_ = status_;
	}
	
	/**
	 * 所属字典流水号
	 * 
	 * @param dic_index_id_
	 */
	public void setDic_index_id_(String dic_index_id_) {
		this.dic_index_id_ = dic_index_id_;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark_
	 */
	public void setRemark_(String remark_) {
		this.remark_ = remark_;
	}
	

}