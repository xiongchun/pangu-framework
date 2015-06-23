package cn.osworks.aos.modules.builder.service;

import java.io.File;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_iconMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_iconPO;
import cn.osworks.aos.web.misc.DicCons;
import cn.osworks.aos.web.misc.IdCons;


/**
 * 图标服务
 * 
 * @author OSWorks-XC
 * @date 2014-06-16
 */
@Service
public class IconService {

	@Autowired
	private Aos_ge_iconMapper aos_ge_iconMapper;
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
	public void syncSmallIcon(Dto inDto) {
		String path = System.getProperty("user.dir");
		path = path + "/webapp/static/icon";
		File dirFile = new File(path);
		File[] files = dirFile.listFiles();
		sqlDao.delete("Builder.deleteAos_ge_iconByDto", Dtos.newDto("type_", DicCons.SMALL_FILE_ICON));
		for (File file : files) {
			if (file.isFile()) {
				String fileName = file.getName();
				Dto qDto = Dtos.newDto();
				qDto.put("name_", fileName);
				qDto.put("type_", DicCons.SMALL_FILE_ICON);
				int rows = aos_ge_iconMapper.rows(qDto);
				if (rows > 0) {
					continue;
				}
				Aos_ge_iconPO aos_ge_iconPO = new Aos_ge_iconPO();
				aos_ge_iconPO.setId_(AOSId.id(IdCons.ICONID));
				aos_ge_iconPO.setName_(fileName);
				aos_ge_iconPO.setType_(DicCons.SMALL_FILE_ICON);
				aos_ge_iconMapper.insert(aos_ge_iconPO);
			}
		}
	}
	
	/**
	 * 同步大图标
	 */
	public void syncBigIcon(Dto inDto) {
		String path = System.getProperty("user.dir");
		path = path + "/webapp/static/icon/big64";
		File dirFile = new File(path);
		File[] files = dirFile.listFiles();
		sqlDao.delete("Builder.deleteAos_ge_iconByDto", Dtos.newDto("type_", DicCons.BIG_FILE_ICON));
		for (File file : files) {
			if (file.isFile()) {
				String fileName = file.getName();
				Dto qDto = Dtos.newDto();
				qDto.put("name_", fileName);
				qDto.put("type_", DicCons.BIG_FILE_ICON);
				int rows = aos_ge_iconMapper.rows(qDto);
				if (rows > 0) {
					continue;
				}
				Aos_ge_iconPO aos_ge_iconPO = new Aos_ge_iconPO();
				aos_ge_iconPO.setId_(AOSId.id(IdCons.ICONID));
				aos_ge_iconPO.setName_(fileName);
				aos_ge_iconPO.setType_(DicCons.BIG_FILE_ICON);
				aos_ge_iconMapper.insert(aos_ge_iconPO);
			}
		}
	}

}
