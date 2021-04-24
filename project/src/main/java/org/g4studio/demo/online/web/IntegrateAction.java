package org.g4studio.demo.online.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.report.jasper.ReportData;
import org.g4studio.demo.online.service.DemoService;

/**
 * 综合实例Action
 * 
 * @author OSWorks-XC
 * @since 2010-11-30
 * @see BaseAction
 */
public class IntegrateAction extends BaseAction {

	private DemoService demoService = (DemoService) getService("demoService");

	/**
	 * 查询实例1
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryDemo1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryDemo1View");
	}
	
	/**
	 * 存储过程调用初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward callPrcInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("callPrcView");
	}

	/**
	 * 查询实例2
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryDemo2Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryDemo2View");
	}

	/**
	 * 查询医院结算数据
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryBalanceInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List list = g4Reader.queryForPage("Demo.queryBalanceInfo2", dto);
		Integer countInteger = (Integer) g4Reader.queryForObject("Demo.countBalanceInfo2", dto);
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 数据采集
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward collectDataInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("collectDataView");
	}

	/**
	 * 数据维护
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward manageDataInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("manageDataView");
	}
	
	/**
	 * 数据维护(4合1)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward manageData4In1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        removeSessionAttribute(request, "printList");
		return mapping.findForward("manageData4In1View");
	}

	/**
	 * 数据采集(窗口模式)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward collectDataByWindowInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("collectDataByWindowView");
	}

	/**
	 * 查询收费项目
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward querySfxm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm) form;
		Dto inDto = cForm.getParamAsDto(request);
		Dto outDto = (BaseDto)g4Reader.queryForObject("Demo.queryCatalogs2", inDto);
		if (G4Utils.isEmpty(outDto)) {
			outDto = new BaseDto();
			outDto.put("msg", "没有查询到数据");
		}else {
			outDto.put("msg", "ok");
		}
		String jsonString = JsonHelper.encodeDto2FormLoadJson(outDto, G4Constants.FORMAT_Date);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 更新收费项目
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward updateSfxm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm) form;
		Dto inDto = cForm.getParamAsDto(request);
		inDto.put("ggsj", inDto.getAsTimestamp("ggsj"));
		demoService.updateSfxmDomain(inDto);
		setOkTipMsg("数据修改成功", response);
		return mapping.findForward(null);
	}

	/**
	 * 保存收费项目
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward saveSfxmDomain(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		inDto.put("ggsj", inDto.getAsTimestamp("ggsj"));
		inDto.put("yybm", "03010001");
		demoService.saveSfxmDomain(inDto);
		setOkTipMsg("收费项目数据保存成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询医院收费项目数据
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward querySfxmDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List list = g4Reader.queryForPage("Demo.queryCatalogsForGridDemo", dto);
		setSessionAttribute(request, "printList", list);
		Integer countInteger = (Integer) g4Reader.queryForObject("Demo.countCatalogsForGridDemo", dto);
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除收费项目
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward deleteSfxm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		demoService.deleteSfxm(inDto);
		setOkTipMsg("收费项目删除成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 构造报表数据对象
	 */
	public ActionForward buildReportDataObject(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List catalogList = catalogList = (List)getSessionAttribute(request, "printList");
		removeSessionAttribute(request, "printList");
		if (G4Utils.isNotEmpty(catalogList)) {
			for (int i = 0; i < catalogList.size(); i++) {
				Dto dto2 = (BaseDto)catalogList.get(i);
				dto2.put("zfbl", dto2.getAsBigDecimal("zfbl"));
			}
		}
		Dto dto = new BaseDto();
		dto.put("reportTitle", "北京市第一人民医院收费项目明细报表(演示)");
		//制表人
		dto.put("jbr", getSessionContainer(request).getUserInfo().getUsername());
		//制表时间
		dto.put("jbsj", G4Utils.getCurrentTime());
		ReportData reportData = new ReportData();
		reportData.setParametersDto(dto);
		reportData.setFieldsList(catalogList);
		reportData.setReportFilePath("/report/jasper/demo/hisCatalogReport.jasper");
		getSessionContainer(request).setReportData("hisCatalogReport4App", reportData);
		return mapping.findForward(null);
	}
	
	/**
	 * 调用存储过程
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward callPrc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm) form;
		Dto inDto = cForm.getParamAsDto(request);
		inDto.put("myname", getSessionContainer(request).getUserInfo().getUsername());
	    Dto outDto = demoService.callPrc(inDto);
	    String result = outDto.getAsString("result");
	    result = result + " " + inDto.getAsString("number1") + "+" + inDto.getAsString("number2") + "=" + outDto.getAsString("sum");
	    outDto.put("result", result);
	    outDto.put("success", new Boolean(true));
		outDto.put("msg", "存储过程调用成功");
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * SQL语句批处理
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward batchSql(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm) form;
		Dto inDto = cForm.getParamAsDto(request);
		inDto.put("count", "3");
		inDto.put("ggsj", inDto.getAsTimestamp("ggsj"));
		inDto.put("yybm", "03010001");
		demoService.batchSaveSfxmDomains(inDto);
		setOkTipMsg("保存成功(以batch方式一次性向数据库服务器批量提交了3条SQL语句)", response);
		return mapping.findForward(null);
	}
	
}
