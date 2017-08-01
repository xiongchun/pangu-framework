package aos.system.modules.online;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aos.framework.core.exception.AOSException;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.modules.cache.CacheUserDataService;

/**
 * 在线用户监控
 * 
 * @author xiongchun
 *
 */
@Service
public class OnlineUserService{
	
	@Autowired
	private CacheUserDataService cacheUserDataService;

	/**
	 * 在线用户监控页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		httpModel.setAttribute("juid", httpModel.getUserModel().getJuid());
		httpModel.setViewPath("system/onlineUser.jsp");
	}
	
	/**
	 * 查询用户列表
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listUsers(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<Dto> userList = cacheUserDataService.listOnlineUsersPage(inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(userList, inDto.getPageTotal()));
	}
	
	/**
	 * 强制下线
	 * 
	 * @param httpModel
	 * @return
	 */
	public void killUser(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		if (StringUtils.equalsIgnoreCase(inDto.getString("juidSelected"), httpModel.getUserModel().getJuid())) {
			throw new AOSException("不能自杀 :(");
		}
		if (StringUtils.equals(AOSCons.RUN_MODE.DEMO, AOSCxt.getParam("run_mode"))) {
			throw new AOSException(13);
		}
		cacheUserDataService.logout(inDto.getString("juidSelected"));
		httpModel.setOutMsg(AOSUtils.merge("用户[{0}]已被强制下线。", inDto.getString("name")));
	}
	
}
