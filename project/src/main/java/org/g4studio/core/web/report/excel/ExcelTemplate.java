package org.g4studio.core.web.report.excel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;

/**
 * 导出Excel的模板对象
 * 
 * @author XiongChun
 * @since 2010-08-12
 */
public class ExcelTemplate {

	private Log log = LogFactory.getLog(ExcelTemplate.class);

	private List staticObject = null;
	private List parameterObjct = null;
	private List fieldObjct = null;
	private List variableObject = null;
	private String templatePath = null;

	public ExcelTemplate(String pTemplatePath) {
		templatePath = pTemplatePath;
	}
	
	public ExcelTemplate() {
	}
	
	/**
	 * 解析Excel模板
	 */
	public void parse(HttpServletRequest request) {
		staticObject = new ArrayList();
		parameterObjct = new ArrayList();
		fieldObjct = new ArrayList();
		variableObject = new ArrayList();
		if(G4Utils.isEmpty(templatePath)){
			log.error(G4Constants.Exception_Head + "Excel模板路径不能为空!");
		}
		//templatePath = request.getSession().getServletContext().getRealPath(templatePath);
        InputStream is = request.getSession().getServletContext().getResourceAsStream(templatePath); 
		if(G4Utils.isEmpty(is)){
			log.error(G4Constants.Exception_Head + "未找到模板文件,请确认模板路径是否正确[" + templatePath + "]");
		}
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Sheet sheet = workbook.getSheet(0);
		if (G4Utils.isNotEmpty(sheet)) {
			int rows = sheet.getRows();
			for (int k = 0; k < rows; k++) {
				Cell[] cells = sheet.getRow(k);
				for (int j = 0; j < cells.length; j++) {
					String cellContent = cells[j].getContents().trim();
					if (!G4Utils.isEmpty(cellContent)) {
						if (cellContent.indexOf("$P") != -1 || cellContent.indexOf("$p") != -1) {
							parameterObjct.add(cells[j]);
						} else if (cellContent.indexOf("$F") != -1 || cellContent.indexOf("$f") != -1) {
							fieldObjct.add(cells[j]);
						} else if(cellContent.indexOf("$V") != -1 || cellContent.indexOf("$v") != -1) {
							variableObject.add(cells[j]);
						}else {
							staticObject.add(cells[j]);
						}
					}
				}
			}
		} else {
			log.error("模板工作表对象不能为空!");
		}
	}

	/**
	 * 增加一个静态文本对象
	 */
	public void addStaticObject(Cell cell) {
		staticObject.add(cell);
	}

	/**
	 * 增加一个参数对象
	 */
	public void addParameterObjct(Cell cell) {
		parameterObjct.add(cell);
	}

	/**
	 * 增加一个字段对象
	 */
	public void addFieldObjct(Cell cell) {
		fieldObjct.add(cell);
	}


	public List getStaticObject() {
		return staticObject;
	}

	public List getParameterObjct() {
		return parameterObjct;
	}

	public List getFieldObjct() {
		return fieldObjct;
	}

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}

	public List getVariableObject() {
		return variableObject;
	}

}
