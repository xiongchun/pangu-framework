package cn.osworks.aos.web.tag.impl.app;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSReflector;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.web.tag.core.model.TagDto;


/**
 * <b>资源导入标签</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-06-06
 */
public class IncludeTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String lib;
	private String css;
	private String js;
	private String var; // 导出的变量对象

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {

	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		if (AOSUtils.isNotEmpty(lib)) {
			String[] libs = lib.split(",");
			for (String libkey : libs) {
				tagDto.put(libkey, TRUE);
			}
		}
		tagDto.put("css", css);
		tagDto.put("js", js);
		UserInfoVO userInfoVO = WebCxt.getUserInfo(pageContext.getSession());
		String skin = WebCxt.getCfgByUser(pageContext.getSession(), "skin_");
		tagDto.put("skin", skin);
		tagDto.put("var", var);
		// 导入用户信息和系统参数
		if (AOSUtils.isNotEmpty(var)) {
			String[] arrarVars = var.split(",");
			for (String curvar : arrarVars) {
				if (curvar.equalsIgnoreCase("user")) {
					// 导出用户信息，如果用户对象为空则不导出
					if (AOSUtils.isNotEmpty(userInfoVO)) {
						tagDto.put("userString", AOSJson.toJson(userInfoVO));
					}
				} else if (curvar.equalsIgnoreCase("syscfg")) {
					// 导出系统参数
					Dto sysCfgDto = Dtos.newDto();
					Aos_sys_paramMapper aos_sys_paramMapper = (Aos_sys_paramMapper) AOSCxt.getBean("aos_sys_paramMapper");
					List<Aos_sys_paramPO> aos_sys_paramPOList = aos_sys_paramMapper.list(Dtos.newDto());
					for (Aos_sys_paramPO aos_sys_paramPO : aos_sys_paramPOList) {
						sysCfgDto.put(aos_sys_paramPO.getKey_(), aos_sys_paramPO.getValue_());
						// 当用户对象不为空，才计算用户配置的覆盖值
						if (AOSUtils.isNotEmpty(userInfoVO)) {
							if (AOSUtils.isNotEmpty(aos_sys_paramPO.getOverwrite_field_()) && AOSCons.YES.equals(aos_sys_paramPO.getIs_overwrite_())) {
								Aos_sys_user_cfgPO aos_sys_user_cfgPO = WebCxt.getUserCfgInfo(userInfoVO.getId_());
								String value = "";
								if (AOSUtils.isNotEmpty(aos_sys_user_cfgPO)) {
									value = (String) AOSReflector.getFieldValue(aos_sys_user_cfgPO, aos_sys_paramPO.getOverwrite_field_());
								}
								if (AOSUtils.isNotEmpty(value)) {
									sysCfgDto.put(aos_sys_paramPO.getKey_(), value);
								}
							}
						} else {
							// 当用户对象为空，直接输出原始系统参数值
						}
					}
					// 导出系统参数信息
					tagDto.put("sysCfgString", AOSJson.toJson(sysCfgDto));
				}
			}
		}
		String jspString = mergeFileTemplate(APPVM + "includeTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return SKIP_BODY;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getLib() {
		return lib;
	}

	public void setLib(String lib) {
		this.lib = lib;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getJs() {
		return js;
	}

	public void setJs(String js) {
		this.js = js;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

}
