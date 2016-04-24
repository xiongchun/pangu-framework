package cn.osworks.aos.system.modules.controller.masterdata;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dic_indexPO;
import cn.osworks.aos.system.modules.service.masterdata.DictionaryService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 数据字典控制器
 * 
 * @author OSWorks-XC
 * @date 2014-06-06
 */
@Controller
@RequestMapping(value = "system/dictionary")
public class DictionaryController {
	
	@Autowired
	private DictionaryService dictionaryService;
	
	@Autowired
	private SqlDao sqlDao;
	
	/**
	 * 页面初始化
	 *
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init() {
		return "aos/masterdata/dictionary.jsp";
	}
	
	/**
	 * 查询数据字典索引表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listDicindexInfos")
	public void listDicindexInfos(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("id_ DESC");
		List<Aos_sys_dic_indexPO> list = sqlDao.list("MasterData.listDicindexInfos", qDto);
		String outString = AOSJson.toGridJson(list, list.size());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询数据字典表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listDicInfos")
	public void listDicInfos(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.setOrder("code_, id_ DESC");
		List<Aos_sys_dicPO> list = sqlDao.list("MasterData.listDicInfos", qDto);
		String outString = AOSJson.toGridJson(list, list.size());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存字典索引信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveIndex")
	public void saveIndex(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = dictionaryService.saveIndex(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 保存字典对照信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveDic")
	public void saveDic(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		dictionaryService.saveDic(dto);
		WebCxt.write(response, "操作完成，数据字典对照明细新增成功。");
	}
	
	/**
	 * 修改数据字典索引信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateIndex")
	public void updateIndex(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = dictionaryService.updateIndex(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改数据字典对照明细信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateDic")
	public void updateDic(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		dictionaryService.updateDic(dto);
		WebCxt.write(response, "操作完成，数据字典对照修改成功。");
	}
	
	/**
	 * 删除数据字典索引信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteIndex")
	public void deleteIndex(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		int rows = dictionaryService.deleteIndex(dto);
		String outString = AOSUtils.merge("操作完成，成功删除[{0}]条数据。", rows);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 删除数据字典对照信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteDic")
	public void deleteDic(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		int rows = dictionaryService.deleteDic(dto);
		String outString = AOSUtils.merge("操作完成，成功删除[{0}]条数据。", rows);
		WebCxt.write(response, outString);
	}
}
