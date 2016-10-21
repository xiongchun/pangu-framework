package aos.system.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aos.framework.core.dao.SqlDao;

/**
 * 信贷系统服务基类
 * 
 * @author xiongchun
 *
 */
@Service
public class AOSBaseService {

	@Autowired
	protected SqlDao sqlDao;
		
}
