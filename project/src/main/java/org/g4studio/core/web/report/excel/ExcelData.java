package org.g4studio.core.web.report.excel;

import java.util.List;

import org.g4studio.core.metatype.Dto;

/**
 * Excel数据对象
 * 
 * @author XiongChun
 * @since 2010-08-12
 */
public class ExcelData {

	/**
	 * Excel参数元数据对象
	 */
	private Dto parametersDto;

	/**
	 * Excel集合元对象
	 */
	private List fieldsList;

	/**
	 * 构造函数
	 * 
	 * @param pDto
	 *            元参数对象
	 * @param pList
	 *            集合元对象
	 */
	public ExcelData(Dto pDto, List pList) {
		setParametersDto(pDto);
		setFieldsList(pList);
	}

	public Dto getParametersDto() {
		return parametersDto;
	}

	public void setParametersDto(Dto parametersDto) {
		this.parametersDto = parametersDto;
	}

	public List getFieldsList() {
		return fieldsList;
	}

	public void setFieldsList(List fieldsList) {
		this.fieldsList = fieldsList;
	}

}
