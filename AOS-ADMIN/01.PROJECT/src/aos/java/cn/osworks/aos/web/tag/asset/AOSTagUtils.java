package cn.osworks.aos.web.tag.asset;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
import java.util.UUID;

/**
 * <b>标签实现辅助工具类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-03-06
 */
public class AOSTagUtils {

	private static final String STANDARD_TAG = "org.apache.taglibs.standard";

	/**
	 * 非空常量状态标志
	 */
	public static final String APP = "169";
	/**
	 * 开始标签
	 */
	public static final String STARTTAG = "startTag";
	/**
	 * 结束标签
	 */
	public static final String ENDTAG = "endTag";

	/**
	 * 获取标签库使用的UUID
	 * 
	 * @return
	 */
	public static String getUUID4Tag() {
		String uuidString = UUID.randomUUID().toString();
		uuidString = uuidString.substring(0, 8);
		return uuidString;
	}

	/**
	 * 获取父标签，排除标准标签。
	 * 
	 * @param parentTag
	 *            当前标签的父标签
	 * @return
	 */
	public static Tag getParent(Tag parentTag) {
		String name = parentTag.getClass().getName();
		// 当前标签的父标签是标准标签，则继续寻找，直到找到第一个自定义父标签
		if (StringUtils.indexOf(name, STANDARD_TAG) != -1) {
			Tag temTag = parentTag.getParent();
			while (true) {
				String tempName = temTag.getClass().getName();
				if (StringUtils.indexOf(tempName, STANDARD_TAG) == -1) {
					// 不是标准标签了，则跳出返回
					parentTag = temTag;
					break;
				} else {
					// 还是标准标签，则继续循环
					temTag = temTag.getParent();
				}
			}
		}
		return parentTag;
	}

	/**
	 * 处理标签RenderTo属性逻辑
	 * 
	 * @param renderTo
	 * @return
	 */
	public static String getRenderTo(String renderTo) {
		if (renderTo != null) {
			if (renderTo.startsWith("!")) {
				renderTo = renderTo.substring(1);
			} else {
				renderTo = "'" + renderTo + "'";
			}
		}
		return renderTo;
	}

	/**
	 * 自动拼接icon存储路径后返回
	 * 
	 * @return
	 */
	public static String getIcon(String icon, PageContext pageContext) {
		String iconPath = AOSXmlOptionsHandler.getValue("icon_path");
		if (AOSUtils.isNotEmpty(icon)) {
			icon = pageContext.getServletContext().getContextPath() + iconPath + icon;
		}
		return icon;
	}

	/**
	 * 自动转换矢量图标并返回
	 * 
	 * @return
	 */
	public static String getIconVec(String iconVec, String iconVecSize) {
		if (AOSUtils.isNotEmpty(iconVec)) {
			// 矢量图标缺省大小 13px
			//TODO 可以增加设置矢量图标颜色的属性
			iconVecSize = AOSUtils.isEmpty(iconVecSize) ? "13" : iconVecSize;
			iconVec = AOSUtils.merge("<span style=\"font-size:{0}px;\"><i  class=\"fa {1}\"></i></span>", iconVecSize,
					iconVec);
		}
		return iconVec;
	}

	/**
	 * 去除最后一个,
	 * 
	 * @return
	 */
	public static String removeEndComma(String any) {
		if (any == null) {
			return any;
		}
		if (any.endsWith(",")) {
			any = any.substring(0, any.length() - 1);
		}
		return any;
	}

	/**
	 * 标题格式处理
	 * 
	 * @return
	 */
	public static String getTitle(String title) {
		if (AOSUtils.isNotEmpty(title)) {
			if (title.startsWith("!")) {
				title = title.substring(1);
				title = "<span class=\"app-container-title-bold\">" + title + "</span>";
			} else {
				title = "<span class=\"app-container-title-normal\">" + title + "</span>";
			}
		}
		return title;
	}

	/**
	 * 对于FormPanle及其子类、WindowTag也类似，覆盖父类中的style属性
	 * 由于经典布局下，面板即便是设置frame=false后，还是有一个背景色。如果对formpanel设置了paddding之类的属性，
	 * 则会出现本应是白色底板变成背景色的情况。所以这里对formpanel设置组件style的背景色。
	 * 
	 * 提示：别试图将这个属性的json配置对格式该为原生css语法，表单布局fieldset会出现一些非预期的问题。
	 */
	public static String getMyStyleOrBodyStye(String style) {
		String myStyle = "backgroundColor:'#FFFFFF'";
		if (AOSUtils.isNotEmpty(style)) {
			myStyle = myStyle + "," + style;
		}
		return myStyle;
	}

