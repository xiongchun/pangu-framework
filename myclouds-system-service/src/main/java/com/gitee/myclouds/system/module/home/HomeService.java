package com.gitee.myclouds.system.module.home;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyListUtil;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.common.vo.MenuVO;
import com.gitee.myclouds.system.domain.myuser.MyUserEntity;
import com.gitee.myclouds.system.domain.myuser.MyUserMapper;

/**
 * 首页服务
 * 
 * @author xiongchun
 * 
 */
@Service
public class HomeService {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MyUserMapper myUserMapper;

	/**
	 * 查询用户功能菜单列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<MenuVO> listMenus(Dto inDto) {
		List<MenuVO> menuVOs = sqlSession.selectList("sql.home.listMenus", inDto);
		String ctxPath = inDto.getString("ctxPath");
		for (MenuVO menuVO : menuVOs) {
			String url = menuVO.getUrl();
			if (MyUtil.isNotEmpty(url)) {
				menuVO.setUrl(ctxPath + (StringUtils.startsWith(url, "/") ? url : "/" + url));
			}
		}
		String jql = "SELECT * FROM :MyList WHERE parent_id = :parent_id";
		List<MenuVO> level1Menus = MyListUtil.list(menuVOs, MenuVO.class, jql, Dtos.newDto("parent_id", 1));
		for (MenuVO menuVO : level1Menus) {
			List<MenuVO> level2Menus = MyListUtil.list(menuVOs, MenuVO.class, jql,
					Dtos.newDto("parent_id", menuVO.getId()));
			if (MyUtil.isNotEmpty(level2Menus)) {
				menuVO.setSubMenus(level2Menus);
			}
		}
		return level1Menus;
	}

	/**
	 * 修改当前登录用户密码
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO updatePwd(Dto inDto) {
		OutVO outVO = new OutVO(0);
		String newPassword = inDto.getString("new_password");
		if (!StringUtils.equals(newPassword, inDto.getString("confirm_password"))) {
			throw new BizException(-22, "新密码和确认密码不一致，请重新输入");
		}
		Integer userId = inDto.getInteger("id");
		String password = MyUtil.password(MyCons.PWD_KEY, inDto.getString("password"));
		MyUserEntity myUserEntity = myUserMapper.selectByKey(userId);
		if (!StringUtils.equals(password, myUserEntity.getPassword())) {
			throw new BizException(-23, "原密码输入错误，请重新输入");
		}
		MyUserEntity updateMyUserEntity = new MyUserEntity();
		updateMyUserEntity.setId(userId);
		updateMyUserEntity.setPassword(MyUtil.password(MyCons.PWD_KEY, newPassword));
		myUserMapper.updateByKey(updateMyUserEntity);
		outVO.setMsg("密码修改成功");
		return outVO;
	}

}
