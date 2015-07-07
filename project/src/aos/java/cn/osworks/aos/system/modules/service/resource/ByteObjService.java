package cn.osworks.aos.system.modules.service.resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.IdCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_bytearrayMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_bytearrayPO;
import cn.osworks.aos.system.dao.po.Aos_sys_catalogPO;

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
    private Aos_sys_bytearrayMapper aos_sys_bytearrayMapper;
    @Autowired
    private Aos_sys_catalogMapper aos_sys_catalogMapper;

    /**
     * 保存流文件信息
     *
     * @param inDto
     */
    @Transactional
    public String saveByteObj(Dto inDto) throws IOException {
        Aos_sys_bytearrayPO aos_sys_bytearrayPO = new Aos_sys_bytearrayPO();
        AOSUtils.apply(inDto, aos_sys_bytearrayPO);
        aos_sys_bytearrayPO.setId_(AOSId.id(IdCons.GID));
        Aos_sys_catalogPO aos_sys_catalogPO = aos_sys_catalogMapper.selectByKey(aos_sys_bytearrayPO.getCatalog_id_());
        aos_sys_bytearrayPO.setCatalog_cascade_id_(aos_sys_catalogPO.getCascade_id_());
        MultipartFile myfile_ = (MultipartFile) inDto.get("myfile_");
        aos_sys_bytearrayPO.setBytes_(myfile_.getBytes());
        aos_sys_bytearrayPO.setContent_type_(myfile_.getContentType());
        aos_sys_bytearrayPO.setName_(myfile_.getOriginalFilename());
        aos_sys_bytearrayPO.setSize_(new Long(myfile_.getSize()/1000).intValue());
        if (AOSUtils.isEmpty(aos_sys_bytearrayPO.getKey_())) {
            aos_sys_bytearrayPO.setKey_(AOSId.uuid());
        }
        aos_sys_bytearrayPO.setCreate_time_(AOSUtils.getDateTimeStr());
        aos_sys_bytearrayPO.setCreater_id_(inDto.getUserInfo().getId_());
        aos_sys_bytearrayMapper.insert(aos_sys_bytearrayPO);
        return aos_sys_bytearrayPO.getId_();
    }

    /**
     * 修改流文件信息
     *
     * @param inDto
     */
    @Transactional
    public Dto updateByteObj(Dto inDto) throws IOException {
        Dto outDto = Dtos.newOutDto();
        String key_ = inDto.getString("key_");
        String old_key_ = inDto.getString("old_key_");
        if (!StringUtils.equalsIgnoreCase(key_, old_key_)){
            Aos_sys_bytearrayPO temp_obj_ = aos_sys_bytearrayMapper.selectOne(Dtos.newDto("key_", key_));
            if (AOSUtils.isNotEmpty(temp_obj_)) {
                outDto.setAppCode(-1);
                outDto.setAppMsg(AOSUtils.merge("标识键[{0}]已被占用, 请修改后再保存。", key_));
                return outDto;
            }
        }
        Aos_sys_bytearrayPO aos_sys_bytearrayPO = new Aos_sys_bytearrayPO();
        AOSUtils.apply(inDto, aos_sys_bytearrayPO);
        Aos_sys_catalogPO aos_sys_catalogPO = aos_sys_catalogMapper.selectByKey(aos_sys_bytearrayPO.getCatalog_id_());
        aos_sys_bytearrayPO.setCatalog_cascade_id_((aos_sys_catalogPO.getCascade_id_()));
        MultipartFile myfile_ = (MultipartFile) inDto.get("myfile_");
        if (myfile_ != null && myfile_.getSize() > 0) {
            aos_sys_bytearrayPO.setBytes_(myfile_.getBytes());
            aos_sys_bytearrayPO.setContent_type_(myfile_.getContentType());
            aos_sys_bytearrayPO.setName_(myfile_.getOriginalFilename());
            aos_sys_bytearrayPO.setSize_(new Long(myfile_.getSize()/1000).intValue());
            if (AOSUtils.isEmpty(aos_sys_bytearrayPO.getKey_())) {
                aos_sys_bytearrayPO.setKey_(AOSId.uuid());
            }
        }
        aos_sys_bytearrayMapper.updateByKey(aos_sys_bytearrayPO);
        outDto.setAppMsg("操作完成，流文件数据修改成功。");
        return outDto;
    }

    /**
     * 删除流文件数据
     *
     * @param qDto
     */
    @Transactional
    public int deleteByteObj(Dto qDto) {
        String[] selections = qDto.getSelection();
        int rows = 0;
        for (String id_ : selections) {
            aos_sys_bytearrayMapper.deleteByKey(id_);
            rows++;
        }
        return rows;
    }
}
