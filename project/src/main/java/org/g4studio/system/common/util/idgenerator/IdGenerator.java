package org.g4studio.system.common.util.idgenerator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.dao.Dao;
import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.core.id.SequenceStorer;
import org.g4studio.core.id.fomater.DefaultSequenceFormater;
import org.g4studio.core.id.generator.DefaultIDGenerator;
import org.g4studio.core.id.sequence.DefaultSequenceGenerator;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;

/**
 * ID生成器
 * @author OSWorks-XC
 * @since 2009-07-13
 */
public class IdGenerator {
	private static Log log = LogFactory.getLog(IdGenerator.class);
	private static int catche = 1;
	private static Dao g4Dao = (Dao)SpringBeanLoader.getSpringBean("g4Dao");
	
	/**
	 * 字段名称
	 */
	private String fieldname;
	
	public IdGenerator(String pFieldName){
		setFieldname(pFieldName);
	}
	
	public IdGenerator(){
	}
	
	/**
	 * 获取ID生成器实例
	 * @return DefaultIDGenerator
	 */
	public DefaultIDGenerator getDefaultIDGenerator(){
		Dto dto = new BaseDto();
		dto.put("fieldname", getFieldname());
		dto = (BaseDto)g4Dao.queryForObject("IdGenerator.getEaSequenceByFieldName", dto);
		DefaultIDGenerator idGenerator = new DefaultIDGenerator(); 
		DefaultSequenceFormater sequenceFormater = new DefaultSequenceFormater(); 
		sequenceFormater.setPattern(dto.getAsString("pattern"));
		DefaultSequenceGenerator sequenceGenerator = new DefaultSequenceGenerator(getFieldname());
		SequenceStorer sequenceStorer = new DBSequenceStorer();
		sequenceGenerator.setSequenceStorer(sequenceStorer);
		sequenceGenerator.setCache(catche);
		idGenerator.setSequenceFormater(sequenceFormater);
		idGenerator.setSequenceGenerator(sequenceGenerator);
		return idGenerator;
	}
	
    /**
     * 菜单编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getMenuIdGenerator(String pParentid){
		String maxSubMenuId = (String)g4Dao.queryForObject("IdGenerator.getMaxSubMenuId", pParentid);
		String menuId = null;
		if(G4Utils.isEmpty(maxSubMenuId)){
			menuId = "01";
		}else{
			int length = maxSubMenuId.length();
			String temp = maxSubMenuId.substring(length-2, length);
			int intMenuId = Integer.valueOf(temp).intValue() + 1;
			if(intMenuId > 0 && intMenuId < 10){
				menuId = "0" + String.valueOf(intMenuId);
			}else if(10 <= intMenuId && intMenuId <= 99){
				menuId = String.valueOf(intMenuId);
			}else if(intMenuId > 99){
				log.error(G4Constants.Exception_Head + "生成菜单编号越界了.同级兄弟节点编号为[01-99]\n请和您的系统管理员联系!");
			}else{
				log.error(G4Constants.Exception_Head + "生成菜单编号发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + menuId;
	}
	
    /**
     * 部门编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getDeptIdGenerator(String pParentid){
		String maxSubDeptId = (String)g4Dao.queryForObject("IdGenerator.getMaxSubDeptId", pParentid);
		String deptid = null;
		if(G4Utils.isEmpty(maxSubDeptId)){
			deptid = "001";
		}else{
			int length = maxSubDeptId.length();
			String temp = maxSubDeptId.substring(length-3, length);
			int intDeptId = Integer.valueOf(temp).intValue() + 1;
			if(intDeptId > 0 && intDeptId < 10){
				deptid = "00" + String.valueOf(intDeptId);
			}else if(10 <= intDeptId && intDeptId <= 99){
				deptid = "0" + String.valueOf(intDeptId);
			}else if (100 <= intDeptId && intDeptId <= 999) {
				deptid = String.valueOf(intDeptId);
			}else if(intDeptId >999){
				log.error(G4Constants.Exception_Head + "生成部门编号越界了.同级兄弟节点编号为[001-999]\n请和您的系统管理员联系!");
			}else{
				log.error(G4Constants.Exception_Head + "生成部门编号发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + deptid;
	}
	
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
}
