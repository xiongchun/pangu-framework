package cn.osworks.aos.system.modules.controller.resource;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_bytearrayMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_bytearrayPO;
import cn.osworks.aos.system.modules.service.resource.ByteObjService;

/**
 * 流文件控制器
 *
 * @author OSWorks-XC
 * @date 2014-05-30
 */
@Controller
@RequestMapping(value = "system/byteObj")
public class ByteObjController {

    @Autowired
    private ByteObjService byteObjService;
    @Autowired
    private Aos_sys_bytearrayMapper aos_sys_bytearrayMapper;

    /**
     * 页面初始化
     *
     * @return
     */
    @RequestMapping(value = "init")
    public String init() {
        return "aos/resource/byteObj.jsp";
    }

    /**
     * 查询列表
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "listByteObjs")
    public void listByteObjs(HttpServletRequest request, HttpServletResponse response) {
        Dto qDto = Dtos.newDto(request);
        List<Dto> list = AOSCxt.sysDao.list("Resource.listByteObjs4Page", qDto);
        String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
        WebCxt.write(response, outString);
    }

    /**
     * 查看/下载流文件
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "viewByteObj")
    public void viewByteObj(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Dto inDto = Dtos.newDto(request);
        Aos_sys_bytearrayPO aos_sys_bytearrayPO = aos_sys_bytearrayMapper.selectByKey(inDto.getString("id_"));
        if (AOSUtils.isNotEmpty(aos_sys_bytearrayPO)) {
            byte[] bytes = aos_sys_bytearrayPO.getBytes_();
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes);
            outputStream.flush();
            outputStream.close();
		}
    }

    /**
     * 下载流文件
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "downByteObj")
    public void downByteObj(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Dto inDto = Dtos.newDto(request);
        Aos_sys_bytearrayPO aos_sys_bytearrayPO = aos_sys_bytearrayMapper.selectByKey(inDto.getString("id_"));
        String filename = AOSUtils.encodeChineseDownloadFileName(request.getHeader("USER-AGENT"), aos_sys_bytearrayPO.getName_());
        response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
        byte[] bytes = aos_sys_bytearrayPO.getBytes_();
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(bytes);
        outputStream.flush();
        outputStream.close();
    }

    /**
     * 保存流文件信息
     *
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = "saveByteObj")
    public void saveByteObj(@RequestParam("myfile_") MultipartFile myfile_, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Dto inDto = Dtos.newDto(request);
        long size_ = myfile_.getSize()/1024; //以KB为单位存储
        long maxSize = NumberUtils.toLong(WebCxt.getCfgOfDB("byteobj_maxsize_"));
        if (size_ > maxSize) {
            WebCxt.write(response, AOSCons.ERROR, AOSUtils.merge("操作被取消，文件大小不能超过{0}KB。", maxSize));
            return;
        }
        inDto.put("myfile_", myfile_);
        inDto.put("size_", size_);
        byteObjService.saveByteObj(inDto);
        WebCxt.write(response, "操作完成，流文件数据新增成功。");
    }

    /**
     * 修改流文件信息
     *
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = "updateByteObj")
    public void updateByteObj(@RequestParam("myfile_") MultipartFile myfile_, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Dto inDto = Dtos.newDto(request);
        if (myfile_ != null && myfile_.getSize() > 0){
            long size_ = myfile_.getSize()/1024; //以KB为单位存储
            long maxSize = NumberUtils.toLong(WebCxt.getCfgOfDB("byteobj_maxsize_"));
            if (size_ > maxSize) {
                WebCxt.write(response, AOSCons.ERROR, AOSUtils.merge("操作被取消，文件大小不能超过{0}KB。", maxSize));
                return;
            }
            inDto.put("myfile_", myfile_);
        }
        Dto outDto = byteObjService.updateByteObj(inDto);
        WebCxt.write(response, AOSJson.toJson(outDto));
    }

    /**
     * 删除流文件信息
     *
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = "deleteByteObj")
    public void deleteByteObj(HttpServletRequest request, HttpServletResponse response) {
        Dto dto = Dtos.newDto(request);
        int rows = byteObjService.deleteByteObj(dto);
        String outString = AOSUtils.merge("操作完成，成功删除[{0}]条流文件数据。", rows);
        WebCxt.write(response, outString);
    }

}
