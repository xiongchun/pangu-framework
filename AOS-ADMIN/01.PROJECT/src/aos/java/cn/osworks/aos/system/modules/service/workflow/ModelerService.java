package cn.osworks.aos.system.modules.service.workflow;

import java.io.UnsupportedEncodingException;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;


/**
 * 流程模型服务
 *
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class ModelerService {
	
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private WorkflowService workflowService;

    /**
     * 修改模型
     *
     * @throws UnsupportedEncodingException
     */
    @Transactional
    public void updateModel(Dto inDto) throws UnsupportedEncodingException {
        String modelId = inDto.getString("id");
        //更新大对象
        repositoryService.addModelEditorSource(modelId, inDto.getString("json_xml").getBytes("utf-8"));
        //更新re_model表
        Model model = repositoryService.getModel(modelId);
        model.setName(inDto.getString("name"));
        repositoryService.saveModel(model);
    }
    
    /**
     * 保存Modeler模型数据
     * @throws UnsupportedEncodingException 
     *
     */
    @Transactional
    public Dto saveModel(Dto inDto) throws UnsupportedEncodingException{
        String id = inDto.getString("id");
        String modelId = "";
        if (StringUtils.equals(id, "-1")) {
            //接收新增模型设计的请求
            String _aos_modelID = inDto.getString("_aos_modelID");
            if (AOSUtils.isEmpty(_aos_modelID)) {
                // 模型新增
                inDto.put("create_type_", DicCons.CREATE_TYPE_DESIGN);
                // 模型新增
                Model model = repositoryService.newModel();
                model.setName(inDto.getString("name"));
                repositoryService.saveModel(model);
                //插入大对象
                repositoryService.addModelEditorSource(model.getId(), inDto.getString("json_xml").getBytes("utf-8"));
                modelId = model.getId();
            } else {
                //防止重复新增->转为修改
                inDto.put("id", _aos_modelID);
                updateModel(inDto);
                modelId = _aos_modelID;
            }
        } else {
            //接收修改模型设计的请求
            updateModel(inDto);
        }
        Dto outDto = Dtos.newDto();
        outDto.put("_aos_modelID", modelId);
        outDto.setAppMsg("模型数据保存成功。");
        outDto.put(AOSCons.REQUEST_SUCCESS, true);
        return outDto;
    }
}
