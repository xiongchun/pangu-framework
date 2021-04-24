package org.g4studio.system.admin.web;

import java.math.BigDecimal;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.web.BaseAction;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.report.fcf.FcfDataMapper;
import org.g4studio.core.web.report.fcf.GraphConfig;
import org.g4studio.core.web.report.fcf.Set;

/**
 * 获取服务器信息及内存CPU实时监控
 * 
 * @author OSWorks-XC
 * @since 2010-04-21
 * @see BaseAction
 */
public class ServerInfoAction extends BaseAction {

	/**
	 * 页面初始化
	 * 
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		removeSessionAttribute(request, "JVM_MEM_LIST");
		removeSessionAttribute(request, "HOST_MEM_LIST");
		removeSessionAttribute(request, "HOST_CPU_LIST");
		InetAddress localhost = InetAddress.getLocalHost();
		Dto outDto = new BaseDto();
		outDto.put("a.操作系统", System.getProperty("os.name") + "_" + System.getProperty("os.arch"));
		outDto.put("b.主机IP", "" + localhost.getHostAddress());
		outDto.put("c.应用服务器", getServlet().getServletContext().getServerInfo());
		outDto.put("d.监听端口", request.getServerPort());
		outDto.put("e.Web根路径", getServlet().getServletContext().getRealPath("/"));
		outDto.put("f.Servlet版本", getServlet().getServletContext().getMajorVersion() + "."
				+ getServlet().getServletContext().getMinorVersion());
		outDto.put("g.JVM版本", System.getProperty("java.version"));
		outDto.put("h.JVM提供商", System.getProperty("java.vendor"));
		outDto.put("i.JVM安装路径", System.getProperty("java.home"));
		outDto.put("k.JVM可用最大内存", Runtime.getRuntime().maxMemory() / 1024 / 1024 + "M");
		request.setAttribute("jsonInfo", outDto.toJson());

		String caption = "JVM内存使用情况实时监控图(";
		caption = caption + "可分配总内存:" + new Double(Runtime.getRuntime().maxMemory() / 1024 / 1024).intValue() + "M ";
		caption = caption + "已分配总内存:" + new Double(Runtime.getRuntime().totalMemory() / 1024 / 1024).intValue() + "M ";
		caption = caption
				+ "已用内存:"
				+ new Double((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()) / 1024 / 1024)
						.intValue() + "M)";
		// updateJvmChart(mapping, form, request, response);
		return mapping.findForward("serverInfoView");
	}

	/**
	 * 更新JVM内存监控图
	 * 
	 */
	public ActionForward updateJvmChart(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String caption = "JVM内存使用情况实时监控图(";
		caption = caption + "可分配总内存:" + new Double(Runtime.getRuntime().maxMemory() / 1024 / 1024).intValue() + "M ";
		caption = caption + "已分配总内存:" + new Double(Runtime.getRuntime().totalMemory() / 1024 / 1024).intValue() + "M ";
		caption = caption
				+ "已用内存:"
				+ new Double((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()) / 1024 / 1024)
						.intValue() + "M)";
		GraphConfig graphConfig = new GraphConfig();
		graphConfig.setCaption(caption);
		graphConfig.put("divLineColor", "008ED6");
		graphConfig.put("divLineAlpha", "20");
		graphConfig.put("showAlternateHGridColor", "1");
		graphConfig.put("AlternateHGridColor", "BFFFFF");
		graphConfig.put("alternateHGridAlpha", "20");
		graphConfig.put("numberSuffix", "M");
		graphConfig.put("decimalPrecision", "0");
		graphConfig.put("limitsDecimalPrecision", "0");
		graphConfig.put("anchorRadius", "3");
		graphConfig.setXAxisName("%(已用内存/已分配的总内存)");

		List dataList = (ArrayList) getSessionAttribute(request, "JVM_MEM_LIST");
		if (G4Utils.isEmpty(dataList)) {
			dataList = new ArrayList();
		}
		long used = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
		Set set0 = new Set();
		set0.setName(new BigDecimal(used)
				.divide(new BigDecimal(Runtime.getRuntime().totalMemory()), 2, BigDecimal.ROUND_HALF_UP)
				.multiply(new BigDecimal(100)).intValue()
				+ "%");

		set0.setValue(new Double(used / 1024 / 1024).intValue() + "");
		set0.setColor(G4Constants.CHART_COLORS[G4Utils.getRandom(0, 10).intValue()]);
		dataList.add(set0);
		while (dataList.size() > 10) {
			dataList.remove(dataList.size() - 10);
		}
		setSessionAttribute(request, "JVM_MEM_LIST", dataList);
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("xmlstring", xmlString);
		write(JsonHelper.encodeObject2Json(outDto), response);
		return null;
	}
}
