package cn.osworks.aos.system.modules.controller.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_sequenceMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_sequencePO;
import cn.osworks.aos.system.modules.service.resource.IdMgrService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 分类科目控制器
 * 
 * @author OSWorks-XC
 * @date 2014-05-30
 */
@Controller
@RequestMapping(value = "system/idMgr")
public class IdMgrController {

	@Autowired
	private Aos_sys_sequenceMapper aos_sys_sequenceMapper;

	@Autowired
	private IdMgrService idMgrService;

	/**
	 * 页面初始化
	 *
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init() {
		return "aos/resource/idMgr.jsp";
	}

	/**
	 * 查询ID配置列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listIds")
	public void listIds(HttpServletRequest request, HttpServletResponse response) {
		Dto pDto = Dtos.newDto(request);
		pDto.setOrder("id_ DESC");
		List<Aos_sys_sequencePO> list = aos_sys_sequenceMapper.likePage(pDto);
		for (Aos_sys_sequencePO aos_sys_sequencePO : list) {
			if (DicCons.SEQUENCE_TYPE_UUID.equals(aos_sys_sequencePO.getType_()) || DicCons.SEQUENCE_TYPE_DBSEQUENCE.equals(aos_sys_sequencePO.getType_())) {
				aos_sys_sequencePO.setStart_(null);
				aos_sys_sequencePO.setStep_(null);
				aos_sys_sequencePO.setDb_seq_name_(null);
				aos_sys_sequencePO.setMax_value_(null);
				aos_sys_sequencePO.setMin_value_(null);
			}
		}
		String outString = AOSJson.toGridJson(list, pDto.getPageTotal());
		WebCxt.write(response, outString);
	}

	/**
	 * 保存ID信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveId")
	public void saveId(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = idMgrService.saveId(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}

	/**
	 * 修改ID信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateId")
	public void updateId(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		idMgrService.updateId(dto);
		WebCxt.write(response, "操作完成，数据修改成功。");
	}

	/**
	 * 删除ID信息
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteId")
	public void deleteId(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		int rows = idMgrService.deleteId(dto);
		String outString = AOSUtils.merge("操作完成，成功删除[{0}]条数据。", rows);
		WebCxt.write(response, outString);
	}

	/**
	 * 计算ID
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "calcId")
	public void calcId(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		String id = AOSId.id(dto.getString("name_"));
		String outString = AOSUtils.merge("操作完成，返回ID值为[{0}]。", id);
		WebCxt.write(response, outString);
	}

}
