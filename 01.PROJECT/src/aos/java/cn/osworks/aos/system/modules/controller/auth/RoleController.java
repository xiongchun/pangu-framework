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
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_moduleMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_orgMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;
import cn.osworks.aos.system.modules.service.auth.RoleService;
import cn.osworks.aos.system.modules.service.auth.UserService;
import cn.osworks.aos.system.modules.service.resource.PageService;


/**
 * 角色与授权
 * 
 * @author OSWorks-XC
 * @date 2014-08-08
 */
@Controller
@RequestMapping(value = "system/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	@Autowired 
	private Aos_sys_orgMapper aos_sys_orgMapper;
	@Autowired
	private UserService userService;
	@Autowired
	private Aos_sys_moduleMapper aos_sys_moduleMapper;
	@Autowired 
	private PageService uiCmpService;
	@Autowired
	private SqlDao sqlDao;
	
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
		Dto _root = Dtos.newDto();
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
		_root.put("rootId", rootId);
		_root.put("rootText", rootText);
		_root.put("rootIcon", rootIcon);
		request.setAttribute("rootDto_", _root);
		return "aos/auth/role.jsp";
	}
	
	/**
	 * 查询角色列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "listRoles")
	public void listRoles(HttpServletRequest request, HttpServletResponse response) {
		Dto inDto = Dtos.newDto(request);
		String role_grant_mode = WebCxt.getCfgOfDB("role_grant_mode_");
		if (StringUtils.equals(AOSCons.ROLE_GRANT_MODE_NOCASCADE, role_grant_mode)) {
			inDto.put("creater_org_id_", inDto.getUserInfo().getOrg_id_());
		}else if (StringUtils.equals(AOSCons.ROLE_GRANT_MODE_CASCADE, role_grant_mode)){
			Aos_sys_orgPO aos_sys_orgPO = aos_sys_orgMapper.selectByKey(inDto.getUserInfo().getOrg_id_());
			inDto.put("creater_org_cascade_id_", aos_sys_orgPO.getCascade_id_());
		}else {
			inDto.put("creater_org_id_", inDto.getUserInfo().getOrg_id_());
		}
		List<Dto> list = sqlDao.list("Auth.listRoleInfosPage", inDto);
		String outString = AOSJson.toGridJson(list, inDto.getPageTotal());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存角色信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveRole")
	public void saveRole(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		roleService.saveRole(dto);
		WebCxt.write(response, "操作完成，角色保存成功。");
	}
	
	/**
	 * 修改角色信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateRole")
	public void updateRole(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		roleService.updateRole(dto);
		WebCxt.write(response, "操作完成，角色修改成功。");
	}
	
	/**
	 * 删除角色信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteRole")
	public void deleteRole(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		Dto outDto = roleService.deleteRole(dto);
		WebCxt.write(response, outDto.getAppMsg());
	}
	
	/**
	 * 修改角色状态
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "updateStatus")
	public void updateStatus(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		roleService.updateStatus(dto);
		WebCxt.write(response, "操作完成, 角色状态更新成功。");
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
		String jsonString = roleService.getModuleTree4Select(inDto);
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
		String jsonString = roleService.getModuleTree4Selected(inDto).getStringA();
		WebCxt.write(response, jsonString);
	}
	
	/**
	 * 保存角色-功能模块授权信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveRoleModuleGrantInfo")
	public void saveRoleModuleGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		roleService.saveRoleModuleGrantInfo(dto);
		WebCxt.write(response, "授权信息保存成功。");
	}
	
	/**
	 * 查询用户列表(待选用户)
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
		List<Dto> list = roleService.getUsersInOrg4Grant(qDto);
		String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
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
		List<Dto> list = roleService.listGrantedUsersOfRole(qDto);
		String outString = AOSJson.toGridJson(list, qDto.getPageTotal());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 取消角色用户授权
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "delRoleUserGrantInfo")
	public void delPostUserGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto qDto = Dtos.newDto(request);
		Dto outDto = roleService.delRoleUserGrantInfo(qDto);
		String outString = AOSUtils.merge("操作成功，取消了{0}个用户与角色的关联。", outDto.getIntegerA());
		WebCxt.write(response, outString);
	}
	
	/**
	 * 保存角色用户授权信息
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "saveRoleUserGrantInfo")
	public void saveRoleUserGrantInfo(HttpServletRequest request, HttpServletResponse response) {
		Dto dto = Dtos.newDto(request);
		roleService.saveRoleUserGrantInfo(dto);
		WebCxt.write(response, "授权信息保存成功。");
	}
}
