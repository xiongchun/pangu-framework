package org.g4studio.core.web.report.excel;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.core.metatype.Dto;
import org.g4studio.core.util.G4Utils;

/**
 * Excel导出器(适用于WebAPP)
 * 
 * @author XiongChun
 * @since 2010-08-12
 */
public class ExcelExporter {

	private String templatePath;
	private Dto parametersDto;
	private List fieldsList;
	private String filename = "Excel.xls";

	/**
	 * 设置数据
	 * 
	 * @param pDto
	 *            参数集合
	 * @param pList
	 *            字段集合
	 */
	public void setData(Dto pDto, List pList) {
		parametersDto = pDto;
		fieldsList = pList;
	}

	/**
	 * 导出Excel
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void export(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/vnd.ms-excel");
		filename = G4Utils.encodeChineseDownloadFileName(request, getFilename());
		response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
		ExcelData excelData = new ExcelData(parametersDto, fieldsList);
		ExcelTemplate excelTemplate = new ExcelTemplate();
		excelTemplate.setTemplatePath(getTemplatePath());
		excelTemplate.parse(request);
		ExcelFiller excelFiller = new ExcelFiller(excelTemplate, excelData);
		ByteArrayOutputStream bos = excelFiller.fill(request);
		ServletOutputStream os = response.getOutputStream();
		os.write(bos.toByteArray());
		os.flush();
		os.close();
	}

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}
