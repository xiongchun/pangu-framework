package aos.system.modules.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aos.demo.dao.Demo_accountDao;
import aos.demo.dao.Demo_accountPO;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSJson;
import aos.framework.web.router.HttpModel;

/**
 * 范例
 * 
 * @author xiongchun
 *
 */
@Service
public class DemoService {
	
	@Autowired
	private Demo_accountDao demo_accountDao;
	
	/**
	 * 范例1
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc1(HttpModel httpModel) {
		httpModel.setViewPath("demo/misc/misc1.jsp");
	}
	
	/**
	 * 查询账户信息列表
	 * @param httpModel
	 */
	public void listAccounts(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<Demo_accountPO> accountPOs = demo_accountDao.listPage(inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(accountPOs, inDto.getPageTotal()));
	}
	
	/**
	 * 查询账户信息
	 * @param httpModel
	 */
	public void getOrgInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Demo_accountPO demo_accountPo = demo_accountDao.selectByKey(inDto.getString("id_"));
		httpModel.setOutMsg(AOSJson.toJson(demo_accountPo));
	}
	
	
	
}
