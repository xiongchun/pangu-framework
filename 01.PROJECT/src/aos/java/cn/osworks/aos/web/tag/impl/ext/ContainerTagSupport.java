package cn.osworks.aos.web.tag.impl.ext;

import java.util.ArrayList;
import java.util.List;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.core.model.vo.ConfigVO;
import cn.osworks.aos.web.tag.core.model.vo.ItemVO;


/**
 * <b>Ext原生容器类组件基类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class ContainerTagSupport extends ComponentTagSupport {

	private static final long serialVersionUID = 1L;

	private String layout;

	private String split;

	private String anchor;

	private String x;

	private String y;

	private String rowspan;

	private String colspan;

	private String flex;

	private String autoShow;

	// 一组常用事件绑定

	private String onactivate;

	private String onclose;

	private String oncollapse;

	private String onexpand;

	private String onhide;

	private String onrender;

	private String onshow;

	/**
	 * 这个参数很特殊,在Ext-API中仅出现在window组件中，但是对于所有的容器类型组件都可以使用此属性。
	 * 
	 * 设置是否禁止在组件内容溢出时父容器是包容隐藏子组件
	 */
	private String constrain;

	/**
	 * 容器组件的布局配置对象
	 */
	private List<ConfigVO> layoutConfigVos;

	/**
	 * 容器组件的子组件集合
	 */
	private List<ItemVO> itemVOs;

	/**
	 * 增加容器的子组件信息
	 */
	public void addItem(ItemVO itemVO) {
		if (itemVOs == null) {
			itemVOs = new ArrayList<ItemVO>();
		}
		itemVOs.add(itemVO);
	}

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		super.pkgProperties(tagDto);
		tagDto.put("layout", getLayout());
		tagDto.put("split", getSplit());
		tagDto.put("layoutconfigvos", getLayoutConfigVos());
		tagDto.put("anchor", getAnchor());
		tagDto.put("x", getX());
		tagDto.put("y", getY());
		tagDto.put("rowspan", getRowspan());
		tagDto.put("colspan", getColspan());
		tagDto.put("flex", getFlex());
		tagDto.put("constrain", getConstrain());
		tagDto.put("autoShow", getAutoShow());
		// 一组常用事件绑定
		tagDto.put("onactivate", getOnactivate());
		tagDto.put("onclose", getOnclose());
		tagDto.put("oncollapse", getOncollapse());
		tagDto.put("onexpand", getOnexpand());
		tagDto.put("onhide", getOnhide());
		tagDto.put("onrender", getOnrender());
		tagDto.put("onrender", getOnrender());
		tagDto.put("onshow", getOnshow());
		// 子组件
		tagDto.put("items", getItemVOs());
		tagDto.put("loaderInit", AOSTagUtils.APP);
		return tagDto;
	}

	/**
	 * 重置Container里的组件集合(Items子组件、布局配置对象)
	 */
	protected void resetObjInContainerTag() {
		setItemVOs(null);
		setLayoutConfigVos(null);
	}

	/**
	 * 增加布局配置对象
	 */
	public void addLayoutConfig(ConfigVO configVO) {
		if (layoutConfigVos == null) {
			layoutConfigVos = new ArrayList<ConfigVO>();
		}
		layoutConfigVos.add(configVO);
	}

	public List<ItemVO> getItemVOs() {
		return itemVOs;
	}

	public void setItemVOs(List<ItemVO> itemVOs) {
		this.itemVOs = itemVOs;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public String getSplit() {
		return split;
	}

	public void setSplit(String split) {
		this.split = split;
	}

	public List<ConfigVO> getLayoutConfigVos() {
		return layoutConfigVos;
	}

	public void setLayoutConfigVos(List<ConfigVO> layoutConfigVos) {
		this.layoutConfigVos = layoutConfigVos;
	}

	public String getAnchor() {
		return anchor;
	}

	public void setAnchor(String anchor) {
		this.anchor = anchor;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getRowspan() {
		return rowspan;
	}

	public void setRowspan(String rowspan) {
		this.rowspan = rowspan;
	}

	public String getColspan() {
		return colspan;
	}

	public void setColspan(String colspan) {
		this.colspan = colspan;
	}

	public String getFlex() {
		return flex;
	}

	public void setFlex(String flex) {
		this.flex = flex;
	}

	public String getConstrain() {
		return constrain;
	}

	public void setConstrain(String constrain) {
		this.constrain = constrain;
	}

	public String getAutoShow() {
		return autoShow;
	}

	public void setAutoShow(String autoShow) {
		this.autoShow = autoShow;
	}

	public String getOnactivate() {
		return onactivate;
	}

	public void setOnactivate(String onactivate) {
		this.onactivate = onactivate;
	}

	public String getOnclose() {
		return onclose;
	}

	public void setOnclose(String onclose) {
		this.onclose = onclose;
	}

	public String getOncollapse() {
		return oncollapse;
	}

	public void setOncollapse(String oncollapse) {
		this.oncollapse = oncollapse;
	}

	public String getOnexpand() {
		return onexpand;
	}

	public void setOnexpand(String onexpand) {
		this.onexpand = onexpand;
	}

	public String getOnhide() {
		return onhide;
	}

	public void setOnhide(String onhide) {
		this.onhide = onhide;
	}

	public String getOnrender() {
		return onrender;
	}

	public void setOnrender(String onrender) {
		this.onrender = onrender;
	}

	public String getOnshow() {
		return onshow;
	}

	public void setOnshow(String onshow) {
		this.onshow = onshow;
	}

}
