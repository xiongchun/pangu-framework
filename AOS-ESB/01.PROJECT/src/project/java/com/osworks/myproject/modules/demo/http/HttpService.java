package com.osworks.myproject.modules.demo.http;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.osworks.myproject.common.dao.mapper.Demo_accountMapper;
import com.osworks.myproject.common.dao.po.Demo_accountPO;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

/**
 * 演示模块
 * 
 * @author xiongchun
 */
@Service
public class HttpService {
	
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Demo_accountMapper demo_accountMapper;
	
	/**
	 * 查询账户信息
	 * @return
	 */
	public List<Demo_accountPO> listAccounts(){
		Dto inDto = Dtos.newDto("name_", "熊");
		List<Demo_accountPO> list = demo_accountMapper.like(inDto);
		return list;
	}
	
	/**
	 * 查询账户信息2
	 * @return
	 */
	public Dto getAccount(){
		Dto outDto = sqlDao.selectDto("Http.selectAccountInfo", Dtos.newDto());
		return outDto;
	}
	
	/**
	 * 保存文本数据
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto){
		Dto outDto = Dtos.newOutDto();
		inDto.println();
		outDto.setAppMsg("数据保存成功!");
		return outDto;
	}
	
	/**
	 * 上传文件
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto upload(Dto inDto){
		Dto outDto = Dtos.newOutDto();
		inDto.println();
		MultipartFile myFile1 = (MultipartFile)inDto.get("myFile1");
		System.out.println("文件1名称：" + myFile1.getOriginalFilename());
		System.out.println("文件1大小：" + myFile1.getSize());
		MultipartFile myFile2 = (MultipartFile)inDto.get("myFile2");
		System.out.println("文件2名称：" + myFile2.getOriginalFilename());
		System.out.println("文件2大小：" + myFile2.getSize());
		outDto.setAppMsg("文件上传成功!");
		return outDto;
	}

}
