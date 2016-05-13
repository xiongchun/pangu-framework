package cn.osworks.aos.web.tag.impl.app;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUrlUtils;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.web.tag.core.model.TagDto;


/**
 * <b>验证码生成标签</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-06-06
 */
public class VerCodeTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String fontSize; // 验证码字体大小
	private String characters; // 验证码待选字符
	private String length; // 验证码长度
	private String width; // 宽度
	private String height; // 高度
	private String url; // 生成验证码图片的url
	private String title; // 鼠标悬停验证码图片的提示信息
	private String animate; // 刷新验证码时是否出现动画效果

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		if (AOSUtils.isEmpty(getUrl())) {
			setUrl("/verCodeServlet.png");
		}
		if (AOSUtils.isEmpty(getTitle())) {
			setTitle("看不清，换一组");
		}
		if (AOSUtils.isEmpty(getAnimate())) {
			setAnimate(TRUE);
		}
		Dto paramDto = Dtos.newDto();
		paramDto.put("fontSize", getFontSize());
		paramDto.put("characters", getCharacters());
		paramDto.put("length", getLength());
		paramDto.put("width", getWidth());
		paramDto.put("height", getHeight());
		setUrl(getUrl() + "?" + AOSUrlUtils.urlEncode(paramDto));

	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		tagDto.put("url", getUrl());
		tagDto.put("title", getTitle());
		tagDto.put("animate", getAnimate());
		String jspString = mergeFileTemplate(APPVM + "verCodeTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		doClear();
		return SKIP_BODY;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	private void doClear() throws JspException {
		setId(null);
		setFontSize(null);
		setCharacters(null);
		setLength(null);
		setWidth(null);
		setHeight(null);
		setUrl(null);
		setTitle(null);
		setAnimate(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getFontSize() {
		return fontSize;
	}

	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}

	public String getCharacters() {
		return characters;
	}

	public void setCharacters(String characters) {
		this.characters = characters;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAnimate() {
		return animate;
	}

	public void setAnimate(String animate) {
		this.animate = animate;
	}

}
