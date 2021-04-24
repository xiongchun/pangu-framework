package org.g4studio.core.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.util.TypeCaseHelper;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;

/**
 * 常见的辅助类
 * 
 * @author OSWorks-XC
 * @since 2009-07-15
 */
public class G4Utils {

	private static Log log = LogFactory.getLog(G4Utils.class);

	private static String HanDigiStr[] = new String[] { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };

	private static String HanDiviStr[] = new String[] { "", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿", "拾", "佰", "仟", "万",
			"拾", "佰", "仟", "亿", "拾", "佰", "仟", "万", "拾", "佰", "仟" };

	private static PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);

	/**
	 * 判断对象是否Empty(null或元素为0)<br>
	 * 实用于对如下对象做判断:String Collection及其子类 Map及其子类
	 * 
	 * @param pObj
	 *            待检查对象
	 * @return boolean 返回的布尔值
	 */
	public static boolean isEmpty(Object pObj) {
		if (pObj == null)
			return true;
		if (pObj == "")
			return true;
		if (pObj instanceof String) {
			if (((String) pObj).length() == 0) {
				return true;
			}
		} else if (pObj instanceof Collection) {
			if (((Collection) pObj).size() == 0) {
				return true;
			}
		} else if (pObj instanceof Map) {
			if (((Map) pObj).size() == 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断对象是否为NotEmpty(!null或元素>0)<br>
	 * 实用于对如下对象做判断:String Collection及其子类 Map及其子类
	 * 
	 * @param pObj
	 *            待检查对象
	 * @return boolean 返回的布尔值
	 */
	public static boolean isNotEmpty(Object pObj) {
		if (pObj == null)
			return false;
		if (pObj == "")
			return false;
		if (pObj instanceof String) {
			if (((String) pObj).length() == 0) {
				return false;
			}
		} else if (pObj instanceof Collection) {
			if (((Collection) pObj).size() == 0) {
				return false;
			}
		} else if (pObj instanceof Map) {
			if (((Map) pObj).size() == 0) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 判断一个字符串是否由数字、字母、数字字母组成
	 * 
	 * @param pStr
	 *            需要判断的字符串
	 * @param pStyle
	 *            判断规则
	 * @return boolean 返回的布尔值
	 */
	public static boolean isTheStyle(String pStr, String pStyle) {
		for (int i = 0; i < pStr.length(); i++) {
			char c = pStr.charAt(i);
			if (pStyle.equals(G4Constants.S_STYLE_N)) {
				if (!Character.isDigit(c))
					return false;
			} else if (pStyle.equals(G4Constants.S_STYLE_L)) {
				if (!Character.isLetter(c))
					return false;
			} else if (pStyle.equals(G4Constants.S_STYLE_NL)) {
				if (Character.isLetterOrDigit(c))
					return false;
			}
		}
		return true;
	}

	/**
	 * JavaBean之间对象属性值拷贝
	 * 
	 * @param pFromObj
	 *            Bean源对象
	 * @param pToObj
	 *            Bean目标对象
	 */
	public static void copyPropBetweenBeans(Object pFromObj, Object pToObj) {
		if (pToObj != null) {
			try {
				BeanUtils.copyProperties(pToObj, pFromObj);
			} catch (Exception e) {
				log.error("==开发人员请注意:==\n JavaBean之间的属性值拷贝发生错误啦!" + "\n详细错误信息如下:");
				e.printStackTrace();
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
	public static void copyPropFromBean2Dto(Object pFromObj, Dto pToDto) {
		if (pToDto != null) {
			try {
				pToDto.putAll(BeanUtils.describe(pFromObj));
				// BeanUtils自动加入了一个Key为class的键值,故将其移除
				pToDto.remove("class");
			} catch (Exception e) {
				log.error("==开发人员请注意:==\n 将JavaBean属性值拷贝到Dto对象发生错误啦!" + "\n详细错误信息如下:");
				e.printStackTrace();
			}
		}
	}

	/**
	 * 将传入的身份证号码进行校验，并返回一个对应的18位身份证
	 * 
	 * @param personIDCode
	 *            身份证号码
	 * @return String 十八位身份证号码
	 * @throws 无效的身份证号
	 */
	public static String getFixedPersonIDCode(String personIDCode) throws Exception {
		if (personIDCode == null)
			throw new Exception("输入的身份证号无效，请检查");

		if (personIDCode.length() == 18) {
			if (isIdentity(personIDCode))
				return personIDCode;
			else
				throw new Exception("输入的身份证号无效，请检查");
		} else if (personIDCode.length() == 15)
			return fixPersonIDCodeWithCheck(personIDCode);
		else
			throw new Exception("输入的身份证号无效，请检查");
	}

	/**
	 * 修补15位居民身份证号码为18位，并校验15位身份证有效性
	 * 
	 * @param personIDCode
	 *            十五位身份证号码
	 * @return String 十八位身份证号码
	 * @throws 无效的身份证号
	 */
	public static String fixPersonIDCodeWithCheck(String personIDCode) throws Exception {
		if (personIDCode == null || personIDCode.trim().length() != 15)
			throw new Exception("输入的身份证号不足15位，请检查");

		if (!isIdentity(personIDCode))
			throw new Exception("输入的身份证号无效，请检查");

		return fixPersonIDCodeWithoutCheck(personIDCode);
	}

	/**
	 * 修补15位居民身份证号码为18位，不校验身份证有效性
	 * 
	 * @param personIDCode
	 *            十五位身份证号码
	 * @return 十八位身份证号码
	 * @throws 身份证号参数不是15位
	 */
	public static String fixPersonIDCodeWithoutCheck(String personIDCode) throws Exception {
		if (personIDCode == null || personIDCode.trim().length() != 15)
			throw new Exception("输入的身份证号不足15位，请检查");

		String id17 = personIDCode.substring(0, 6) + "19" + personIDCode.substring(6, 15); // 15位身份证补'19'

		char[] code = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' }; // 11个校验码字符
		int[] factor = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 }; // 18个加权因子
		int[] idcd = new int[18];
		int sum; // 根据公式 ∑(ai×Wi) 计算
		int remainder; // 第18位校验码
		for (int i = 0; i < 17; i++) {
			idcd[i] = Integer.parseInt(id17.substring(i, i + 1));
		}
		sum = 0;
		for (int i = 0; i < 17; i++) {
			sum = sum + idcd[i] * factor[i];
		}
		remainder = sum % 11;
		String lastCheckBit = String.valueOf(code[remainder]);
		return id17 + lastCheckBit;
	}

	/**
	 * 判断是否是有效的18位或15位居民身份证号码
	 * 
	 * @param identity
	 *            18位或15位居民身份证号码
	 * @return 是否为有效的身份证号码
	 */
	public static boolean isIdentity(String identity) {
		if (identity == null)
			return false;
		if (identity.length() == 18 || identity.length() == 15) {
			String id15 = null;
			if (identity.length() == 18)
				id15 = identity.substring(0, 6) + identity.substring(8, 17);
			else
				id15 = identity;
			try {
				Long.parseLong(id15); // 校验是否为数字字符串

				String birthday = "19" + id15.substring(6, 12);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				sdf.parse(birthday); // 校验出生日期
				if (identity.length() == 18 && !fixPersonIDCodeWithoutCheck(id15).equals(identity))
					return false; // 校验18位身份证
			} catch (Exception e) {
				return false;
			}
			return true;
		} else
			return false;
	}

	/**
	 * 从身份证号中获取出生日期，身份证号可以为15位或18位
	 * 
	 * @param identity
	 *            身份证号
	 * @return 出生日期
	 * @throws 身份证号出生日期段有误
	 */
	public static Timestamp getBirthdayFromPersonIDCode(String identity) throws Exception {
		String id = getFixedPersonIDCode(identity);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			Timestamp birthday = new Timestamp(sdf.parse(id.substring(6, 14)).getTime());
			return birthday;
		} catch (ParseException e) {
			throw new Exception("不是有效的身份证号，请检查");
		}
	}

	/**
	 * 从身份证号获取性别
	 * 
	 * @param identity
	 *            身份证号
	 * @return 性别代码
	 * @throws Exception
	 *             无效的身份证号码
	 */
	public static String getGenderFromPersonIDCode(String identity) throws Exception {
		String id = getFixedPersonIDCode(identity);
		char sex = id.charAt(16);
		return sex % 2 == 0 ? "2" : "1";
	}

	/**
	 * 将货币转换为大写形式(类内部调用)
	 * 
	 * @param val
	 * @return String
	 */
	private static String PositiveIntegerToHanStr(String NumStr) {
		// 输入字符串必须正整数，只允许前导空格(必须右对齐)，不宜有前导零
		String RMBStr = "";
		boolean lastzero = false;
		boolean hasvalue = false; // 亿、万进位前有数值标记
		int len, n;
		len = NumStr.length();
		if (len > 15)
			return "数值过大!";
		for (int i = len - 1; i >= 0; i--) {
			if (NumStr.charAt(len - i - 1) == ' ')
				continue;
			n = NumStr.charAt(len - i - 1) - '0';
			if (n < 0 || n > 9)
				return "输入含非数字字符!";

			if (n != 0) {
				if (lastzero)
					RMBStr += HanDigiStr[0]; // 若干零后若跟非零值，只显示一个零
				// 除了亿万前的零不带到后面
				// if( !( n==1 && (i%4)==1 && (lastzero || i==len-1) ) )
				// 如十进位前有零也不发壹音用此行
				if (!(n == 1 && (i % 4) == 1 && i == len - 1)) // 十进位处于第一位不发壹音
					RMBStr += HanDigiStr[n];
				RMBStr += HanDiviStr[i]; // 非零值后加进位，个位为空
				hasvalue = true; // 置万进位前有值标记

			} else {
				if ((i % 8) == 0 || ((i % 8) == 4 && hasvalue)) // 亿万之间必须有非零值方显示万
					RMBStr += HanDiviStr[i]; // “亿”或“万”
			}
			if (i % 8 == 0)
				hasvalue = false; // 万进位前有值标记逢亿复位
			lastzero = (n == 0) && (i % 4 != 0);
		}

		if (RMBStr.length() == 0)
			return HanDigiStr[0]; // 输入空字符或"0"，返回"零"
		return RMBStr;
	}

	/**
	 * 将货币转换为大写形式
	 * 
	 * @param val
	 *            传入的数据
	 * @return String 返回的人民币大写形式字符串
	 */
	public static String numToRMBStr(double val) {
		String SignStr = "";
		String TailStr = "";
		long fraction, integer;
		int jiao, fen;

		if (val < 0) {
			val = -val;
			SignStr = "负";
		}
		if (val > 99999999999999.999 || val < -99999999999999.999)
			return "数值位数过大!";
		// 四舍五入到分
		long temp = Math.round(val * 100);
		integer = temp / 100;
		fraction = temp % 100;
		jiao = (int) fraction / 10;
		fen = (int) fraction % 10;
		if (jiao == 0 && fen == 0) {
			TailStr = "整";
		} else {
			TailStr = HanDigiStr[jiao];
			if (jiao != 0)
				TailStr += "角";
			// 零元后不写零几分
			if (integer == 0 && jiao == 0)
				TailStr = "";
			if (fen != 0)
				TailStr += HanDigiStr[fen] + "分";
		}
		// 下一行可用于非正规金融场合，0.03只显示“叁分”而不是“零元叁分”
		// if( !integer ) return SignStr+TailStr;
		return SignStr + PositiveIntegerToHanStr(String.valueOf(integer)) + "元" + TailStr;
	}

	/**
	 * 获取指定年份和月份对应的天数
	 * 
	 * @param year
	 *            指定的年份
	 * @param month
	 *            指定的月份
	 * @return int 返回天数
	 */
	public static int getDaysInMonth(int year, int month) {
		if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10)
				|| (month == 12)) {
			return 31;
		} else if ((month == 4) || (month == 6) || (month == 9) || (month == 11)) {
			return 30;
		} else {
			if (((year % 4) == 0) && ((year % 100) != 0) || ((year % 400) == 0)) {
				return 29;
			} else {
				return 28;
			}
		}
	}

	/**
	 * 根据所给的起止时间来计算间隔的天数
	 * 
	 * @param startDate
	 *            起始时间
	 * @param endDate
	 *            结束时间
	 * @return int 返回间隔天数
	 */
	public static int getIntervalDays(java.sql.Date startDate, java.sql.Date endDate) {
		long startdate = startDate.getTime();
		long enddate = endDate.getTime();
		long interval = enddate - startdate;
		int intervalday = (int) (interval / (1000 * 60 * 60 * 24));
		return intervalday;
	}

	/**
	 * 根据所给的起止时间来计算间隔的月数
	 * 
	 * @param startDate
	 *            起始时间
	 * @param endDate
	 *            结束时间
	 * @return int 返回间隔月数
	 */
	public static int getIntervalMonths(java.sql.Date startDate, java.sql.Date endDate) {
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		int startDateM = startCal.MONTH;
		int startDateY = startCal.YEAR;
		int enddatem = endCal.MONTH;
		int enddatey = endCal.YEAR;
		int interval = (enddatey * 12 + enddatem) - (startDateY * 12 + startDateM);
		return interval;
	}

	/**
	 * 返回当前日期时间字符串<br>
	 * 默认格式:yyyy-mm-dd hh:mm:ss
	 * 
	 * @return String 返回当前字符串型日期时间
	 */
	public static String getCurrentTime() {
		String returnStr = null;
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		returnStr = f.format(date);
		return returnStr;
	}

	/**
	 * 返回当前日期时间字符串<br>
	 * 默认格式:yyyymmddhhmmss
	 * 
	 * @return String 返回当前字符串型日期时间
	 */
	public static BigDecimal getCurrentTimeAsNumber() {
		String returnStr = null;
		SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		returnStr = f.format(date);
		return new BigDecimal(returnStr);
	}

	/**
	 * 返回自定义格式的当前日期时间字符串
	 * 
	 * @param format
	 *            格式规则
	 * @return String 返回当前字符串型日期时间
	 */
	public static String getCurrentTime(String format) {
		String returnStr = null;
		SimpleDateFormat f = new SimpleDateFormat(format);
		Date date = new Date();
		returnStr = f.format(date);
		return returnStr;
	}

	/**
	 * 返回当前字符串型日期
	 * 
	 * @return String 返回的字符串型日期
	 */
	public static String getCurDate() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = simpledateformat.format(calendar.getTime());
		return strDate;
	}

	/**
	 * 返回指定格式的字符型日期
	 * 
	 * @param date
	 * @param formatString
	 * @return
	 */
	public static String Date2String(Date date, String formatString) {
		if (G4Utils.isEmpty(date)) {
			return null;
		}
		SimpleDateFormat simpledateformat = new SimpleDateFormat(formatString);
		String strDate = simpledateformat.format(date);
		return strDate;
	}

	/**
	 * 返回当前字符串型日期
	 * 
	 * @param format
	 *            格式规则
	 * 
	 * @return String 返回的字符串型日期
	 */
	public static String getCurDate(String format) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat simpledateformat = new SimpleDateFormat(format);
		String strDate = simpledateformat.format(calendar.getTime());
		return strDate;
	}

	/**
	 * 返回TimeStamp对象
	 * 
	 * @return
	 */
	public static Timestamp getCurrentTimestamp() {
		Object obj = TypeCaseHelper.convert(getCurrentTime(), "Timestamp", "yyyy-MM-dd HH:mm:ss");
		if (obj != null)
			return (Timestamp) obj;
		else
			return null;
	}

	/**
	 * 将字符串型日期转换为日期型
	 * 
	 * @param strDate
	 *            字符串型日期
	 * @param srcDateFormat
	 *            源日期格式
	 * @param dstDateFormat
	 *            目标日期格式
	 * @return Date 返回的util.Date型日期
	 */
	public static Date stringToDate(String strDate, String srcDateFormat, String dstDateFormat) {
		Date rtDate = null;
		Date tmpDate = (new SimpleDateFormat(srcDateFormat)).parse(strDate, new ParsePosition(0));
		String tmpString = null;
		if (tmpDate != null)
			tmpString = (new SimpleDateFormat(dstDateFormat)).format(tmpDate);
		if (tmpString != null)
			rtDate = (new SimpleDateFormat(dstDateFormat)).parse(tmpString, new ParsePosition(0));
		return rtDate;
	}

	/**
	 * 合并字符串数组
	 * 
	 * @param a
	 *            字符串数组0
	 * @param b
	 *            字符串数组1
	 * @return 返回合并后的字符串数组
	 */
	public static String[] mergeStringArray(String[] a, String[] b) {
		if (a.length == 0 || isEmpty(a))
			return b;
		if (b.length == 0 || isEmpty(b))
			return a;
		String[] c = new String[a.length + b.length];
		for (int m = 0; m < a.length; m++) {
			c[m] = a[m];
		}
		for (int i = 0; i < b.length; i++) {
			c[a.length + i] = b[i];
		}
		return c;
	}

	/**
	 * 对文件流输出下载的中文文件名进行编码 屏蔽各种浏览器版本的差异性
	 */
	public static String encodeChineseDownloadFileName(HttpServletRequest request, String pFileName) {
		String agent = request.getHeader("USER-AGENT");
		try {
			if (null != agent && -1 != agent.indexOf("MSIE")) {
				pFileName = URLEncoder.encode(pFileName, "utf-8");
			} else {
				pFileName = new String(pFileName.getBytes("utf-8"), "iso8859-1");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return pFileName;
	}

	/**
	 * 根据日期获取星期
	 * 
	 * @param strdate
	 * @return
	 */
	public static String getWeekDayByDate(String strdate) {
		final String dayNames[] = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = new Date();
		try {
			date = sdfInput.parse(strdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendar.setTime(date);
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (dayOfWeek < 0)
			dayOfWeek = 0;
		return dayNames[dayOfWeek];
	}

	/**
	 * 判断是否是IE浏览器
	 * 
	 * @param userAgent
	 * @return
	 */
	public static boolean isIE(HttpServletRequest request) {
		String userAgent = request.getHeader("USER-AGENT").toLowerCase();
		boolean isIe = true;
		int index = userAgent.indexOf("msie");
		if (index == -1) {
			isIe = false;
		}
		return isIe;
	}

	/**
	 * 判断是否是Chrome浏览器
	 * 
	 * @param userAgent
	 * @return
	 */
	public static boolean isChrome(HttpServletRequest request) {
		String userAgent = request.getHeader("USER-AGENT").toLowerCase();
		boolean isChrome = true;
		int index = userAgent.indexOf("chrome");
		if (index == -1) {
			isChrome = false;
		}
		return isChrome;
	}

	/**
	 * 判断是否是Firefox浏览器
	 * 
	 * @param userAgent
	 * @return
	 */
	public static boolean isFirefox(HttpServletRequest request) {
		String userAgent = request.getHeader("USER-AGENT").toLowerCase();
		boolean isFirefox = true;
		int index = userAgent.indexOf("firefox");
		if (index == -1) {
			isFirefox = false;
		}
		return isFirefox;
	}

	/**
	 * 获取客户端类型
	 * 
	 * @param userAgent
	 * @return
	 */
	public static String getClientExplorerType(HttpServletRequest request) {
		String userAgent = request.getHeader("USER-AGENT").toLowerCase();
		String explorer = "未知浏览器";
		if (isIE(request)) {
			int index = userAgent.indexOf("msie");
			explorer = userAgent.substring(index, index + 8);
		} else if (isChrome(request)) {
			int index = userAgent.indexOf("chrome");
			explorer = userAgent.substring(index, index + 12);
		} else if (isFirefox(request)) {
			int index = userAgent.indexOf("firefox");
			explorer = userAgent.substring(index, index + 11);
		}
		return explorer.toUpperCase();
	}

	/**
	 * JS输出含有\n的特殊处理
	 * 
	 * @param pStr
	 * @return
	 */
	public static String replace4JsOutput(String pStr) {
		pStr = pStr.replace("\r\n", "<br/>&nbsp;&nbsp;");
		pStr = pStr.replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
		pStr = pStr.replace(" ", "&nbsp;");
		return pStr;
	}

	/**
	 * 获取class文件所在绝对路径
	 * 
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static String getPathFromClass(Class cls) {
		String path = null;
		if (cls == null) {
			throw new NullPointerException();
		}
		URL url = getClassLocationURL(cls);
		if (url != null) {
			path = url.getPath();
			if ("jar".equalsIgnoreCase(url.getProtocol())) {
				try {
					path = new URL(path).getPath();
				} catch (MalformedURLException e) {
				}
				int location = path.indexOf("!/");
				if (location != -1) {
					path = path.substring(0, location);
				}
			}
			File file = new File(path);
			try {
				path = file.getCanonicalPath();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path;
	}

	/**
	 * 这个方法可以通过与某个类的class文件的相对路径来获取文件或目录的绝对路径。 通常在程序中很难定位某个相对路径，特别是在B/S应用中。
	 * 通过这个方法，我们可以根据我们程序自身的类文件的位置来定位某个相对路径。
	 * 比如：某个txt文件相对于程序的Test类文件的路径是../../resource/test.txt，
	 * 那么使用本方法Path.getFullPathRelateClass("../../resource/test.txt",Test.class)
	 * 得到的结果是txt文件的在系统中的绝对路径。
	 * 
	 * @param relatedPath
	 *            相对路径
	 * @param cls
	 *            用来定位的类
	 * @return 相对路径所对应的绝对路径
	 * @throws IOException
	 *             因为本方法将查询文件系统，所以可能抛出IO异常
	 */
	public static String getFullPathRelateClass(String relatedPath, Class cls) {
		String path = null;
		if (relatedPath == null) {
			throw new NullPointerException();
		}
		String clsPath = getPathFromClass(cls);
		File clsFile = new File(clsPath);
		String tempPath = clsFile.getParent() + File.separator + relatedPath;
		File file = new File(tempPath);
		try {
			path = file.getCanonicalPath();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return path;
	}

	/**
	 * 获取类的class文件位置的URL
	 * 
	 * @param cls
	 * @return
	 */
	private static URL getClassLocationURL(final Class cls) {
		if (cls == null)
			throw new IllegalArgumentException("null input: cls");
		URL result = null;
		final String clsAsResource = cls.getName().replace('.', '/').concat(".class");
		final ProtectionDomain pd = cls.getProtectionDomain();
		if (pd != null) {
			final CodeSource cs = pd.getCodeSource();
			if (cs != null)
				result = cs.getLocation();
			if (result != null) {
				if ("file".equals(result.getProtocol())) {
					try {
						if (result.toExternalForm().endsWith(".jar") || result.toExternalForm().endsWith(".zip"))
							result = new URL("jar:".concat(result.toExternalForm()).concat("!/").concat(clsAsResource));
						else if (new File(result.getFile()).isDirectory())
							result = new URL(result, clsAsResource);
					} catch (MalformedURLException ignore) {
					}
				}
			}
		}
		if (result == null) {
			final ClassLoader clsLoader = cls.getClassLoader();
			result = clsLoader != null ? clsLoader.getResource(clsAsResource) : ClassLoader
					.getSystemResource(clsAsResource);
		}
		return result;
	}

	/**
	 * 获取start到end区间的随机数,不包含start+end
	 * 
	 * @param start
	 * @param end
	 * @return
	 */
	public static BigDecimal getRandom(int start, int end) {
		return new BigDecimal(start + Math.random() * end);
	}

	/**
	 * 将字符串写入指定文件 (当指定的父路径中文件夹不存在时，会最大限度去创建，以保证保存成功！)
	 * 
	 * @param res
	 *            原字符串
	 * @param filePath
	 *            文件路径
	 * @return 成功标记
	 */
	public static boolean writeString2File(String res, String filePath) {
		boolean flag = true;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		try {
			File distFile = new File(filePath);
			if (!distFile.getParentFile().exists())
				distFile.getParentFile().mkdirs();
			bufferedReader = new BufferedReader(new StringReader(res));
			bufferedWriter = new BufferedWriter(new FileWriter(distFile));
			char buf[] = new char[1024];
			int len;
			while ((len = bufferedReader.read(buf)) != -1) {
				bufferedWriter.write(buf, 0, len);
			}
			bufferedWriter.flush();
			bufferedReader.close();
			bufferedWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
			flag = false;
			return flag;
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}

	/**
	 * 文本文件转换为指定编码的字符串
	 * 
	 * @param file
	 *            文本文件
	 * @param encoding
	 *            编码类型
	 * @return 转换后的字符串
	 * @throws IOException
	 */
	public static String readStringFromFile(File file, String encoding) {
		InputStreamReader reader = null;
		StringWriter writer = new StringWriter();
		try {
			if (encoding == null || "".equals(encoding.trim())) {
				reader = new InputStreamReader(new FileInputStream(file), encoding);
			} else {
				reader = new InputStreamReader(new FileInputStream(file));
			}
			char[] buffer = new char[1024];
			int n = 0;
			while (-1 != (n = reader.read(buffer))) {
				writer.write(buffer, 0, n);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (reader != null)
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		if (writer != null)
			return writer.toString();
		else
			return null;
	}

	/**
	 * 字符串编码转换工具类
	 * 
	 * @param pString
	 * @return
	 */
	public static String getGBK(String pString) {
		if (isEmpty(pString)) {
			return "";
		}
		try {
			pString = new String(pString.getBytes("ISO-8859-1"), "GBK");
		} catch (UnsupportedEncodingException e) {
			log.error(G4Constants.Exception_Head + "不支持的字符集编码");
			e.printStackTrace();
		}
		return pString;
	}

}