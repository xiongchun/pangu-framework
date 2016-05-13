package cn.osworks.aos.system.modules.controller.log;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.po.Aos_log_sessionPO;
import cn.osworks.aos.system.modules.service.log.LogService;

/**
 * 会话日志控制器
 * 
 * @author OSWorks-XC
 * @date 2014-05-30
 */
@Controller
@RequestMapping(value = "system/sessionLog")
public class SessionLogController {
	
	@Autowired
	private LogService logService;

	/**
	 * 页面初始化
	 *
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init() {
		return "aos/log/sessionLog.jsp";
	}

	/**
	 * 查询参数列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listSessions")
	public void listSessions(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Aos_log_sessionPO> list = logService.listSessions(qDto);
		String outString = AOSJson.toJson(list);
		WebCxt.write(response, outString);
	}
}
