package cn.osworks.aos.system.modules.controller.auth;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.auth.PostService;


/**
 * 岗位与授权
 * 
 * @author OSWorks-XC
 * @date 2014-08-08
 */
@Controller
@RequestMapping(value = "system/post")
public class PostController {

	@Autowired
	private PostService postService;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;

	/**
	 * 页面初始化
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "init")
	public String init(HttpSession session, HttpServletRequest request) {
		UserInfoVO userInfoVO = WebCxt.getUserInfo(session);
		request.setAttribute("dept_", userInfoVO.getOrgInfo());
		Dto rootDto_ = Dtos.newDto();
		String rootId, rootText, rootIcon;
		if (StringUtils.equals(userInfoVO.getType_(), DicCons.USER_TYPE_SUPER)) {
			//超级用户
			rootId = AOSCons.MODULE_ROOT_ID;
			Aos_sys_modulePO aos_sys_modulePO = aos_sys_moduleMapper.selectByKey(rootId);
			rootText = aos_sys_modulePO.getName_();
			rootIcon = aos_sys_modulePO.getIcon_name_();
		}else {
			rootId = "p";
			rootText = "请选择";
			rootIcon = "";
		}
		rootDto_.put("rootId", rootId);
		rootDto_.put("rootText", rootText);
		rootDto_.put("rootIcon", rootIcon);
		request.setAttribute("rootDto_", rootDto_);
		return "aos/auth/post.jsp";
	}
	
	/**
	 * 查询岗位列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listPosts")
	public void listPosts(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		List<Dto> list = postService.getPostsInOrg(qDto);
		String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存岗位信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "savePost")
	public void savePost(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		postService.savePost(dto);
		WebCxt.write(response, "操作完成, 岗位新增成功。");
	}
	
	/**
	 * 修改岗位信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updatePost")
	public void updatePost(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		postService.updatePost(dto);
		WebCxt.write(response, "操作完成, 岗位修改成功。");
	}
	
	/**
	 * 删除岗位信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deletePost")
	public void deletePost(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = postService.deletePost(dto);
		WebCxt.write(response, AOSJson.toJson(outDto));
	}
	
	/**
	 * 修改岗位状态
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateStatus")
	public void updateStatus(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		postService.updateStatus(dto);
		WebCxt.write(response, "操作完成, 岗位状态更新成功。");
	}
	
	/**
	 * 批量修改岗位所属组织
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "updatePostOrg")
	public void updatePostOrg(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		postService.updatePostOrgBatch(dto);
		WebCxt.write(response, "操作完成, 岗位所属组织更新成功。");
	}
	
	/**
	 * 获取菜单树(一次加载全部节点) 授权选择
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getModuleTree4Select")
	public void getModuleTree4Select(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = postService.getModuleTree4Select(inDto);
		WebCxt.write(response, jsonString);
	}

	/**
	 * 获取菜单树(一次加载全部节点) 查看已授权
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "getModuleTree4Selected")
	public void getModuleTree4Selected(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String jsonString = postService.getModuleTree4Selected(inDto).getStringA();
		WebCxt.write(response, jsonString);
	}
	
	/**
	 * 保存岗位-功能模块授权信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "savePostModuleGrantInfo")
	public void savePostModuleGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		postService.savePostModuleGrantInfo(dto);
		WebCxt.write(response, "授权信息保存成功。");
	}
	
	/**
	 * 查询用户列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listUsers")
	public void listUsers(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		//后台SQL过滤超级用户
		qDto.put("grant", true); 
		//去除当前用户(普通管理员)
		qDto.put("user_id_", qDto.getUserInfo().getId_());
		qDto.put("delete_flag_", DicCons.DELETE_FLAG.NO);
		List<Dto> list = postService.getUsersInOrg4Grant(qDto);
		String outString = AOSJson.toGridJson(list);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 查询用户列表2(已选用户)
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listUsers2")
	public void listUsers2(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		qDto.put("delete_flag_", DicCons.DELETE_FLAG.NO);
		List<Dto> list = postService.listGrantedUsersOfPost(qDto);
		String outString = AOSJson.toGridJson(list);
		WebCxt.write(response, outString);
	}
	
	/**
	 * 取消岗位用户授权
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "delPostUserGrantInfo")
	public void delPostUserGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		Dto outDto = postService.delPostUserGrantInfo(qDto);
		String outString = AOSUtils.merge("操作成功，取消了{0}个用户与岗位的关联。", outDto.getIntegerA());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存岗位用户授权信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "savePostUserGrantInfo")
	public void savePostUserGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		postService.savePostUserGrantInfo(dto);
		WebCxt.write(response, "操作完成，授权信息保存成功。");
	}
	
}
