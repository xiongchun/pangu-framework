package cn.osworks.aos.system.modules.service.toolkit;

import java.io.File;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_iconMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_iconPO;


/**
 * 图标服务
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Service
public class IconService {

	@Autowired
	private Aos_sys_iconMapper aos_sys_iconMapper;
	@Autowired
	private SqlDao sqlDao;

	/**
	 * 同步图标
	 */
	public void syncIcon(Dto inDto) {
		if (StringUtils.equals(inDto.getString("type_"), DicCons.SMALL_FILE_ICON)) {
			syncSmallIcon(inDto);
		}else {
			syncBigIcon(inDto);
		}
	}
	
	/**
	 * 同步小图标
	 */
	@Transactional
	public void syncSmallIcon(Dto inDto) {
		String path = System.getProperty("user.dir");
		path = path + "/webapp/static/icon";
		File dirFile = new File(path);
		File[] files = dirFile.listFiles();
		sqlDao.delete("Builder.deleteAos_sys_iconByDto", Dtos.newDto("type_", DicCons.SMALL_FILE_ICON));
		for (File file : files) {
			if (file.isFile()) {
				String fileName = file.getName();
				Dto qDto = Dtos.newDto();
				qDto.put("name_", fileName);
				qDto.put("type_", DicCons.SMALL_FILE_ICON);
				int rows = aos_sys_iconMapper.rows(qDto);
				if (rows > 0) {
					continue;
				}
				Aos_sys_iconPO aos_sys_iconPO = new Aos_sys_iconPO();
				aos_sys_iconPO.setId_(AOSId.uuid());
				aos_sys_iconPO.setName_(fileName);
				aos_sys_iconPO.setType_(DicCons.SMALL_FILE_ICON);
				aos_sys_iconMapper.insert(aos_sys_iconPO);
			}
		}
	}
	
	/**
	 * 同步大图标
	 */
	@Transactional
	public void syncBigIcon(Dto inDto) {
		String path = System.getProperty("user.dir");
		path = path + "/webapp/static/icon/big64";
		File dirFile = new File(path);
		File[] files = dirFile.listFiles();
		sqlDao.delete("Builder.deleteAos_sys_iconByDto", Dtos.newDto("type_", DicCons.BIG_FILE_ICON));
		for (File file : files) {
			if (file.isFile()) {
				String fileName = file.getName();
				Dto qDto = Dtos.newDto();
				qDto.put("name_", fileName);
				qDto.put("type_", DicCons.BIG_FILE_ICON);
				int rows = aos_sys_iconMapper.rows(qDto);
				if (rows > 0) {
					continue;
				}
				Aos_sys_iconPO aos_sys_iconPO = new Aos_sys_iconPO();
				aos_sys_iconPO.setId_(AOSId.uuid());
				aos_sys_iconPO.setName_(fileName);
				aos_sys_iconPO.setType_(DicCons.BIG_FILE_ICON);
				aos_sys_iconMapper.insert(aos_sys_iconPO);
			}
		}
	}

}
