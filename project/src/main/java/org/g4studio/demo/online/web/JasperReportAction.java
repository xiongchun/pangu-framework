package org.g4studio.demo.online.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.report.jasper.ReportData;

/**
 * Applet报表标准范例暨教程Action
 * 
 * @author OSWorks-XC
 * @since 2010-10-13
 * @see BaseAction
 */
public class JasperReportAction extends BaseAction {

	/**
	 * applet报表页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward appletInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.getSessionContainer(request).cleanUp();
		return mapping.findForward("appletReportView");
	}

	/**
	 * PDF报表页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward pdfInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.getSessionContainer(request).cleanUp();
		return mapping.findForward("pdfReportView");
	}

	/**
	 * 查询医院收费目录
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryCatalogs4Print(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto inDto = aForm.getParamAsDto(request);
		super.setSessionAttribute(request, "QUERYCATALOGS4PRINT_QUERYDTO", inDto);
		List catalogList = g4Reader.queryForPage("Demo.queryCatalogsForPrint", inDto);
		Integer pageCount = (Integer) g4Reader.queryForObject("Demo.queryCatalogsForPrintForPageCount", inDto);
		String jsonString = encodeList2PageJson(catalogList, pageCount, G4Constants.FORMAT_DateTime);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 构造报表数据对象
	 */
	public ActionForward buildReportDataObject(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		dto.put("reportTitle", "北京市第一人民医院收费项目明细报表(演示)");
		dto.put("jbr", getSessionContainer(request).getUserInfo().getUsername());
		dto.put("jbsj", G4Utils.getCurrentTime());
		Dto inDto = (BaseDto)getSessionAttribute(request, "QUERYCATALOGS4PRINT_QUERYDTO");
		List catalogList = g4Reader.queryForList("Demo.queryCatalogsForPrintLimitRows", inDto);
		int toIndex = 80;
		if (catalogList.size() <=toIndex) {
			toIndex = catalogList.size() - 1;
		}
		List subList = catalogList.subList(0, toIndex);
		for (int i = 0; i < subList.size(); i++) {
			Dto dto2 = (BaseDto)subList.get(i);
			dto2.put("zfbl", dto2.getAsBigDecimal("zfbl"));
		}
		ReportData reportData = new ReportData();
		reportData.setParametersDto(dto);
		reportData.setFieldsList(subList);
		reportData.setReportFilePath("/report/jasper/demo/hisCatalogReport.jasper");
		getSessionContainer(request).setReportData("hisCatalogReport", reportData);
		return mapping.findForward(null);
	}
	
}
