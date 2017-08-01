package aos.framework.taglib.impl.ext.ux;


import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.PanelTagSupport;
import aos.framework.taglib.impl.ext.general.OnReadyTag;

import java.io.IOException;

/**
 * <b>Panel标签实现类</b>
 *
 * @author xiongchun
 * @date 2015-02-06
 */
public class IframeTag extends PanelTagSupport{

    private static final long serialVersionUID = 1L;
    private String loadMask;
    private String src;
    private String mask;

    /**
     * 预处理和标签逻辑校验
     *
     * @throws javax.servlet.jsp.JspException
     */
    private void doPrepare() throws JspException {
        doBorderPrepare();
        doWidthPrepare();
        doCenterIt();
        setXtype(Xtypes.IFRAME);
        resetListenerContainer();
        resetObjInContainerTag();
        // 通知onReadyTag加载依赖资源
        OnReadyTag onReadyTag = (OnReadyTag) findAncestorWithClass(this, OnReadyTag.class);
        onReadyTag.setIframe(TRUE);
    }

    /**
     * 开始标签
     */
    public int doStartTag() throws JspException {
        doPrepare();
        return SKIP_BODY;
    }

    /**
     * 结束标签
     */
    public int doEndTag() throws JspException {
        Dto tagDto = new TagDto();
        super.pkgProperties(tagDto);
        tagDto.put("loadMask", getLoadMask());
        tagDto.put("src", getSrc());
        tagDto.put("mask", getMask());
        String jspString = mergeFileTemplate(EXTVM + "iframeTag.vm", tagDto);
        try {
            pageContext.getOut().write(jspString);
        } catch (IOException e) {
            throw new JspException(e);
        }
        // Items组件处理
        addCur2ParentItems();
        doClear();
        return EVAL_PAGE;
    }

    /**
     * 后处理标签现场
     *
     * @throws JspException
     */
    public void doClear() throws JspException {
        super.doClear();
        setId(null);
    }

    /**
     * 释放资源
     */
    public void release() {
        super.release();
    }

    public String getLoadMask() {
        return loadMask;
    }

    public void setLoadMask(String loadMask) {
        this.loadMask = loadMask;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getMask() {
        return mask;
    }

    public void setMask(String mask) {
        this.mask = mask;
    }

}
