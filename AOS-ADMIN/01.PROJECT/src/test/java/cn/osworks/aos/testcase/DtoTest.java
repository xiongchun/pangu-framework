package cn.osworks.aos.testcase;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.math.BigDecimal;

import org.junit.Test;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.testcase.vo.PersonInfoVO;


/**
 * <b>数据结构DTO单元测试用例</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-08-10
 */
public class DtoTest {

	/**
	 * 数据类型转换测试
	 */
	@Test
	public void convert() {
		Dto dto = new HashDto();
		dto.put("key1", "12.22");
		Object key1 = dto.getBigDecimal("key1");
		assertTrue(key1 instanceof BigDecimal);
		assertEquals("12.22", dto.getString("key1"));
	}
	
	/**
	 * 属性复制测试
	 */
	@Test
	public void copyFields() {
		Dto dto = new HashDto();
		dto.put("name", "小雯子");
		dto.put("age", 10);
		dto.put("balance", 1.1);
		dto.put("birthday", "2015年10月24日");
		dto.put("createTime",  "2015-10-24 19:24:04");
		PersonInfoVO personInfoVO = new PersonInfoVO();
		AOSUtils.copyProperties(dto, personInfoVO);
	}
	
	/**
	 * 属性复制测试2
	 */
	@Test
	public void copyFields2() {
		Dto dto = new HashDto();
		PersonInfoVO personInfoVO = new PersonInfoVO();
		personInfoVO.setName("小雯子");
		personInfoVO.setBirthday(AOSUtils.getDate());
		personInfoVO.setCreateTime(AOSUtils.getDateTime());
		AOSUtils.copyProperties(personInfoVO, dto);
	}

}
