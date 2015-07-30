package cn.osworks.aos.system.modules.controller.toolkit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_iconMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_iconPO;
import cn.osworks.aos.system.modules.service.SystemService;
import cn.osworks.aos.system.modules.service.toolkit.IconService;

import com.google.common.collect.Lists;

/**
 * 图标大全控制器
 * 
 * @author OSWorks-XC
 * @date 2014-10-30
 */
@Controller
@RequestMapping(value = "system/icon")
public class IconController {

	@Autowired
	private Aos_sys_iconMapper aos_sys_iconMapper;
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
		request.setAttribute("page_load_msg_", WebCxt.getCfgOfDB("page_load_msg_"));
		return "aos/toolkit/icon/icon.jsp";
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
		return "aos/toolkit/icon/iconList.jsp";
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
		List<Aos_sys_iconPO> list = aos_sys_iconMapper.like(inDto);
		List<Dto> newList = Lists.newArrayList();
		Dto dto = Dtos.newDto();
		for (Aos_sys_iconPO aos_sys_iconPO : list) {
			dto = aos_sys_iconPO.toDto();
			// 截取过长字符串
			dto.put("name_s", StringUtils.substring(aos_sys_iconPO.getName_(), 0, 14));
			String htmlString = "";
			if (aos_sys_iconPO.getType_().equals("1")) {
				htmlString = "<img width=\"16\" height=\"16\" src=\"" + System.getProperty(AOSCons.CXT_KEY)
						+ "/static/icon/" + aos_sys_iconPO.getName_() + "\" />";
			} else if (aos_sys_iconPO.getType_().equals("2")) {
				htmlString = "<img width=\"64\" height=\"64\" src=\"" + System.getProperty(AOSCons.CXT_KEY)
						+ "/static/icon/big64/" + aos_sys_iconPO.getName_() + "\" />";
			} else if (aos_sys_iconPO.getType_().equals("3")) {
				htmlString = "<i class=\"fa " + aos_sys_iconPO.getName_() + " fa-lg\"></i>";
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
		if (StringUtils.equals(AOSCons.RUNAS_PRO,  WebCxt.getCfgOfDB("run_mode_"))) {
			WebCxt.write(response, "同步操作被取消，只能在开发模式下进行数据同步。");
			return;
		}
		Dto inDto = Dtos.newDto(request);
		iconService.syncIcon(inDto);
		WebCxt.write(response, "图标数据同步成功。");
	}
}
