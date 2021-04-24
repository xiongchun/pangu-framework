package org.g4studio.demo.online.web;

import java.io.File;
import java.io.FileOutputStream;
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
import org.g4studio.core.mvc.xstruts.upload.FormFile;
import org.g4studio.core.util.G4Utils;


/**
 * 表单及表单元素标准范例暨教程Action
 * 
 * @author OSWorks-XC
 * @since 2010-10-23
 * @see BaseAction
 */
public class FormAction extends BaseAction {

	/**
	 * 基本输入组件页面初始化(属性设置)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward basicInput4PropertyInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("basicInput4PropertyView");
	}

	/**
	 * 基本输入组件页面初始化(行为方法)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward basicInput4MethodInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("basicInput4MethodView");
	}

	/**
	 * 日期时间输入组件暨初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward dataTimeInputInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("dataTimeInputView");
	}

	/**
	 * 下拉选择框(本地数据源)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward selectInputBasedLocalDataSourceInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("selectInputBasedLocalDataSourceView");
	}

	/**
	 * 下拉选择框(字典数据源)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward selectInputBasedCodeTableDataSourceInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("selectInputBasedCodeTableDataSourceView");
	}

	/**
	 * 下拉选择框(远程数据源)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward selectInputBasedRemoteDataSourceInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("selectInputBasedRemoteDataSourceView");
	}

	/**
	 * 下拉选择框(N级联动)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward selectInputBasedMultilevelInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("selectInputBasedMultilevelView");
	}

	/**
	 * 查询中国行政区划
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryAreaDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List areaList = g4Reader.queryForList("Demo.getChinaDataArea", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 查询中国行政区划(分页)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryAreaDatas4Paging(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		//System.out.println(dto);
		List areaList = g4Reader.queryForPage("Demo.getChinaDataArea4Paging", dto);
		Integer totalInteger = (Integer) g4Reader.queryForObject("Demo.getChinaDataArea4PagingForPageCount", dto);
		String jsonString = encodeList2PageJson(areaList, totalInteger, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 表单：单选、复选框页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward radioCheckBoxInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("radioCheckBoxView");
	}

	/**
	 * 表单：表单异步提交页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward formSubmitInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("formSubmitView");
	}
	
	/**
	 * 表单：表单同步提交页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward formSynSubmitInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("formSynSubmitView");
	}
	
	/**
	 * 表单：表单同步提交后跳转的页面
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward formSynForwardInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto inDto = aForm.getParamAsDto(request);
		request.setAttribute("value", inDto.toJson());
		return mapping.findForward("formSynForwardPageView");
	}

	/**
	 * 表单：接收表单提交数据
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward saveTheSubmitInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		System.out.println("接收到的表单提交参数：\n" + dto);
		setOkTipMsg("数据提交成功:" + dto.toString(), response);
		return mapping.findForward(null);
	}
	

	/**
	 * 表单：接收表单提交数据(ExtAjax请求)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward saveTheSubmitInfoBasedAjaxRequest(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = aForm.getParamAsDto(request);
		System.out.println("接收到的表单提交参数：\n" + dto);
		setOkTipMsg("数据提交成功:" + dto.toString(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 表单：表单数据填充
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward loadCallBack(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto outDto = new BaseDto();
		outDto.put("text1", "熊春");
		outDto.put("text2", "托尼贾");
		String jsonString = JsonHelper.encodeDto2FormLoadJson(outDto, null);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 工具栏页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward toobarDemo1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("toolbarDemo1View");
	}
	
	/**
	 * 消息提示框页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward msgDemo1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("msgDemo1View");
	}
	
	/**
	 * 表单缺省平铺布局页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward formLayoutInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("formLayoutView");
	}
	
	/**
	 * 表单分列布局页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward columnLayoutInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("columnLayoutView");
	}
	
	/**
	 * 表单复合布局页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward complexLayoutInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("complexLayoutView");
	}
	
	/**
	 * 表单复合布局页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward complexLayout2Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("complexLayout2View");
	}
	
	/**
	 * 富文本输入页面初始化(原生)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward htmlEditorInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("htmlEditorInitView");
	}
	
	/**
	 * 富文本输入页面初始化(扩展)
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward htmlEditor2Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("htmlEditor2InitView");
	}
	
	/**
	 * 插入图片
	 * 
	 * @param
	 * @return
	 */
	public ActionForward doUpload(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto outDto = new BaseDto();
		BaseActionForm cForm = (BaseActionForm) form;
		// 单个文件,如果是多个就cForm.getFile2()....支持最多5个文件
		FormFile myFile = cForm.getFile1();
		// 获取web应用根路径,也可以直接指定服务器任意盘符路径
		String savePath = getServlet().getServletContext().getRealPath("/") + "/upload/demo/";
		//String savePath = "d:/upload/";
		// 检查路径是否存在,如果不存在则创建之
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdir();
		}
		String type = myFile.getFileName().substring(myFile.getFileName().lastIndexOf("."));
		// 文件真实文件名
		String fileName = getSessionContainer(request).getUserInfo().getUserid();
		fileName = fileName + "_" + G4Utils.getCurrentTime("yyyyMMddhhmmss") + type;
		// 我们一般会根据某种命名规则对其进行重命名
		// String fileName = ;
		File fileToCreate = new File(savePath, fileName);
		if (myFile.getFileSize() > 204800) {
			outDto.put("success", new Boolean(true));
			outDto.put("msg", "文件上传失败,你只能上传小于100KB的图片文件");
			outDto.put("state", "error");
		}else {
			// 检查同名文件是否存在,不存在则将文件流写入文件磁盘系统
			if (!fileToCreate.exists()) {
				FileOutputStream os = new FileOutputStream(fileToCreate);
				os.write(myFile.getFileData());
				os.flush();
				os.close();
			}
			outDto.put("success", new Boolean(true));
			outDto.put("msg", "文件上传成功");
			outDto.put("state", "ok");
			outDto.put("aUrl", request.getContextPath() + "/upload/demo/" + fileName);
		}
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
}
