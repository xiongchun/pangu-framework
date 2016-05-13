package cn.osworks.aos.web.tag.impl.ext;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;


/**
 * <b>Button类型组件基类</b> <br>
 * 包括常规按钮、工具栏项目、菜单项目
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class ButtonTagSupport extends ComponentTagSupport {

	private static final long serialVersionUID = 1L;

	// 此属性由其子标签设置
	private String menuid;

	private String text;

	private String onclick;
	// 按钮大小
	private String scale;

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		super.pkgProperties(tagDto);
		tagDto.put("text", getMyText());
		tagDto.put("menuid", getMenuid());
		tagDto.put("tooltip", getTooltip());
		tagDto.put("onclick", getMyOnclick());
		tagDto.put("scale", getScale());
		return tagDto;
	}

	/**
	 * 组件显示文本加工
	 * 
	 * @param title
	 */
	private String getMyText() {
		String textString = AOSTagUtils.addCssClass(getText(), "app-normal");
		// 如果设置了矢量图标，则进行矢量图标和text属性的合并计算
		String iconVec = getIconVec();
		if (AOSUtils.isNotEmpty(iconVec)) {
			iconVec = AOSTagUtils.getIconVec(iconVec, getIconVecSize());
			if (StringUtils.equalsIgnoreCase("right", getIconVecAlign())) {
				textString = textString + " " + iconVec;
			} else {
				textString = iconVec + " " + textString;
			}
		}
		return textString;
	}

	/**
	 * 将menuTag的id属性传给父组件
	 * 
	 * @param menuid
	 */
	public void addMenuBySubTag(String menuid) {
		setMenuid(menuid);
	}

	/**
	 * 处理事件函数
	 * 
	 * @return
	 */
	public String getMyOnclick() {
		if (AOSUtils.isEmpty(onclick)) {
			return onclick;
		}

		if (StringUtils.isBlank(onclick)) {
			return null;
		}

		// 执行JS代码
		if (onclick.indexOf("#") != -1) {
			onclick = StringUtils.substring(onclick, 1);
			onclick = "function(){" + onclick + "}";
			return onclick;
		}

		if (onclick.indexOf("!") != -1) {
			return onclick.substring(1, onclick.length());
		}

		if (onclick.indexOf("(") == -1) {
			onclick = onclick + "()";
		}
		if (onclick.indexOf(";") == -1) {
			onclick = onclick + ";";
		}
		onclick = "function(){" + onclick + "}";
		return onclick;
	}

	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

}
