package aos.framework.core.typewrap;

import aos.framework.core.typewrap.impl.HashDto;
import aos.framework.core.utils.AOSCons;


/**
 * <b>数据传输对象实例化辅助类</b>
 * 
 * @author xiongchun
 * @date 2008-07-06
 */
public class Dtos {

	/**
	 * 创建一个常规的Dto对象
	 * 
	 */
	public static Dto newDto() {
		return new HashDto();
	}
	
	/**
	 * 创建一个响应Request的Dto对象
	 * <p>
	 * 缺省加入KV变量：outDto.setAppCode(AOSCons.SUCCESS);<br>
	 * setAppCode()可覆盖。
	 * </P>
	 */
	public static Dto newOutDto() {
		Dto outDto = Dtos.newDto();
		//业务处理成功标识。如果业务失败，则重新赋值。
		outDto.setAppCode(AOSCons.SUCCESS);
		return outDto;
	}

	/**
	 * 创建一个常规的Dto对象，并初始化一个键值对。
	 * 
	 * @param keyString
	 * @param valueObject
	 * @return
	 */
	public static Dto newDto(String keyString, Object valueObject) {
		Dto dto = new HashDto();
		dto.put(keyString, valueObject);
		return dto;
	}

	/**
	 * 创建一个数学运算SQL的参数DTO
	 * <p>
	 * 如：Dto dto = Dtos.newCalcDto("MIN(cascade_id_)");
	 * 
	 * @param expr
	 *            构造参数为运算表达式
	 */
	public static Dto newCalcDto(String expr) {
		Dto dto = newDto();
		dto.put(AOSCons.CALCEXPR, expr);
		return dto;
	}

}
