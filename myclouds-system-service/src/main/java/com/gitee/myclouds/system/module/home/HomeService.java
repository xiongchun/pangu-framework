package com.gitee.myclouds.system.module.home;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.helper.treebuiler.TreeBuilder;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
import com.gitee.myclouds.base.util.BaseCons;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
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
	 * 首页框架初始化数据
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO init(Integer userId) {
		OutVO outVO = new OutVO(0);
		Dto dataDto = Dtos.newDto();
		List<TreeNodeVO> leftNavMenus = sqlSession.selectList("sql.home.listMenus", userId);
		leftNavMenus = new TreeBuilder(leftNavMenus).buildTree();
		dataDto.put("leftNavMenus", leftNavMenus);
		//dataDto.put(); maybe other data else
		outVO.setData(dataDto);
		return outVO;
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
		String password = MyUtil.password(BaseCons.PWD_KEY, inDto.getString("password"));
		MyUserEntity myUserEntity = myUserMapper.selectByKey(userId);
		if (!StringUtils.equals(password, myUserEntity.getPassword())) {
			throw new BizException(-23, "原密码输入错误，请重新输入");
		}
		MyUserEntity updateMyUserEntity = new MyUserEntity();
		updateMyUserEntity.setId(userId);
		updateMyUserEntity.setPassword(MyUtil.password(BaseCons.PWD_KEY, newPassword));
		myUserMapper.updateByKey(updateMyUserEntity);
		outVO.setMsg("密码修改成功");
		return outVO;
	}

}
