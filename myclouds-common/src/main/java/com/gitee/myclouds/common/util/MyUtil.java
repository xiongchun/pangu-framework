package com.gitee.myclouds.common.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Collection;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;

import com.gitee.myclouds.common.wrapper.Dto;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * <b>辅助工具类</b>
 * 
 * @author xiongchun
 * @since 1.0
 * @date 2009-1-22
 */
@Slf4j
public class MyUtil {

	/**
	 * 判断对象是否Empty(null或元素为0)<br>
	 * 实用于对如下对象做判断:String Collection及其子类 Map及其子类
	 * 
	 * @param pObj
	 *            待检查对象
	 * @return boolean 返回的布尔值
	 */
	public static boolean isEmpty(Object pObj) {
		boolean isEmpty = false;
		if (pObj == null) {
			isEmpty = true;
		} else {
			if (pObj instanceof String) {
				isEmpty = StringUtils.isBlank((String) pObj);
			} else if (pObj instanceof Collection) {
				isEmpty = CollectionUtils.isEmpty((Collection<?>) pObj);
			} else if (pObj instanceof HashMap) {
				isEmpty = MapUtils.isEmpty((HashMap<?, ?>) pObj);
			}
		}
		return isEmpty;
	}
	
	/**
	 * 判断对象是否不为Empty(null或元素为0)<br>
	 * 实用于对如下对象做判断:String Collection及其子类 Map及其子类
	 * 
	 * @param pObj
	 *            待检查对象
	 * @return boolean 返回的布尔值
	 */
	public static boolean isNotEmpty(Object pObj) {
		return !isEmpty(pObj);
	}

	/**
	 * Java对象之间属性值拷贝(Dto、Map、JavaBean)
	 * 
	 * @param pFromObj
	 *            Bean源对象
	 * @param pToObj
	 *            Bean目标对象
	 */
	public static void copyProperties(Object pFromObj, Object pToObj) {
		if (pToObj != null) {
			try {
				// 支持属性空值复制
				BeanUtilsBean.getInstance().getConvertUtils().register(false, true, 0);
				// 日期类型复制
				BeanUtilsDateConverter converter = new BeanUtilsDateConverter();
				ConvertUtils.register(converter, java.util.Date.class);
				ConvertUtils.register(converter, java.sql.Date.class);
				BeanUtils.copyProperties(pToObj, pFromObj);
			} catch (Exception e) {
				throw new RuntimeException("JavaBean之间的属性值拷贝发生错误", e);
			}
		}
	}

	/**
	 * 将JavaBean对象中的属性值拷贝到Dto对象
	 * 
	 * @param pFromObj
	 *            JavaBean对象源
	 * @param pToDto
	 *            Dto目标对象
	 */
	public static void copyProperties(Object pFromObj, Dto pToDto) {
		if (pToDto != null) {
			try {
				pToDto.putAll(BeanUtils.describe(pFromObj));
				pToDto.remove("class");
			} catch (Exception e) {
				throw new RuntimeException("将JavaBean属性值拷贝到Dto对象发生错误", e);
			}
		}
	}
	
	
	
	/**
	 * 账号密码加密算法(二次加密)
	 * 
	 * @param key 秘钥 (秘钥长度必须大于等于8个字符)
	 * @param source 明文数据
	 * @return 不可逆密文
	 */
	public static String password(String key, String source) {
		//先使用DESC加密算法
		String password = SecureUtil.des(key.getBytes()).encryptHex(source);
		//再使用MD5摘要算法(密码不可逆)
		password = SecureUtil.md5(password);
		return password;
	}
	
	/**
	 * 取出字符串中的所有空格
	 * 
	 * @return
	 */
	public static String trimAll(String text) {
		return StringUtils.replace(text, " ", "");
	}
	
	/**
	 * 获取登录用户IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getClientIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-real-ip");
		if (MyUtil.isEmpty(ip)) {
			ip = request.getHeader("X-Forward-For");
		}
		if (MyUtil.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (MyUtil.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (MyUtil.isEmpty(ip)) {
			ip = request.getRemoteAddr();
		}
		if (StringUtils.indexOf(ip, "0:0") != -1) {
			ip = "127.0.0.1";
		}
		return ip;
	}
	
	/**
	 * 执行批处理脚本
	 * 
	 * @param command 执行脚本
	 * @param isSync 是否同步执行
	 */
	public static void runCmd(String command, boolean isSync) {
		try {
			Runtime runtime = Runtime.getRuntime();
			Process proc = runtime.exec(command);
			InputStream is = proc.getErrorStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String line = null;
			System.out.println("<CMD-LOG>");
			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
			System.out.println("</CMD-LOG>");
			if (isSync) {
				// the calling thread will be blocked until the subprocess exits
				int exitVal = proc.waitFor();
				log.info("Process exitValue：{}。", exitVal);
			}
		} catch (Exception e) {
			String msg = StrUtil.format("调用批处理程序失败。批处理脚本：{}。", command);
			log.error(msg);
			throw new RuntimeException(msg, e);
		}
	}
	
	public static void main(String[] args) {
		runCmd("java -version", true);
	}

}