	/**
	 * 为该文本追加一个样式类
	 * 
	 * @return
	 */
	public static String addCssClass(String text, String cls) {
		if (AOSUtils.isNotEmpty(text)) {
			text = "<span class=\"" + cls + "\">" + text + "</span>";
		}
		return text;
	}

	/**
	 * 将百分数转为小数字符串
	 * 
	 * @return
	 */
	public static String getNumberString(String pString) {
		if (AOSUtils.isEmpty(pString)) {
			return pString;
		}
		float result = new Float(pString.substring(0, pString.indexOf("%"))) / 100;
		return String.valueOf(result);
	}

	/**
	 * 转换为布尔值
	 * 
	 * @return
	 */
	public static Boolean getBoolean(String pString) {
		if (AOSUtils.isEmpty(pString)) {
			return null;
		}
		return Boolean.valueOf(pString);
	}

	/**
	 * 处理边框
	 * 
	 * @param border
	 * @return
	 */
	public static String getMyBorder(String border) {
		if (AOSUtils.isEmpty(border)) {
			return border;
		}
		if (border.equals("true") || border.equals("false")) {
			return border;
		}
		return padQuota(border);
	}

	/**
	 * 加单引号。为了支持模版原样输出，兼容字符串和JS对象的配置
	 * 
	 * @param pString
	 * @return
	 */
	public static String padQuota(String pString) {
		if (AOSUtils.isEmpty(pString)) {
			return pString;
		}
		return "'" + pString + "'";
	}

	/**
	 * 组件宽度处理
	 * 
	 * @return
	 */
	public static String getMyWidth(String width) {
		if (AOSUtils.isEmpty(width)) {
			return width;
		}
		if (width.startsWith("-")) {
			width = "document.body.clientWidth" + width;
		}
		if (width.equals("auto")) {
			return padQuota(width);
		}
		return width;
	}
	
	/**
	 * 组件最大宽度处理
	 * 
	 * @return
	 */
	public static String getMyMaxWidth(String maxWidth) {
		if (AOSUtils.isEmpty(maxWidth)) {
			return maxWidth;
		}
		if (maxWidth.startsWith("-")) {
			maxWidth = "document.body.clientWidth" + maxWidth;
		}
		return maxWidth;
	}

	/**
	 * 组件高度处理
	 * 
	 * @return
	 */
	public static String getMyHeight(String height) {
		if (AOSUtils.isEmpty(height)) {
			return height;
		}
		if (height.startsWith("-")) {
			// 总结:XHTML中用
			// document.documentElement.clientHeight代替document.body.clientHeight。
			// height = "document.body.clientHeight" + height;
			height = "document.documentElement.clientHeight" + height;
		}
		if (height.equals("auto")) {
			return padQuota(height);
		}
		return height;
	}
	
	/**
	 * 组件最大高度处理
	 * 
	 * @return
	 */
	public static String getMyMaxHeight(String maxHeight) {
		if (AOSUtils.isEmpty(maxHeight)) {
			return maxHeight;
		}
		if (maxHeight.startsWith("-")) {
			// 总结:XHTML中用
			// document.documentElement.clientHeight代替document.body.clientHeight。
			// height = "document.body.clientHeight" + height;
			maxHeight = "document.documentElement.clientHeight" + maxHeight;
		}
		return maxHeight;
	}

	/**
	 * 处理DataView的Store的field属性
	 * 
	 * @param fields
	 * @return
	 */
	public static String getMyFields(String fields) {
		String outString = StringUtils.EMPTY;
		if (AOSUtils.isEmpty(fields)) {
			return outString;
		}
		String[] arrFields = fields.split(",");
		for (String field : arrFields) {
			outString = outString + padQuota(field) + ",";
		}
		if (arrFields.length > 0) {
			outString = StringUtils.substringBeforeLast(outString, ",");
		}
		return outString;
	}
	
	/**
	 * 判断皮肤是否是继承自海王星系列
	 * 
	 * @param skin
	 * @return
	 */
	public static boolean isExtendedNeptune(String skin){
		boolean flag = false;
		if (StringUtils.equalsIgnoreCase(skin, AOSCons.SKIN_NEPTUNE)) {
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 判断皮肤是否是继承自经典系列
	 * 
	 * @param skin
	 * @return
	 */
	public static boolean isExtendedClassic(String skin){
		return !isExtendedNeptune(skin);
	}

}
