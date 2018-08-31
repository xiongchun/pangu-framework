package com.gitee.myclouds.builder.vo;

import java.util.ArrayList;

import com.gitee.myclouds.common.wrapper.VO;
import com.google.common.collect.Lists;

/**
 * <b>数据表索引值对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
public class IndexVO extends VO{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 索引名称
	 */
	private String name;
	
	/**
	 * 索引类型(pk：主键索引；uk：唯一索引；nk：常规索引)<br>
	 * 当前只用到唯一索引类型
	 */
	private String type;
	
	/**
	 * 索引包含的字段
	 */
	private ArrayList<ColumnVO> columnVOs = Lists.newArrayList();
	
	public void addColumnVO(ColumnVO columnVO) {
		columnVOs.add(columnVO);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public ArrayList<ColumnVO> getColumnVOs() {
		return columnVOs;
	}

	public void setColumnVOs(ArrayList<ColumnVO> columnVOs) {
		this.columnVOs = columnVOs;
	}
}
