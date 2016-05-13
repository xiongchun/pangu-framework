package cn.osworks.aos.system.modules.controller.masterdata;

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
import cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper;
import cn.osworks.aos.system.modules.service.masterdata.CatalogService;

/**
 * 分类科目控制器
 * 
 * @author OSWorks-XC
 * @date 2014-05-30
 */
@Controller
@RequestMapping(value = "system/catalog")
public class CatalogController {
	
	@Autowired
	 private Aos_sys_catalogMapper aos_sys_catalogMapper;
	@Autowired
	private CatalogService catalogService;
	
	/**
	 * 页面初始化
	 *
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init() {
		return "aos/masterdata/catalog.jsp";
	}

	/**
	 * 查询参数列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listCatalogs")
	public void listCatalogs(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> list = catalogService.listCatalogs(qDto);
		String outString = AOSJson.toJson(list);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存分类科目信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveCatalog")
	public void saveCatalog(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = catalogService.saveCatalog(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改分类科目信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateCatalog")
	public void updateCatalog(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		catalogService.updateCatalog(dto);
		WebCxt.write(response, "操作完成，分类数据修改成功。");
	}
	
	/**
	 * 删除分类信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteCatalog")
	public void deleteCatalog(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = catalogService.deleteCatalog(dto);
		outDto.setAppMsg("操作完成，删除分类数据成功。");
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
}
