package org.g4studio.demo.online.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
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
import org.g4studio.demo.online.service.DemoService;

/**
 * 其他标准范例暨教程Action 文件管理、
 * 
 * @author OSWorks-XC
 * @since 2011-04-09
 * @see BaseAction
 */
public class OtherAction extends BaseAction {

	private DemoService demoService = (DemoService) getService("demoService");

	/**
	 * 文件操作页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward uploadInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("fileUploadView");
	}

	/**
	 * 查询文件列表
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryFileDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List list = g4Reader.queryForPage("Demo.queryFiles", dto);
		Integer countInteger = (Integer) g4Reader.queryForObject("Demo.countFiles", dto);
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, null);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * Web表单文件上传 单个/批量同理
	 * 
	 * @param
	 * @return
	 */
	public ActionForward doUpload(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm) form;
		// 单个文件,如果是多个就cForm.getFile2()....支持最多5个文件
		FormFile myFile = cForm.getFile1();
		// 获取web应用根路径,也可以直接指定服务器任意盘符路径
		String savePath = getServlet().getServletContext().getRealPath("/") + "/upload/";
		// String savePath = "d:/upload/";
		// 检查路径是否存在,如果不存在则创建之
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdir();
		}
		// 文件按天归档
		savePath = savePath + G4Utils.getCurDate() + "/";
		File file1 = new File(savePath);
		if (!file1.exists()) {
			file1.mkdir();
		}
		// 文件真实文件名
		String fileName = myFile.getFileName();
		// 我们一般会根据某种命名规则对其进行重命名
		// String fileName = ;
		File fileToCreate = new File(savePath, fileName);
		// 检查同名文件是否存在,不存在则将文件流写入文件磁盘系统
		if (!fileToCreate.exists()) {
			FileOutputStream os = new FileOutputStream(fileToCreate);
			os.write(myFile.getFileData());
			os.flush();
			os.close();
		} else {
			// 此路径下已存在同名文件,是否要覆盖或给客户端提示信息由你自己决定
			FileOutputStream os = new FileOutputStream(fileToCreate);
			os.write(myFile.getFileData());
			os.flush();
			os.close();
		}
		// 我们通常还会把这个文件的相关信息持久化到数据库
		Dto inDto = cForm.getParamAsDto(request);
		inDto.put("title", G4Utils.isEmpty(inDto.getAsString("title")) ? fileName : inDto.getAsString("title"));
		inDto.put("filesize", myFile.getFileSize());
		inDto.put("path", savePath + fileName);
		demoService.doUpload(inDto);
		setOkTipMsg("文件上传成功", response);
		return mapping.findForward(null);
	}

	/**
	 * 删除文件
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward delFiles(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String[] strChecked = dto.getAsString("strChecked").split(",");
		for (int i = 0; i < strChecked.length; i++) {
			String fileid = strChecked[i];
			Dto fileDto = (BaseDto) g4Reader.queryForObject("Demo.queryFileByFileID", fileid);
			String path = fileDto.getAsString("path");
			File file = new File(path);
			file.delete();
			demoService.delFile(fileid);
		}
		setOkTipMsg("文件删除成功", response);
		return mapping.findForward(null);
	}

	/**
	 * 下载文件
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward downloadFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String fileid = dto.getAsString("fileid");
		Dto fileDto = (BaseDto) g4Reader.queryForObject("Demo.queryFileByFileID", fileid);
		// 这里可稍做优化,根据文件类型动态设置此属性
		// response.setContentType("application/vnd.ms-excel");
		String filename = G4Utils.encodeChineseDownloadFileName(request, fileDto.getAsString("title"));
		response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
		String path = fileDto.getAsString("path");
		File file = new File(path);
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
		byte[] temp = new byte[1024];
		int size = 0;
		while ((size = in.read(temp)) != -1) {
			out.write(temp, 0, size);
		}
		in.close();
		ServletOutputStream os = response.getOutputStream();
		os.write(out.toByteArray());
		os.flush();
		os.close();
		return mapping.findForward(null);
	}

	/**
	 * Flash组件文件上传 如果是批量则客户端的SWF会循环来调用这个方法
	 * 
	 * @param
	 * @return
	 */
	public ActionForward doUploadBasedFlah(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm cForm = (BaseActionForm) form;
		FormFile myFile = cForm.getSwfUploadFile();
		// 获取web应用根路径,也可以直接指定服务器任意盘符路径
		String savePath = getServlet().getServletContext().getRealPath("/") + "/upload/";
		// String savePath = "d:/upload/";
		// 检查路径是否存在,如果不存在则创建之
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdir();
		}
		// 文件按天归档
		savePath = savePath + G4Utils.getCurDate() + "/";
		File file1 = new File(savePath);
		if (!file1.exists()) {
			file1.mkdir();
		}
		// 文件真实文件名
		String fileName = myFile.getFileName();
		// 我们一般会根据某种命名规则对其进行重命名
		// String fileName = ;
		File fileToCreate = new File(savePath, fileName);
		// 检查同名文件是否存在,不存在则将文件流写入文件磁盘系统
		if (!fileToCreate.exists()) {
			FileOutputStream os = new FileOutputStream(fileToCreate);
			os.write(myFile.getFileData());
			os.flush();
			os.close();
		} else {
			// 此路径下已存在同名文件,是否要覆盖或给客户端提示信息由你自己决定
			FileOutputStream os = new FileOutputStream(fileToCreate);
			os.write(myFile.getFileData());
			os.flush();
			os.close();
		}
		// 我们通常还会把这个文件的相关信息持久化到数据库
		Dto inDto = cForm.getParamAsDto(request);
		inDto.put("title", G4Utils.isEmpty(inDto.getAsString("title")) ? fileName : inDto.getAsString("title"));
		inDto.put("filesize", myFile.getFileSize());
		inDto.put("path", savePath + fileName);
		demoService.doUpload(inDto);
		setOkTipMsg("文件上传成功", response);
		return mapping.findForward(null);
	}


	/**
	 * 异常处理页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward exceptionInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("exceptionView");
	}
	
	/**
	 * 产生异常
	 * 
	 * @param
	 * @return
	 */
	public ActionForward doError(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		demoService.doError();
		setOkTipMsg("交易成功", response);
		return mapping.findForward("exceptionView");
	}
}
