package cn.osworks.aos.web.tag.impl.ext;

import java.util.ArrayList;
import java.util.List;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.vo.AfterRenderRegisterVO;
import cn.osworks.aos.web.tag.core.model.vo.ListenerVO;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;


/**
 * <b>Ext组件标签基类(含可视组件和逻辑组件)</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class ExtTagSupport extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	private String xtype;

	/**
	 * 标签库内部使用,对特殊标签用以辅助说明
	 */
	private String aboutme;

	// 内部标志，不生成标签属性
	private String listeners;

	// 监听容器
	private List<ListenerVO> listenerList;

	/**
	 * 需要在afterRender()里进行操作的子组件信息
	 * 注：本应该方在可视组件ComponentTagSupport里面，但由于VM的实现局限放在这里
	 */
	private List<AfterRenderRegisterVO> afterRenderRegisterList;

	/**
	 * 需要在afterRender()里进行操作的子组件信息 注：专门针对容器型组件的bottom位置docked组件上下位置颠倒的特殊情况而设置
	 */
	private List<AfterRenderRegisterVO> afterRenderRegisterDockedList;

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		super.pkgProperties(tagDto);
		tagDto.put("xtype", getXtype());
		tagDto.put("aboutme", getAboutme());
		tagDto.put("afterRenderRegisterList", getAfterRenderRegisterList());
		tagDto.put("listenerList", getListenerList());
		tagDto.put("listeners", getMyListenersFlag());
		return tagDto;
	}

	/**
	 * 增加监听
	 * 
	 * @param listenerVO
	 */
	public void addListener(ListenerVO listenerVO) {
		if (listenerList == null) {
			listenerList = new ArrayList<ListenerVO>();
		}
		listenerList.add(listenerVO);
	}

	/**
	 * 增加afterRenderID容器的子组件信息
	 * 
	 */
	public void addAfterRenderRegister(AfterRenderRegisterVO afterRenderRegisterVO) {
		if (afterRenderRegisterList == null) {
			afterRenderRegisterList = new ArrayList<AfterRenderRegisterVO>();
		}
		afterRenderRegisterList.add(afterRenderRegisterVO);
	}

	/**
	 * 增加afterRenderID容器的子组件信息
	 * 
	 */
	public void addAfterRenderRegister4ContainerBottomDocked(AfterRenderRegisterVO afterRenderRegisterVO) {
		if (afterRenderRegisterDockedList == null) {
			afterRenderRegisterDockedList = new ArrayList<AfterRenderRegisterVO>();
		}
		afterRenderRegisterDockedList.add(afterRenderRegisterVO);
	}

	/**
	 * 标记为非空，VM中根据此属性生成事件注册的相关代码。内部标志，不生成标签属性
	 * 
	 * @return
	 */
	public String getMyListenersFlag() {
		if (AOSUtils.isNotEmpty(getAfterRenderRegisterList())) {
			// 标记为一个标志常量,供lisntener.vm检验使用
			listeners = "app169";
		}
		if (AOSUtils.isNotEmpty(getAfterRenderRegisterDockedList())) {
			// 标记为一个标志常量,供lisntener.vm检验使用
			listeners = "app169";
		}
		if (AOSUtils.isNotEmpty(getListenerList())) {
			// 标记为一个标志常量,供lisntener.vm检验使用
			listeners = "app169";
		}
		return listeners;
	}

	/**
	 * 重置事件监听器，需要注册事件监听的组件标签必须调用
	 */
	protected void resetListenerContainer() {
		setAfterRenderRegisterList(null);
		setListenerList(null);
		setAfterRenderRegisterDockedList(null);
		setListeners(null);
	}

	/**
	 * 获取render后注册事件
	 * 
	 * @return
	 */
	public List<AfterRenderRegisterVO> getAfterRenderRegisterList() {
		if (AOSUtils.isEmpty(afterRenderRegisterList)) {
			return getAfterRenderRegisterDockedList();
		} else {
			afterRenderRegisterList.addAll(getAfterRenderRegisterDockedList());
		}
		return afterRenderRegisterList;
	}

	/**
	 * 将原始集合顺序颠倒后返回,配合JSP Docked标签栏位的正常显示顺序
	 * 
	 * @return
	 */
	public List<AfterRenderRegisterVO> getAfterRenderRegisterDockedList() {
		List<AfterRenderRegisterVO> list = new ArrayList<AfterRenderRegisterVO>();
		if (afterRenderRegisterDockedList == null) {
			return list;
		}
		int j = 0;
		for (int i = afterRenderRegisterDockedList.size() - 1; i >= 0; i--) {
			AfterRenderRegisterVO afterRenderRegisterVO = (AfterRenderRegisterVO) afterRenderRegisterDockedList.get(i);
			list.add(j, afterRenderRegisterVO);
			j++;
		}
		return list;
	}

	public String getXtype() {
		return xtype;
	}

	public List<ListenerVO> getListenerList() {
		return listenerList;
	}

	public void setListenerList(List<ListenerVO> listenerList) {
		this.listenerList = listenerList;
	}

	public void setAfterRenderRegisterList(List<AfterRenderRegisterVO> afterRenderRegisterList) {
		this.afterRenderRegisterList = afterRenderRegisterList;
	}

	public void setXtype(String xtype) {
		this.xtype = xtype;
	}

	public void setListeners(String listeners) {
		this.listeners = listeners;
	}

	public void setAfterRenderRegisterDockedList(List<AfterRenderRegisterVO> afterRenderRegisterDockedList) {
		this.afterRenderRegisterDockedList = afterRenderRegisterDockedList;
	}

	public String getAboutme() {
		return aboutme;
	}

	public void setAboutme(String aboutme) {
		this.aboutme = aboutme;
	}

}
