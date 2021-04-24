package org.g4studio.demo.online.web;

import java.util.ArrayList;
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
import org.g4studio.core.web.report.fcf.Categorie;
import org.g4studio.core.web.report.fcf.CategoriesConfig;
import org.g4studio.core.web.report.fcf.DataSet;
import org.g4studio.core.web.report.fcf.FcfDataMapper;
import org.g4studio.core.web.report.fcf.GraphConfig;
import org.g4studio.core.web.report.fcf.Set;
import org.g4studio.demo.online.service.DemoService;

/**
 * 演示用 Action
 * 
 * @author OSWorks-XC
 * @since 2010-06-13
 * @see BaseAction
 */
public class TestAction extends BaseAction {
	
	private DemoService demoService = (DemoService)getService("demoService");
	

	/**
	 * 测试页面1初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward test1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("test1View");
	}
	

	/**
	 * 测试页面2初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward test2Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setAttribute("ID", "测试");
		return mapping.findForward("test2View");
	}

	/**
	 * 测试3页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward test3Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("test3View");
	}

	/**
	 * 测试4页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward test4Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("test4View");
	}

	/**
	 * 测试5页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward test5Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        
		return mapping.findForward("test5View");
	}
	
	/**
	 * 获取FlashReport元数据 (折线组合图)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4LineGroup(Dto pDto){
		pDto.put("rownum", "12");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("产品A");
		dataSet1.setColor("FDC12E");
		pDto.put("product", "1");
		List alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("产品B");
		dataSet2.setColor("44BC2F");
		pDto.put("product", "2");
		List blist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		return dataList;
	}
	
	public ActionForward saveTheSubmitInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		System.out.println("接收到的表单提交参数：\n" + dto);
		response.setCharacterEncoding("UTF-8");
		//int i = 3/0;
		demoService.doError();
		setOkTipMsg("数据提交成功:" + dto.toString(), response);
		return mapping.findForward(null);
	}
	
	public ActionForward loadCallBack(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto outDto = new BaseDto();
		outDto.put("text1", "熊春");
		outDto.put("text2", "托尼贾");
		String jsonString = JsonHelper.encodeDto2FormLoadJson(outDto, null);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
}
