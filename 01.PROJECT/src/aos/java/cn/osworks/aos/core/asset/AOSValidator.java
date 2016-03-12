package cn.osworks.aos.core.asset;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;

/**
 * <b>验证器</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 */
public class AOSValidator {

	/**
	 * 校验属性在对象中非空
	 * 
	 * @param object
	 * @param properties
	 */
	@SuppressWarnings("rawtypes")
	public static void notEmpty(Object object, String properties) {
		if (object == null) {
			return;
		}
		String[] fields = StringUtils.split(properties, ",");
		if (object instanceof HashMap) {
			Map map = (HashMap) object;
			for (String field : fields) {
				if (AOSUtils.isEmpty(map.get(field))) {
					throw new AOSException(AOSUtils.merge("目标对象[{0}]中属性值[{1}]不能为空，请检查。", object, field));
				}
			}
		} else {
			for (String field : fields) {
				if (AOSUtils.isEmpty(AOSReflector.getFieldValue(object, field))) {
					throw new AOSException(AOSUtils.merge("目标对象[{0}]中属性值[{1}]不能为空，请检查。", object, field));
				}
			}
		}
	}

	public static void main(String[] args) {
		Aos_sys_orgPO po = new Aos_sys_orgPO();
		po.setName_("测试");
		//po.setSort_no_(1);
		AOSValidator.notEmpty(po, "name_,sort_no_");
	}

}
