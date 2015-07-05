package cn.osworks.aos.system.asset;

import java.util.List;

import cn.osworks.aos.system.dao.po.Aos_sys_pagePO;

/**
 * 主从页面关系模型
 * 
 * @author xiongchun
 * @date 2015-1-22
 */
public class MasterDetailModel {
	
	/**
	 * 子页面集合
	 */
	private List<Aos_sys_pagePO> subPages;
	
	/**
	 * 缺省子页面
	 */
	private Aos_sys_pagePO defaultPage;

	public List<Aos_sys_pagePO> getSubPages() {
		return subPages;
	}

	public void setSubPages(List<Aos_sys_pagePO> subPages) {
		this.subPages = subPages;
	}

	public Aos_sys_pagePO getDefaultPage() {
		return defaultPage;
	}

	public void setDefaultPage(Aos_sys_pagePO defaultPage) {
		this.defaultPage = defaultPage;
	}
	
}
