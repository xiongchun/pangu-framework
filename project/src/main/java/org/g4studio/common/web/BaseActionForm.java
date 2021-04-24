package org.g4studio.common.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.g4studio.common.util.WebUtils;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.mvc.xstruts.upload.FormFile;
import org.g4studio.core.util.G4Utils;

/**
 * ActionForm公共类
 * 
 * @author OSWorks-XC
 * @since 2009-09-03
 * @see ActionForm
 */
public class BaseActionForm extends ActionForm {

	public void BaseActionForm() {
		
	}

	/**
	 * 将请求参数封装为Dto
	 * 
	 * @param request
	 * @return
	 */
	public Dto getParamAsDto(HttpServletRequest request) {
		return WebUtils.getParamAsDto(request);
	}

	/**
	 * 获取树形节点单击事件传到后台的节点唯一标识号 对应JS节点对象的ID属性,其Key值为:"node"
	 * 
	 * @param request
	 * @return
	 */
	public String getTreeNodeUID4Clicked(HttpServletRequest request) {
		return request.getParameter("node");
	}

	/**
	 * 获取Grid新增和编辑过的脏数据
	 * 
	 * @return
	 */
	public List getGridDirtyData(HttpServletRequest request) {
		List list = new ArrayList();
		String dirtyData = request.getParameter("dirtydata");
		if (G4Utils.isEmpty(dirtyData)) {
			return list;
		}
		dirtyData = dirtyData.substring(1, dirtyData.length() - 1);
		String[] dirtyDatas = dirtyData.split("},");
		for (int i = 0; i < dirtyDatas.length; i++) {
			if (i != dirtyDatas.length - 1) {
				dirtyDatas[i] += "}";
			}
			Dto dto = JsonHelper.parseSingleJson2Dto(dirtyDatas[i]);
			list.add(dto);
		}
		return list;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		super.reset(mapping, request);
	}

	private FormFile theFile;

	private FormFile file1;

	private FormFile file2;

	private FormFile file3;

	private FormFile file4;

	private FormFile file5;
	
	private FormFile swfUploadFile;
	

	public FormFile getTheFile() {
		return theFile;
	}

	public void setTheFile(FormFile theFile) {
		this.theFile = theFile;
	}

	public FormFile getFile1() {
		return file1;
	}

	public void setFile1(FormFile file1) {
		this.file1 = file1;
	}

	public FormFile getFile2() {
		return file2;
	}

	public void setFile2(FormFile file2) {
		this.file2 = file2;
	}

	public FormFile getFile3() {
		return file3;
	}

	public void setFile3(FormFile file3) {
		this.file3 = file3;
	}

	public FormFile getFile4() {
		return file4;
	}

	public void setFile4(FormFile file4) {
		this.file4 = file4;
	}

	public FormFile getFile5() {
		return file5;
	}

	public void setFile5(FormFile file5) {
		this.file5 = file5;
	}

	public FormFile getSwfUploadFile() {
		return swfUploadFile;
	}

	public void setSwfUploadFile(FormFile swfUploadFile) {
		this.swfUploadFile = swfUploadFile;
	}
}
