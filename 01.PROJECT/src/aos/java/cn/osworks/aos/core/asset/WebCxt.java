package cn.osworks.aos.core.asset;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.system.dao.mapper.Aos_sys_user_cfgMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.service.AOSService;

/**
 * <b>Web上下文</b>
 * 
 * @author OSWorks-XC
 */
public class WebCxt {

	/**
	 * 将Request请求参数封装为Dto对象
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("all")
	public static Dto getParamAsDto(HttpServletRequest request) {
		Dto dto = new HashDto();
		Map<String, String[]> map = request.getParameterMap();
		Iterator<String> keyIterator = (Iterator) map.keySet().iterator();
		while (keyIterator.hasNext()) {
			String key = (String) keyIterator.next();
			String value = map.get(key)[0];
			dto.put(key, value);
		}
		return dto;
	}

	/**
	 * 向Response流输出字符串
	 * <p/>
	 * <p>
	 * 输出字符串不做任何加工，原样输出。
	 * 
	 * @param response
	 * @param outString
	 *            输出字符串
	 */
	public static void writeRaw(HttpServletResponse response, String outString) {
		try {
			response.getWriter().write(outString == null ? "" : outString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 向Response流输出业务数据字符串
	 * <p/>
	 * 如果传入的参数是一个Json字符串则直接输出。若为一个常规字符串则将其自动作为Key为appmsg的json属性值输出。(缺省追加参数：
	 * appcode=1 success=true)
	 * 
	 * @param response
	 * @param outString
	 *            输出符合Json格式的业务数据字符串 / 提示信息常规字符串
	 */
	public static void write(HttpServletResponse response, String outString) {
		if (StringUtils.indexOf(outString, "{") == -1 && !outString.equals("[]")) {
			outString = writeMsg(outString);
		}
		try {
			response.getWriter().write(outString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 向Response流输出提示信息字符串
	 * 
	 * <p>
	 * 缺省追加参数：appcode=1 success=true appmsg
	 * </p>
	 * 
	 * @param msg
	 *            提示信息，这个提示信息被转换为Json的key为:appmsg。前台根据appmsg取出。
	 */
	private static String writeMsg(String msg) {
		Dto dto = Dtos.newOutDto();
		dto.put(AOSCons.APPCODE_KEY, AOSCons.SUCCESS);
		dto.put(AOSCons.APPMSG_KEY, msg);
		String outString = AOSJson.toJson(dto);
		return outString;
	}

	/**
	 * 向Response流输出业务数据字符串
	 * <p/>
	 * 如果传入的参数是一个Json字符串则直接输出。若为一个常规字符串则将其自动作为Key为appmsg的json属性值输出。(缺省追加参数：
	 * appcode=1 success=true)
	 * 
	 * @param response
	 * @param appMsg
	 *            提示信息常规字符串
	 * @param appCode
	 *            状态码
	 */
	public static void write(HttpServletResponse response, int appCode, String appMsg) {
		Dto dto = Dtos.newOutDto();
		dto.put(AOSCons.APPCODE_KEY, appCode);
		dto.put(AOSCons.APPMSG_KEY, appMsg);
		String outString = AOSJson.toJson(dto);
		try {
			response.getWriter().write(outString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 向Response流输出业务数据字符串
	 * 
	 * @param session
	 *            输出符合Json格式的业务数据字符串
	 */
	public static UserInfoVO getUserInfo(HttpSession session) {
		UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute(AOSCons.USERINFOKEY);
		return userInfoVO;
	}

	/**
	 * 获取当前用户的aos_sys_user_cfg表配置信息
	 * 
	 * @param userID
	 * @return
	 */
	public static Aos_sys_user_cfgPO getUserCfgInfo(String userID) {
		Aos_sys_user_cfgMapper aos_sys_user_cfgMapper = (Aos_sys_user_cfgMapper) AOSCxt
				.getBean("aos_sys_user_cfgMapper");
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = aos_sys_user_cfgMapper.selectByKey(userID);
		return aos_sys_user_cfgPO;
	}

	/**
	 * 从数据库参数表中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfDB(String key) {
		String valueString = AOSCxt.aosService.getValueByParamKey(key);
		if (AOSUtils.isEmpty(valueString)) {
			valueString = StringUtils.EMPTY;
		}
		return valueString;
	}

	/**
	 * 从数据库参数表中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @param defaultValue
	 *            缺省值
	 * @return
	 */
	public static String getCfgOfDB(String key, String defaultValue) {
		String valueString = getCfgOfDB(key);
		if (AOSUtils.isEmpty(valueString)) {
			valueString = defaultValue;
		}
		return valueString;
	}

	/**
	 * 从XML参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfXML(String key) {
		String valueString = AOSXmlOptionsHandler.getValue(key);
		return valueString;
	}

	/**
	 * 从Properties参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfProperties(String key) {
		String valueString = AOSPropertiesHandler.getProperty(key);
		return valueString;
	}

	/**
	 * 根据数据字典标识键获取字典对照集合
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @return
	 */
	public static List<Aos_sys_dicPO> getDicList(String dickey) {
		List<Aos_sys_dicPO> dicList = AOSCxt.aosService.getDicList(dickey);
		return dicList;
	}

	/**
	 * 根据数据字典标识键和字典对照代码获取字典对照值
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @param code
	 *            数据字典对照代码
	 * @return
	 */
	public static String getDicCodeDesc(String dickey, String code) {
		String desc = "";
		List<Aos_sys_dicPO> dicList = AOSCxt.aosService.getDicList(dickey);
		for (Aos_sys_dicPO aos_sys_dicPO : dicList) {
			if (aos_sys_dicPO.getCode_().equals(code)) {
				desc = aos_sys_dicPO.getDesc_();
				break;
			}
		}
		return desc;
	}

	/**
	 * 级联方式获取用户配置参数
	 * <p/>
	 * 先获取系统参数，如果系统参数允许被覆盖，则获取用户参数，如果用户参数不为空，则覆盖系统参数
	 * 
	 * @param session
	 *            HttpSession
	 * @param key
	 *            参数KEY
	 * @return
	 */
	public static String getCfgByUser(HttpSession session, String key) {
		AOSService aosService = (AOSService)AOSBeanLoader.getSpringBean("aosService");
		String value = "";
		Aos_sys_paramPO aos_sys_paramPO = aosService.getParamPOByParamKey(key);
		if (aos_sys_paramPO != null) {
			value = aos_sys_paramPO.getValue_();
		}
		// 如果用户信息为空，则直接返回系统参数
		UserInfoVO userInfoVO = getUserInfo(session);
		if (AOSUtils.isEmpty(userInfoVO)) {
			return value;
		}
		// 如果用户信息不为空，则继续计算
		String cfgField = aos_sys_paramPO.getOverwrite_field_();
		if (aos_sys_paramPO.getIs_overwrite_().equals(AOSCons.YES) && AOSUtils.isNotEmpty(cfgField)) {
			Aos_sys_user_cfgPO aos_sys_user_cfgPO = userInfoVO.getCfgInfo();
			if (AOSUtils.isNotEmpty(aos_sys_user_cfgPO)) {
				String temp = (String) AOSReflector.getFieldValue(aos_sys_user_cfgPO, cfgField);
				if (AOSUtils.isNotEmpty(temp)) {
					value = temp;
				}
			}
		}
		return value;
	}

	/**
	 * 直接获取用户配置参数(不进行参数覆盖的计算，或者此参数无系统参数仅为用户配置参数)
	 * 
	 * @param session
	 *            HttpSession
	 * @return
	 */
	public static String getCfgOfUser(HttpSession session, String cfgField) {
		UserInfoVO userInfoVO = getUserInfo(session);
		Aos_sys_user_cfgPO aos_sys_user_cfgPO = userInfoVO.getCfgInfo();
		String outVaueString = (String) AOSReflector.getFieldValue(aos_sys_user_cfgPO, cfgField);
		return outVaueString;
	}

	/**
	 * 获取登录用户IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getClientIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-real-ip");
		if (AOSUtils.isEmpty(ip)) {
			ip = request.getHeader("X-Forward-For");
		}
		if (AOSUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (AOSUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (AOSUtils.isEmpty(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

}
