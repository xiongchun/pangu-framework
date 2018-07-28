package com.gitee.myclouds.common.web.vo;

import com.gitee.myclouds.toolbox.wrap.VO;

/**
 * ZTree树节点值对象
 * 
 * @author xiongchun
 *
 */
public class ZTreeNodeVO extends VO{
	
	private static final long serialVersionUID = -5973919398762544473L;
	
	/**
	 * 节点ID
	 */
	private Integer id;
	
	/**
	 * 父节点ID
	 */
	private Integer pId;
	
	/**
	 * 节点名称
	 */
	private String name;
	
	/**
	 * 节点是否展开
	 */
	private Boolean open;
	
	/**
	 * 节点是否选中
	 */
	private Boolean checked;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

}
