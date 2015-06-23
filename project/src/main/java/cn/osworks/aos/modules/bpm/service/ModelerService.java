package cn.osworks.aos.modules.bpm.service;

import java.io.UnsupportedEncodingException;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_bp_ext_modelMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_bp_ext_modelPO;
import cn.osworks.aos.modules.system.dao.vo.UserInfoVO;
import cn.osworks.aos.web.misc.DicCons;
import cn.osworks.aos.web.misc.IdCons;


/**
 * 流程模型服务
 *
 * @author OSWorks-XC
 * @date 2014-12-16
 */
@Service
public class ModelerService {

	@Autowired
    private Aos_bp_ext_modelMapper aos_bp_ext_modelMapper;
    @Autowired
    private RepositoryService repositoryService;

    /**
     * 新增模型数据
     *
     * @throws UnsupportedEncodingException
     */
    public String newModel(Dto inDto) throws UnsupportedEncodingException {
        // 模型新增
        Model model = repositoryService.newModel();
        model.setName(inDto.getString("name"));
        //model.setMetaInfo(inDto.getString("json_xml")); 这个字段具体用途有待研究。为了避免字符长度超限，此处忽略不写表。
        repositoryService.saveModel(model);
        //插入大对象
        repositoryService.addModelEditorSource(model.getId(), inDto.getString("json_xml").getBytes("utf-8"));
        String model_id_ = model.getId();
        //写扩展表
        UserInfoVO userInfoVO = inDto.getUserInfo();
        Aos_bp_ext_modelPO aos_bp_ext_modelPO = new Aos_bp_ext_modelPO();
        aos_bp_ext_modelPO.setId_(AOSId.id(IdCons.BPMID));
        aos_bp_ext_modelPO.setModel_id_(model_id_);
        aos_bp_ext_modelPO.setCreate_type_(inDto.getString("create_type_"));
        aos_bp_ext_modelPO.setName_(inDto.getString("name"));
        aos_bp_ext_modelPO.setCreate_user_id_(userInfoVO.getId_());
        aos_bp_ext_modelPO.setCreate_user_(userInfoVO.getName_());
        aos_bp_ext_modelPO.setCreate_time_(AOSUtils.getDateTimeStr());
        aos_bp_ext_modelPO.setRemark_(inDto.getString("description"));
        aos_bp_ext_modelMapper.insert(aos_bp_ext_modelPO);
        return model_id_;
    }

    /**
     * 修改模型
     *
     * @throws UnsupportedEncodingException
     */
    public void updateModel(Dto inDto) throws UnsupportedEncodingException {
        String modelId = inDto.getString("id");
        //更新大对象
        repositoryService.addModelEditorSource(modelId, inDto.getString("json_xml").getBytes("utf-8"));
        //更新re_model表
        Model model = repositoryService.getModel(modelId);
        model.setName(inDto.getString("name"));
        repositoryService.saveModel(model);
        //更新扩展表
        Aos_bp_ext_modelPO aos_bp_ext_modelPO = aos_bp_ext_modelMapper.selectOne(Dtos.newDto("model_id_", modelId));
        aos_bp_ext_modelPO.setName_(inDto.getString("name"));
        aos_bp_ext_modelPO.setRemark_(inDto.getString("description"));
        aos_bp_ext_modelMapper.updateByKey(aos_bp_ext_modelPO);
    }
    
    /**
     * 保存Modeler模型数据
     * @throws UnsupportedEncodingException 
     *
     */
    public Dto saveModel(Dto inDto) throws UnsupportedEncodingException{
        String id = inDto.getString("id");
        String modelId = "";
        if (StringUtils.equals(id, "-1")) {
            //接收新增模型设计的请求
            String _aos_modelID = inDto.getString("_aos_modelID");
            if (AOSUtils.isEmpty(_aos_modelID)) {
                // 模型新增
                inDto.put("create_type_", DicCons.CREATE_TYPE_DESIGN);
                modelId = newModel(inDto);
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
