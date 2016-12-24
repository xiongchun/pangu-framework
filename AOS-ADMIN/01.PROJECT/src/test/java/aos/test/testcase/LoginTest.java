package aos.test.testcase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.asset.AOSBeanLoader;
import aos.framework.core.id.AOSId;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.AosUserDao;
import aos.framework.dao.AosUserPO;
import aos.system.common.model.UserModel;
import aos.system.modules.cache.CacheUserDataService;

/**
 * 模拟登陆
 * 
 * @author xiongchun
 *
 */
public class LoginTest {
	
	private static Logger logger = LoggerFactory.getLogger(LoginTest.class);

	//模拟登陆入口
	public static void main(String[] args) {
		AosUserDao aosUserDao = (AosUserDao)AOSBeanLoader.getSpringBean("aosUserDao");
		AosUserPO aosUserPO = aosUserDao.selectByKey("1");
		UserModel userModel = new UserModel();
		AOSUtils.copyProperties(aosUserPO, userModel);
		String juid = AOSId.uuid();
		userModel.setJuid(juid);
		CacheUserDataService cacheUserDataService = (CacheUserDataService)AOSBeanLoader.getSpringBean("cacheService");
		cacheUserDataService.cacheUserModel(userModel);
		logger.info("用户：" + userModel.getName_() + "完成模拟登陆");
		logger.info("JUID：" + juid);
	}
	
	

}
