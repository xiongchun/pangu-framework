package cn.osworks.aos.system.modules.controller.bpm;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.modules.service.bpm.ProcModelService;


/**
 * 流程管理控制器
 *
 * @author OSWorks-XC
 * @date 2014-10-16
 */
@Controller
@RequestMapping(value = "bpm/procModel/")
public class ProcModelController {

    @Autowired
    private ProcModelService procModelService;
    @Autowired
    private SqlDao sqlDao;

    /**
     * 页面初始化
     *
     * @return
     */
    @RequestMapping(value = "init")
    public String init() {
        return "aos/bpm/procModel.jsp";
    }

    /**
     * 查询模型列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "listModels")
    public void listModels(HttpServletRequest request, HttpServletResponse response) {
        Dto qDto = Dtos.newDto(request);
        List<Dto> list = sqlDao.list("Bpm.listModelsPage", qDto);
        String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
        WebCxt.write(response, outString);
    }

    /**
     * 导入文件模型
     *
     * @param myFile1
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "importFileModel")
    public void importFileModel(@RequestParam("myFile1") MultipartFile myFile1, HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        inDto.put("myFile1", myFile1);
        if (StringUtils.indexOf(myFile1.getOriginalFilename(), ".bpmn") == -1) {
            WebCxt.write(response, "操作被取消，只能导入.bpmn格式的流程模型文件。");
            return;
        }
        procModelService.importFileModel(inDto);
        WebCxt.write(response, "操作完成，模型导入成功。");
    }

    /**
     * 导入文本模型
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "importTextModel")
    public void importTextModel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        procModelService.importTextModel(inDto);
        WebCxt.write(response, "操作完成，模型导入成功。");
    }

    /**
     * 更新模型基本属性
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "updateModelProps")
    public void updateModelProps(HttpServletRequest request, HttpServletResponse response) {
        Dto inDto = Dtos.newDto(request);
        procModelService.updateModelProps(inDto);
        WebCxt.write(response, "操作完成，数据更新成功。");
    }

    /**
     * 删除流程模型
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "deleteModel")
    public void deleteModel(HttpServletRequest request, HttpServletResponse response) {
        Dto inDto = Dtos.newDto(request);
        Dto outDto = procModelService.deleteModel(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }

    /**
     * 发布流程
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "deployModel")
    public void deployModel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Dto inDto = Dtos.newDto(request);
        Dto outDto = procModelService.deployModel(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }

}
