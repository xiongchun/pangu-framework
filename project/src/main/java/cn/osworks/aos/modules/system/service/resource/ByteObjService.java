package cn.osworks.aos.modules.system.service.resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_bytearrayMapper;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_catalogMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_bytearrayPO;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_catalogPO;
import cn.osworks.aos.web.misc.IdCons;

import java.io.IOException;

/**
 * <b>流文件服务</b>
 *
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class ByteObjService {

    @Autowired
    private Aos_ge_bytearrayMapper aos_ge_bytearrayMapper;
    @Autowired
    private Aos_ge_catalogMapper aos_ge_catalogMapper;

    /**
     * 保存流文件信息
     *
     * @param inDto
     */
    public String saveByteObj(Dto inDto) throws IOException {
        Aos_ge_bytearrayPO aos_ge_bytearrayPO = new Aos_ge_bytearrayPO();
        AOSUtils.apply(inDto, aos_ge_bytearrayPO);
        aos_ge_bytearrayPO.setId_(AOSId.id(IdCons.GID));
        Aos_ge_catalogPO aos_ge_catalogPO = aos_ge_catalogMapper.selectByKey(aos_ge_bytearrayPO.getCatalog_id_());
        aos_ge_bytearrayPO.setCatalog_cascade_id_(aos_ge_catalogPO.getCascade_id_());
        MultipartFile myfile_ = (MultipartFile) inDto.get("myfile_");
        aos_ge_bytearrayPO.setBytes_(myfile_.getBytes());
        aos_ge_bytearrayPO.setContent_type_(myfile_.getContentType());
        aos_ge_bytearrayPO.setName_(myfile_.getOriginalFilename());
        aos_ge_bytearrayPO.setSize_(new Long(myfile_.getSize()/1000).intValue());
        if (AOSUtils.isEmpty(aos_ge_bytearrayPO.getKey_())) {
            aos_ge_bytearrayPO.setKey_(AOSId.uuid());
        }
        aos_ge_bytearrayPO.setCreate_time_(AOSUtils.getDateTimeStr());
        aos_ge_bytearrayPO.setCreater_id_(inDto.getUserInfo().getId_());
        aos_ge_bytearrayMapper.insert(aos_ge_bytearrayPO);
        return aos_ge_bytearrayPO.getId_();
    }

    /**
     * 修改流文件信息
     *
     * @param inDto
     */
    public Dto updateByteObj(Dto inDto) throws IOException {
        Dto outDto = Dtos.newOutDto();
        String key_ = inDto.getString("key_");
        String old_key_ = inDto.getString("old_key_");
        if (!StringUtils.equalsIgnoreCase(key_, old_key_)){
            Aos_ge_bytearrayPO temp_obj_ = aos_ge_bytearrayMapper.selectOne(Dtos.newDto("key_", key_));
            if (AOSUtils.isNotEmpty(temp_obj_)) {
                outDto.setAppCode(-1);
                outDto.setAppMsg(AOSUtils.merge("标识键[{0}]已被占用, 请修改后再保存。", key_));
                return outDto;
            }
        }
        Aos_ge_bytearrayPO aos_ge_bytearrayPO = new Aos_ge_bytearrayPO();
        AOSUtils.apply(inDto, aos_ge_bytearrayPO);
        Aos_ge_catalogPO aos_ge_catalogPO = aos_ge_catalogMapper.selectByKey(aos_ge_bytearrayPO.getCatalog_id_());
        aos_ge_bytearrayPO.setCatalog_cascade_id_((aos_ge_catalogPO.getCascade_id_()));
        MultipartFile myfile_ = (MultipartFile) inDto.get("myfile_");
        if (myfile_ != null && myfile_.getSize() > 0) {
            aos_ge_bytearrayPO.setBytes_(myfile_.getBytes());
            aos_ge_bytearrayPO.setContent_type_(myfile_.getContentType());
            aos_ge_bytearrayPO.setName_(myfile_.getOriginalFilename());
            aos_ge_bytearrayPO.setSize_(new Long(myfile_.getSize()/1000).intValue());
            if (AOSUtils.isEmpty(aos_ge_bytearrayPO.getKey_())) {
                aos_ge_bytearrayPO.setKey_(AOSId.uuid());
            }
        }
        aos_ge_bytearrayMapper.updateByKey(aos_ge_bytearrayPO);
        outDto.setAppMsg("操作完成，流文件数据修改成功。");
        return outDto;
    }

    /**
     * 删除流文件数据
     *
     * @param qDto
     */
    public int deleteByteObj(Dto qDto) {
        String[] selections = qDto.getSelection();
        int rows = 0;
        for (String id_ : selections) {
            aos_ge_bytearrayMapper.deleteByKey(id_);
            rows++;
        }
        return rows;
    }
}
