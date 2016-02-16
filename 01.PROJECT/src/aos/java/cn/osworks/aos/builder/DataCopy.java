package cn.osworks.aos.builder;

import cn.osworks.aos.core.asset.AOSBeanLoader;
import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dicMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dic_indexMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_iconMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_roleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_module_user_navMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_pageMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_page_elMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_page_el_grantMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_roleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_sequenceMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_cfgMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_extMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_postMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_roleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_catalogPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dic_indexPO;
import cn.osworks.aos.system.dao.po.Aos_sys_iconPO;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_rolePO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_module_user_navPO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_pagePO;
import cn.osworks.aos.system.dao.po.Aos_sys_page_elPO;
import cn.osworks.aos.system.dao.po.Aos_sys_page_el_grantPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;
import cn.osworks.aos.system.dao.po.Aos_sys_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_rolePO;
import cn.osworks.aos.system.dao.po.Aos_sys_sequencePO;
import cn.osworks.aos.system.dao.po.Aos_sys_userPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_extPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_postPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_rolePO;

/**
 * 数据同步
 * 
 * @author OSWorks-XC
 */
public class DataCopy {

	public static void main(String[] args) {
		SqlDao sysDao2 = (SqlDao)AOSBeanLoader.getSpringBean("sysDao2");
	    aos_sys_catalog(sysDao2);
	    aos_sys_dic(sysDao2);
	    aos_sys_dic_index(sysDao2);
	    aos_sys_icon(sysDao2);
	    aos_sys_module(sysDao2);
	    aos_sys_module_post(sysDao2);
	    aos_sys_module_role(sysDao2);
	    aos_sys_module_user(sysDao2);
	    aos_sys_module_user_nav(sysDao2);
	    aos_sys_org(sysDao2);
	    aos_sys_page(sysDao2);
	    aos_sys_page_el(sysDao2);
	    aos_sys_page_el_grant(sysDao2);
	    aos_sys_param(sysDao2);
	    aos_sys_post(sysDao2);
	    aos_sys_role(sysDao2);
	    aos_sys_sequence(sysDao2);
	    aos_sys_user(sysDao2);
	    aos_sys_user_cfg(sysDao2);
	    aos_sys_user_ext(sysDao2);
	    aos_sys_user_post(sysDao2);
	    aos_sys_user_role(sysDao2);
	}
	
	public static void aos_sys_catalog(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_catalogMapper mapper = (Aos_sys_catalogMapper)AOSCxt.getBean("aos_sys_catalogMapper");
		for (Aos_sys_catalogPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_catalogMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_dic(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_dicMapper mapper = (Aos_sys_dicMapper)AOSCxt.getBean("aos_sys_dicMapper");
		for (Aos_sys_dicPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_dicMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_dic_index(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_dic_indexMapper mapper = (Aos_sys_dic_indexMapper)AOSCxt.getBean("aos_sys_dic_indexMapper");
		for (Aos_sys_dic_indexPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_dic_indexMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_icon(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_iconMapper mapper = (Aos_sys_iconMapper)AOSCxt.getBean("aos_sys_iconMapper");
		for (Aos_sys_iconPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_iconMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_module(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_moduleMapper mapper = (Aos_sys_moduleMapper)AOSCxt.getBean("aos_sys_moduleMapper");
		for (Aos_sys_modulePO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_module_post(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_module_postMapper mapper = (Aos_sys_module_postMapper)AOSCxt.getBean("aos_sys_module_postMapper");
		for (Aos_sys_module_postPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_module_postMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_module_role(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_module_roleMapper mapper = (Aos_sys_module_roleMapper)AOSCxt.getBean("aos_sys_module_roleMapper");
		for (Aos_sys_module_rolePO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_module_roleMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_module_user(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_module_userMapper mapper = (Aos_sys_module_userMapper)AOSCxt.getBean("aos_sys_module_userMapper");
		for (Aos_sys_module_userPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_module_userMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_module_user_nav(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_module_user_navMapper mapper = (Aos_sys_module_user_navMapper)AOSCxt.getBean("aos_sys_module_user_navMapper");
		for (Aos_sys_module_user_navPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_module_user_navMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_org(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_orgMapper mapper = (Aos_sys_orgMapper)AOSCxt.getBean("aos_sys_orgMapper");
		for (Aos_sys_orgPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_page(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_pageMapper mapper = (Aos_sys_pageMapper)AOSCxt.getBean("aos_sys_pageMapper");
		for (Aos_sys_pagePO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_pageMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_page_el(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_page_elMapper mapper = (Aos_sys_page_elMapper)AOSCxt.getBean("aos_sys_page_elMapper");
		for (Aos_sys_page_elPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_page_elMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_page_el_grant(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_page_el_grantMapper mapper = (Aos_sys_page_el_grantMapper)AOSCxt.getBean("aos_sys_page_el_grantMapper");
		for (Aos_sys_page_el_grantPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_page_el_grantMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_param(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_paramMapper mapper = (Aos_sys_paramMapper)AOSCxt.getBean("aos_sys_paramMapper");
		for (Aos_sys_paramPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_post(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_postMapper mapper = (Aos_sys_postMapper)AOSCxt.getBean("aos_sys_postMapper");
		for (Aos_sys_postPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_postMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_role(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_roleMapper mapper = (Aos_sys_roleMapper)AOSCxt.getBean("aos_sys_roleMapper");
		for (Aos_sys_rolePO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_roleMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_sequence(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_sequenceMapper mapper = (Aos_sys_sequenceMapper)AOSCxt.getBean("aos_sys_sequenceMapper");
		for (Aos_sys_sequencePO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_sequenceMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_user(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_userMapper mapper = (Aos_sys_userMapper)AOSCxt.getBean("aos_sys_userMapper");
		for (Aos_sys_userPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_userMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_user_cfg(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_user_cfgMapper mapper = (Aos_sys_user_cfgMapper)AOSCxt.getBean("aos_sys_user_cfgMapper");
		for (Aos_sys_user_cfgPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_user_cfgMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_user_ext(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_user_extMapper mapper = (Aos_sys_user_extMapper)AOSCxt.getBean("aos_sys_user_extMapper");
		for (Aos_sys_user_extPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_user_extMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_user_post(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_user_postMapper mapper = (Aos_sys_user_postMapper)AOSCxt.getBean("aos_sys_user_postMapper");
		for (Aos_sys_user_postPO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_user_postMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}
	public static void aos_sys_user_role(SqlDao sysDao2) {
		AOSUtils.info("正在复制表...");
		Aos_sys_user_roleMapper mapper = (Aos_sys_user_roleMapper)AOSCxt.getBean("aos_sys_user_roleMapper");
		for (Aos_sys_user_rolePO po :  mapper.list(Dtos.newDto())) {
			sysDao2.insert("cn.osworks.aos.system.dao.mapper.Aos_sys_user_roleMapper.insert", po);
		}
		AOSUtils.info("表复制完成。");
	}

}
