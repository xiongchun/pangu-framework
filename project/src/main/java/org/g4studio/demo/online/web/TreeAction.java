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
import org.g4studio.system.admin.service.OrganizationService;
import org.g4studio.system.common.util.SystemConstants;

/**
 * 树标准范例暨教程Action
 * 
 * @author OSWorks-XC
 * @since 2010-10-27
 * @see BaseAction
 */
public class TreeAction extends BaseAction {
	
	private OrganizationService organizationService = (OrganizationService) super.getService("organizationService");

	/**
	 * 树演示一页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("treeDemo1View");
	}
	
	/**
	 * 树演示二页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo2Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("treeDemo2View");
	}
	
	/**
	 * 树演示三页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo3Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("treeDemo3View");
	}
	
	/**
	 * 树演示四页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo4Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("treeDemo4View");
	}
	
	/**
	 * 树演示五页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo5Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("treeDemo5View");
	}
	
	/**
	 * 树演示六页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo6Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("treeDemo6View");
	}
	
	/**
	 * 树演示七页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo7Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("treeDemo7View");
	}
	
	/**
	 * 树演示八页面初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward treeDemo8Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("treeDemo8View");
	}
	
	/**
	 * 查询行政区域
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryAreas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = new BaseDto();
		String areacode = aForm.getTreeNodeUID4Clicked(request);
		dto.put("areacode", areacode);
		dto.put("length", areacode.length() + 2);
		List list = null;
		if (areacode.equals("00")) {
			list = g4Reader.queryForList("Demo.queryAreas4Tree4FirstLevel", dto);
		}else {
			list = g4Reader.queryForList("Demo.queryAreas4Tree", dto);
		}
		for (int i = 0; i < list.size(); i++) {
			Dto node = (BaseDto)list.get(i);
			if (node.getAsString("id").length() == 6) {
				node.put("leaf", new Boolean(true));
			}else {
				node.put("leaf", new Boolean(false));
			}
		}
		String jsonString = JsonHelper.encodeObject2Json(list);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询行政区域(复选树)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryAreas4CheckTree(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = new BaseDto();
		String areacode = aForm.getTreeNodeUID4Clicked(request);
		dto.put("areacode", areacode);
		dto.put("length", areacode.length() + 2);
		List list = null;
		if (areacode.equals("00")) {
			list = g4Reader.queryForList("Demo.queryAreas4Tree4FirstLevel", dto);
		}else {
			list = g4Reader.queryForList("Demo.queryAreas4Tree", dto);
		}
		for (int i = 0; i < list.size(); i++) {
			Dto node = (BaseDto)list.get(i);
			node.put("checked", new Boolean(false));
			if (node.getAsString("id").length() == 6) {
				node.put("leaf", new Boolean(true));
			}else {
				node.put("leaf", new Boolean(false));
			}
		}
		String jsonString = JsonHelper.encodeObject2Json(list);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询行政区域(复选树)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryAreas4CheckTree2(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm)form;
		Dto dto = new BaseDto();
		String areacode = aForm.getTreeNodeUID4Clicked(request);
		dto.put("areacode", areacode);
		dto.put("length", areacode.length() + 2);
		List list = null;
		if (areacode.equals("00")) {
			list = g4Reader.queryForList("Demo.queryAreas4Tree4FirstLevel", dto);
		}else {
			list = g4Reader.queryForList("Demo.queryAreas4Tree", dto);
		}
		for (int i = 0; i < list.size(); i++) {
			Dto node = (BaseDto)list.get(i);
			node.put("checked", new Boolean(false));
			if (node.getAsString("id").length() == 4) {
				node.put("leaf", new Boolean(true));
			}else {
				node.put("leaf", new Boolean(false));
			}
		}
		String jsonString = JsonHelper.encodeObject2Json(list);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询部门列表(表格树数据)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward departmentTreeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String nodeid = request.getParameter("node");
		dto.put("parentid", nodeid);
		List deptList = g4Reader.queryForList("Demo.queryDeptItemsByDto4TreeGridDemo", dto);
		Dto deptDto = new BaseDto();
		for(int i = 0; i < deptList.size(); i++){
			deptDto = (BaseDto)deptList.get(i);
			if(deptDto.getAsString("leaf").equals(SystemConstants.LEAF_Y))
				deptDto.put("leaf", new Boolean(true));
			else
				deptDto.put("leaf", new Boolean(false));
			if(deptDto.getAsString("id").length() == 6)
				deptDto.put("expanded", new Boolean(true));
		}
		String jsonString = JsonHelper.encodeObject2Json(deptList);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
}
