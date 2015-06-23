package cn.osworks.aos.modules.builder.factory;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.base.velocity.VelocityHelper;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;
import cn.osworks.aos.modules.builder.dao.vo.TableVO;
import cn.osworks.aos.modules.builder.factory.resources.BuilderResources;
import cn.osworks.aos.modules.builder.misc.BuilderUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.StringWriter;
import java.util.List;

/**
 * <b>代码生成服务</b>
 *
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
@SuppressWarnings("unchecked")
public class MakeFileService {

    private static Log log = LogFactory.getLog(MakeFileService.class);

    /**
     * 后处理TableVO对象
     *
     * @param tableVO
     */
    private void updateTableVO(TableVO tableVO) {
        if (tableVO.getComment() == null) {
            tableVO.setComment("");
        }
    }

    /**
     * 后处理ColumnVO对象
     *
     * @param columnVOs
     */
    private void updateColumnVO(List<ColumnVO> columnVOs) {
        for (ColumnVO columnVO : columnVOs) {
            if (AOSUtils.isEmpty(columnVO.getComment())) {
                columnVO.setComment(columnVO.getName());
            }
        }
    }

    /**
     * 生成*PO.java
     *
     * @param qDto
     */
    public void buildPO(Dto qDto) {
        TableVO tableVO = (TableVO) qDto.get("tableVO");
        this.updateTableVO(tableVO);
        List<ColumnVO> columnVOs = (List<ColumnVO>) qDto.getList("columnVOs");
        this.updateColumnVO(columnVOs);
        String packageString = qDto.getString("package") + ".po";
        Dto vmDto = Dtos.newDto();
        vmDto.put("columnVOs", columnVOs);
        vmDto.put("tableVO", tableVO);
        vmDto.put("package", packageString);
        vmDto.put("importDto", BuilderUtils.getImportDto(columnVOs));
        vmDto.put("author", qDto.getString("author"));
        vmDto.put("sysdate", AOSUtils.getDateTimeStr());
        StringWriter writer = VelocityHelper.mergeFileTemplate(BuilderResources.PO_JAVA_VM, vmDto);
        try {
            String outPath = qDto.getString("outPath") + "//po//";
            FileUtils.forceMkdir(new File(outPath));
            FileOutputStream out = new FileOutputStream(outPath + tableVO.getUpname() + "PO.java");
            out.write(writer.toString().getBytes());
            out.close();
            if (log.isInfoEnabled()) {
                log.info("PO文件[" + packageString + "." + tableVO.getUpname() + "PO.java]生成成功。");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成*Mapper.java
     *
     * @param qDto
     */
    public void buildJavaMapper(Dto qDto) {
        TableVO tableVO = (TableVO) qDto.get("tableVO");
        List<ColumnVO> columnVOs = (List<ColumnVO>) qDto.getList("columnVOs");
        String packageString = qDto.getString("package") + ".mapper";
        Dto vmDto = Dtos.newDto();
        vmDto.put("bykey", BuilderUtils.getByKeyStr(columnVOs));
        vmDto.put("tableVO", tableVO);
        vmDto.put("package", packageString);
        vmDto.put("package_base", qDto.getString("package"));
        vmDto.put("author", qDto.getString("author"));
        vmDto.put("sysdate", AOSUtils.getDateTimeStr());
        StringWriter writer = VelocityHelper.mergeFileTemplate(BuilderResources.MAPPER_JAVA_VM, vmDto);
        try {
            String outPath = qDto.getString("outPath") + "//mapper//";
            FileUtils.forceMkdir(new File(outPath));
            FileOutputStream out = new FileOutputStream(outPath + tableVO.getUpname() + "Mapper.java");
            out.write(writer.toString().getBytes());
            out.close();
            if (log.isInfoEnabled()) {
                log.info("Mapper Java文件[" + packageString + "." +  tableVO.getUpname() + "Mapper.java]生成成功。");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成*Mapper.xml
     *
     * @param qDto
     */
    public void buildXmlMapper(Dto qDto) {
        TableVO tableVO = (TableVO) qDto.get("tableVO");
        List<ColumnVO> columnVOs = (List<ColumnVO>) qDto.getList("columnVOs");
        String packageString = qDto.getString("package") + ".mapper";
        Dto vmDto = Dtos.newDto();
        vmDto.put("columnVOs", columnVOs);
        vmDto.put("bykeywhere", BuilderUtils.getByKeyWhereStr(columnVOs));
        vmDto.put("pkeyColumnVOs", BuilderUtils.getPkeys(columnVOs));
        vmDto.put("tableVO", tableVO);
        vmDto.put("package", packageString);
        vmDto.put("author", qDto.getString("author"));
        vmDto.put("sysdate", AOSUtils.getDateTimeStr());
        for (ColumnVO columnVO : columnVOs) {
            if (columnVO.getJavatype().indexOf("byte") != -1) {
                //标记此表是否含二进制字段
                vmDto.put("hasBinaryField", AOSCons.YES);
            }
        }
        StringWriter writer = VelocityHelper.mergeFileTemplate(BuilderResources.MAPPER_XML_VM, vmDto);
        try {
            String outPath = qDto.getString("outPath") + "//mapper//";
            FileUtils.forceMkdir(new File(outPath));
            FileOutputStream out = new FileOutputStream(outPath + tableVO.getUpname() + "Mapper.xml");
            out.write(writer.toString().getBytes());
            out.close();
            if (log.isInfoEnabled()) {
                log.info("Mapper Xml文件[" + packageString + ".sqlmap." + tableVO.getUpname() + "Mapper.xml]生成成功。");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
