package org.g4studio.system.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.bouncycastle.jce.exception.ExtCertificateEncodingException;
import org.g4studio.common.service.impl.BaseServiceImpl;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.admin.service.TagSupportService;
import org.g4studio.system.admin.web.tag.vo.MenuVo;
import org.g4studio.system.common.util.SystemConstants;

/**
 * 权限模型标签业务实现类
 * 
 * @author OSWorks-XC
 * @since 2010-05-13
 */
public class TagSupportServiceImpl extends BaseServiceImpl implements TagSupportService {

	/**
	 * 获取卡片
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getCardList(Dto pDto) {
		Dto outDto = new BaseDto();
		List resultList = new ArrayList();
		String accountType = pDto.getAsString("accountType");
		pDto.put("dbType", "common");
		if (System.getProperty("g4Dao.db").equalsIgnoreCase("sqlserver")) {
			pDto.put("dbType", "sqlserver");
		}
		if (!accountType.equalsIgnoreCase(SystemConstants.ACCOUNTTYPE_NORMAL)) {
			resultList = g4Dao.queryForList("ArmTagSupport.getCardListBasedSuperAndDeveloper", pDto);
			outDto.setDefaultAList(resultList);
			return outDto;
		}
		List cardListBasedRole = g4Dao.queryForList("ArmTagSupport.getCardList", pDto);
		List cardListBasedUser = g4Dao.queryForList("ArmTagSupport.getCardListBasedUser", pDto);
		if (G4Utils.isEmpty(cardListBasedRole)) {
			resultList.addAll(cardListBasedUser);
		} else {
			resultList.addAll(cardListBasedRole);
			for (int i = 0; i < cardListBasedUser.size(); i++) {
				MenuVo menuVoBaseUser = (MenuVo) cardListBasedUser.get(i);
				boolean flag = true;
				for (int j = 0; j < cardListBasedRole.size(); j++) {
					MenuVo menuVoBaseRole = (MenuVo) cardListBasedRole.get(j);
					if (menuVoBaseUser.getMenuid().equals(menuVoBaseRole.getMenuid())) {
						flag = false;
					}
				}
				if (flag)
					resultList.add(menuVoBaseUser);
			}
		}
		outDto.setDefaultAList(resultList);
		return outDto;
	}

	/**
	 * 获取卡片子树
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getCardTreeList(Dto pDto) {
		Dto outDto = new BaseDto();
		List resultList = new ArrayList();
		String accountType = pDto.getAsString("accountType");
		if (!accountType.equalsIgnoreCase(SystemConstants.ACCOUNTTYPE_NORMAL)) {
			resultList = g4Dao.queryForList("ArmTagSupport.getCardTreeListBasedSuperAndDeveloper", pDto);
			for (int i = 0; i < resultList.size(); i++) {
				MenuVo vo = (MenuVo)resultList.get(i);
				if (vo.getMenuid().length() == 4) {
					vo.setIsRoot("true");
				}else {
					vo.setIsRoot("false");
				}
				if (vo.getExpanded().equals("1")) {
					vo.setExpanded("true");
				}else if (vo.getExpanded().equals("0")) {
					vo.setExpanded("false");
				}
				if (G4Utils.isEmpty(vo.getIcon())) {
					vo.setIcon("tab_blank.png");
				}
			}
			outDto.setDefaultAList(resultList);
			return outDto;
		}
		List cardTreeListBasedRole = new ArrayList();;
		cardTreeListBasedRole = g4Dao.queryForList("ArmTagSupport.getCardTreeList", pDto);
		for (int i = 0; i < cardTreeListBasedRole.size(); i++) {
			MenuVo vo = (MenuVo)cardTreeListBasedRole.get(i);
			if (vo.getMenuid().length() == 4) {
				vo.setIsRoot("true");
			}else {
				vo.setIsRoot("false");
			}
			if (vo.getExpanded().equals("1")) {
				vo.setExpanded("true");
			}else if (vo.getExpanded().equals("0")) {
				vo.setExpanded("false");
			}
			if (G4Utils.isEmpty(vo.getIcon())) {
				vo.setIcon("tab_blank.png");
			}
		}
		List cardTreeListBasedUser = new ArrayList();;
		cardTreeListBasedUser = g4Dao.queryForList("ArmTagSupport.getCardTreeListBasedUser", pDto);
		for (int i = 0; i < cardTreeListBasedUser.size(); i++) {
			MenuVo vo = (MenuVo)cardTreeListBasedUser.get(i);
			if (vo.getMenuid().length() == 4) {
				vo.setIsRoot("true");
			}else {
				vo.setIsRoot("false");
			}
			if (vo.getExpanded().equals("1")) {
				vo.setExpanded("true");
			}else if (vo.getExpanded().equals("0")) {
				vo.setExpanded("false");
			}
			if (G4Utils.isEmpty(vo.getIcon())) {
				vo.setIcon("tab_blank.png");
			}
		}
		if (G4Utils.isEmpty(cardTreeListBasedRole)) {
			resultList.addAll(cardTreeListBasedUser);
		} else {
			resultList.addAll(cardTreeListBasedRole);
			for (int i = 0; i < cardTreeListBasedUser.size(); i++) {
				MenuVo menuVoBaseUser = (MenuVo) cardTreeListBasedUser.get(i);
				boolean flag = true;
				for (int j = 0; j < cardTreeListBasedRole.size(); j++) {
					MenuVo menuVoBaseRole = (MenuVo) cardTreeListBasedRole.get(j);
					if (menuVoBaseUser.getMenuid().equals(menuVoBaseRole.getMenuid())) {
						flag = false;
					}
				}
				if (flag)
					resultList.add(menuVoBaseUser);
			}
		}
		for (int i = 0; i < resultList.size(); i++) {
			MenuVo menuVo = (MenuVo) resultList.get(i);
			if (menuVo.getMenuid().equals(SystemConstants.ROORID_MENU)) {
				resultList.remove(i);
			}
		}
		outDto.setDefaultAList(resultList);
		return outDto;
	}
	
	/**
	 * 获取应用菜单(桌面布局)
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getMenuList4Desktop(Dto pDto) {
		Dto outDto = new BaseDto();
		List resultList = new ArrayList();
		String accountType = pDto.getAsString("accountType");
		if (!accountType.equalsIgnoreCase(SystemConstants.ACCOUNTTYPE_NORMAL)) {
			resultList = g4Dao.queryForList("ArmTagSupport.getCardTreeListBasedSuperAndDeveloper4Desktop", pDto);
			resultList = doProcessList(resultList);
			outDto.setDefaultAList(resultList);
			return outDto;
		}
		List cardTreeListBasedRole = new ArrayList();;
		cardTreeListBasedRole = g4Dao.queryForList("ArmTagSupport.getCardTreeList4Desktop", pDto);
		List cardTreeListBasedUser = new ArrayList();;
		cardTreeListBasedUser = g4Dao.queryForList("ArmTagSupport.getCardTreeListBasedUser4Desktop", pDto);
		if (G4Utils.isEmpty(cardTreeListBasedRole)) {
			resultList.addAll(cardTreeListBasedUser);
		} else {
			resultList.addAll(cardTreeListBasedRole);
			for (int i = 0; i < cardTreeListBasedUser.size(); i++) {
				MenuVo menuVoBaseUser = (MenuVo) cardTreeListBasedUser.get(i);
				boolean flag = true;
				for (int j = 0; j < cardTreeListBasedRole.size(); j++) {
					MenuVo menuVoBaseRole = (MenuVo) cardTreeListBasedRole.get(j);
					if (menuVoBaseUser.getMenuid().equals(menuVoBaseRole.getMenuid())) {
						flag = false;
					}
				}
				if (flag)
					resultList.add(menuVoBaseUser);
			}
		}
		resultList = doProcessList(resultList);
		outDto.setDefaultAList(resultList);
		return outDto;
	}
	
	/**
	 * 加工桌面布局菜单
	 * 
	 * @param resultList
	 * @return
	 */
	private List doProcessList(List resultList){
		PropertiesHelper g4PHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
		String defaultShortcut = g4PHelper.getValue("desktopShortcut", "window.png");
		for (int i = 0; i < resultList.size(); i++) {
			MenuVo vo = (MenuVo)resultList.get(i);
			vo.setMaxed("false");
			if (G4Utils.isEmpty(vo.getShortcut())) {
				vo.setShortcut(defaultShortcut);
			}
			if (vo.getMenuname() != null && vo.getMenuname().length() > 10) {
				vo.setMenuname(vo.getMenuname().substring(0, 10));
			}
			if (G4Utils.isEmpty(vo.getScrollbar()) || vo.getScrollbar().equals("0")) {
				vo.setScrollbar("no");
			}else {
				vo.setScrollbar("yes");
			}
			if (G4Utils.isEmpty(vo.getWidth()) || vo.getWidth() == 0) {
				vo.setWidth(800);
				vo.setMaxed("true");
			}
			if (G4Utils.isEmpty(vo.getHeight()) || vo.getHeight() == 0) {
				vo.setHeight(600);
				vo.setMaxed("true");
			}
		}
		return resultList;
	}

	/**
	 * 获取登录人员所属部门信息
	 * 
	 * @return                            
	 */
	public Dto getDepartmentInfo(Dto pDto) {
		Dto outDto = (BaseDto) g4Dao.queryForObject("ArmTagSupport.getDepartmentInfo", pDto);
		String deptname = ((BaseDto)g4Dao.queryForObject("ArmTagSupport.getDepartmentInfo", pDto)).getAsString("deptname");
		return outDto;
	}

	/**
	 * 获取登录人员附加信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getEauserSubInfo(Dto pDto) {
		return (BaseDto)g4Dao.queryForObject("ArmTagSupport.getEauserSubInfo", pDto);
	}

}
