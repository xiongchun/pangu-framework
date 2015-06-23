package cn.osworks.aos.modules.builder.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.AOSXmlParam;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.modules.builder.service.IconService;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_iconMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_iconPO;
import cn.osworks.aos.modules.system.service.SystemService;
import cn.osworks.aos.web.misc.DicCons;

import com.google.common.collect.Lists;

/**
 * 图标大全控制器
 * 
 * @author OSWorks-XC
 * @date 2014-10-30
 */
@Controller
@RequestMapping(value = "system/icon/")
public class IconController {

	@Autowired
	private Aos_ge_iconMapper aos_ge_iconMapper;
	@Autowired
	private IconService iconService;
	@Autowired
	private SystemService systemService;

	/**
	 * 页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		String bodyBorder = "0 0 1 0";
		String skin = WebCxt.getCfgByUser(session, "skin_");
		if (StringUtils.equalsIgnoreCase(skin, AOSCons.SKIN_NEPTUNE)) {
			bodyBorder = "0 0 0 0";
		}
		request.setAttribute("bodyBorder", bodyBorder);
		request.setAttribute("mdpm", systemService.getMasterDetailPageModel(Dtos.newDto(request)));
		return "aos/builder/icon/icon.jsp";
	}

	/**
	 * 图标列表页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "initIconList")
	public String initIconList(HttpSession session, HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		String type_ = inDto.getString("type_");
		request.setAttribute("type_", type_);
		String height_ = "50";
		if (StringUtils.equals(type_, DicCons.BIG_FILE_ICON)) {
			height_ = "100";
		}
		request.setAttribute("height_", height_);
		return "aos/builder/icon/iconList.jsp";
	}

	/**
	 * 查询图标
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listIcons")
	public void listIcons(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		inDto.setOrder("type_, name_");
		List<Aos_ge_iconPO> list = aos_ge_iconMapper.like(inDto);
		List<Dto> newList = Lists.newArrayList();
		Dto dto = Dtos.newDto();
		for (Aos_ge_iconPO aos_ge_iconPO : list) {
			dto = aos_ge_iconPO.toDto();
			// 截取过长字符串
			dto.put("name_s", StringUtils.substring(aos_ge_iconPO.getName_(), 0, 14));
			String htmlString = "";
			if (aos_ge_iconPO.getType_().equals("1")) {
				htmlString = "<img width=\"16\" height=\"16\" src=\"" + System.getProperty(AOSCons.CXT_KEY)
						+ "/static/icon/" + aos_ge_iconPO.getName_() + "\" />";
			} else if (aos_ge_iconPO.getType_().equals("2")) {
				htmlString = "<img width=\"64\" height=\"64\" src=\"" + System.getProperty(AOSCons.CXT_KEY)
						+ "/static/icon/big64/" + aos_ge_iconPO.getName_() + "\" />";
			} else if (aos_ge_iconPO.getType_().equals("3")) {
				htmlString = "<i class=\"fa " + aos_ge_iconPO.getName_() + " fa-lg\"></i>";
			}
			dto.put("html", htmlString);
			newList.add(dto);
		}
		String outString = AOSJson.toJson(newList);
		WebCxt.write(response, outString);
	}

	/**
	 * 同步图标
	 */
	@RequestMapping(value = "syncIcon")
	public void syncIcon(HttpServletRequest request, HttpServletResponse response) {
		if (StringUtils.equals(AOSCons.RUNAS_PRO, AOSXmlParam.getValue("runas"))) {
			WebCxt.write(response, "同步操作被取消，只能在开发模式下进行数据同步。");
			return;
		}
		Dto inDto = Dtos.newDto(request);
		iconService.syncIcon(inDto);
		WebCxt.write(response, "图标数据同步成功。");
	}
}
