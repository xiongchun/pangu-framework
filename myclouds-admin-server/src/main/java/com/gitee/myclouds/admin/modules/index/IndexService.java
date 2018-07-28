package com.gitee.myclouds.admin.modules.index;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.common.web.vo.MenuVO;
import com.gitee.myclouds.toolbox.util.MyListUtil;
import com.gitee.myclouds.toolbox.util.MyUtil;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 首页服务
 * 
 * @author xiongchun
 * 
 */
@Service
public class IndexService {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 查询用户功能菜单列表
	 * 
	 * @param inDto
	 * @return
	 */
	//TODO 考虑缓存机制
	public List<MenuVO> listMenus(Dto inDto) {
		List<MenuVO> menuVOs = sqlSession.selectList("sql.index.listMenus", inDto);
		String ctxPath = inDto.getString("ctxPath");
		for (MenuVO menuVO : menuVOs) {
			String url = menuVO.getUrl();
			if (MyUtil.isNotEmpty(url)) {
				menuVO.setUrl(ctxPath + (StringUtils.startsWith(url, "/") ? url : "/" + url));
			}
		}
		String jql = "SELECT * FROM :MyList WHERE parent_id = :parent_id";
		List<MenuVO> level1Menus = MyListUtil.list(menuVOs, MenuVO.class, jql, Dtos.newDto("parent_id", 1));
		int i = 0;
		for (MenuVO menuVO : level1Menus) {
			List<MenuVO> level2Menus = MyListUtil.list(menuVOs, MenuVO.class, jql, Dtos.newDto("parent_id", menuVO.getId()));
			if (MyUtil.isNotEmpty(level2Menus)) {
				menuVO.setSubMenus(level2Menus);
				// 临时方案 控制登录后自动展开的一级菜单的数量，后续改为由用户自定义自动展开的一级菜单。
				if (i <= 1) {
					menuVO.setOpenClass("menu-open");
					i++;
				}
			}
		}
		return level1Menus;
	}
	
}
