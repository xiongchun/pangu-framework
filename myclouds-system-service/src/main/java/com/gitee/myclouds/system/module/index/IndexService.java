package com.gitee.myclouds.admin.modules.index;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyListUtil;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.MenuVO;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

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
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	/**
	 * 查询用户功能菜单列表
	 * 
	 * @param inDto
	 * @return
	 */
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
		Integer defaultExpandMenuId = null;
		for (MenuVO menuVO : level1Menus) {
			List<MenuVO> level2Menus = MyListUtil.list(menuVOs, MenuVO.class, jql, Dtos.newDto("parent_id", menuVO.getId()));
			if (MyUtil.isNotEmpty(level2Menus)) {
				menuVO.setSubMenus(level2Menus);
				if (defaultExpandMenuId == null) {
					defaultExpandMenuId = menuVO.getId();
				}
			}
		}
		//登陆首页后的缺省打开的一级菜单的ID
		stringRedisTemplate.opsForHash().put(MyCons.CacheKeyOrPrefix.DefaultOpenMenuId.getValue(), inDto.getString("user_id"), defaultExpandMenuId.toString());
		return level1Menus;
	}
	
}
