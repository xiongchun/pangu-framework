package cn.osworks.aos.modules.system.controller.masterdata;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.base.asset.AOSCxt;
import cn.osworks.aos.base.asset.AOSJson;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.asset.WebCxt;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.modules.system.service.masterdata.ParamService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 参数表控制器
 * 
 * @author OSWorks-XC
 * @date 2014-06-06
 */
@Controller
@RequestMapping(value = "system/param/")
public class ParamController {

	@Autowired
	private ParamService paramService;

	/**
	 * 页面初始化
	 *
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init() {
		return "aos/masterdata/param.jsp";
	}

	/**
	 * 查询参数列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listParams")
	public void listParams(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("id_ DESC");
		List<Dto> list = AOSCxt.sqlDao.list("MasterData.listParamInfos4Page", qDto);
		String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 保存参数信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveParam")
	public void saveParam(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = paramService.saveParam(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 修改参数信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateParam")
	public void updateParam(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = paramService.updateParam(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 删除参数信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteParam")
	public void deleteParam(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		int rows = paramService.deleteParam(dto);
		String outString = AOSUtils.merge("操作完成，成功删除[{0}]条参数数据。", rows);
		WebCxt.write(response, outString);
	}

}
