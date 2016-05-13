package cn.osworks.aos.demo.asset;

import java.math.BigDecimal;

import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.demo.dao.mapper.Demo_accountMapper;
import cn.osworks.aos.demo.dao.mapper.Demo_orgMapper;
import cn.osworks.aos.demo.dao.po.Demo_accountPO;
import cn.osworks.aos.demo.dao.po.Demo_orgPO;

/**
 * 范例系统数据集线器
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("all")
public class DemoDataGenerator {

	static {

	}

	public static void main(String[] args) {
		//generateDemo_accountTableData(1);
		generateDemo_orgTableData();
	}

	// 生成Demo_account表数据
	private static void generateDemo_accountTableData(int maxInt) {
		Demo_accountMapper mapper = (Demo_accountMapper) AOSCxt.getBean("demo_accountMapper");
		Demo_accountPO demo_accountPO = new Demo_accountPO();
		for (int i = 0; i < maxInt; i++) {
			demo_accountPO.setId_(AOSId.id(DemoUtils.DEMOID));
			demo_accountPO.setName_(DemoUtils.getPersonName());
			demo_accountPO.setCard_id_(AOSId.id(DemoUtils.CARDID));
			demo_accountPO.setCard_type_(String.valueOf(AOSUtils.randomBetween(1, 2)));
			demo_accountPO.setBalance_(new BigDecimal(String.valueOf(AOSUtils.randomBetween(6000, 80000)) + "."
					+ String.valueOf(AOSUtils.randomBetween(0, 99))));
			demo_accountPO.setCredit_line_(new BigDecimal(80000));
			demo_accountPO.setOrg_id_("000");
			demo_accountPO.setId_no_("2925" + AOSUtils.randomBetween(1920, 2015) + AOSUtils.randomBetween(10, 12)
					+ AOSUtils.randomBetween(10, 30) + AOSUtils.randomBetween(1000, 9999));
			demo_accountPO.setSex_(String.valueOf(AOSUtils.randomBetween(1, 3)));
			demo_accountPO.setBirthday_(AOSUtils.getDate());
			demo_accountPO.setAge_(Integer.valueOf(String.valueOf(AOSUtils.randomBetween(18, 100))));
			demo_accountPO.setAddress_("上海霞飞路" + AOSUtils.randomBetween(1, 1000) + "号");
			demo_accountPO.setCreate_user_id_("1");
			demo_accountPO.setCreate_time_(AOSUtils.getDateTime());
			mapper.insert(demo_accountPO);
		}

	}
	
	// 生成Demo_org表数据
	private static void generateDemo_orgTableData() {
		Demo_orgMapper mapper = (Demo_orgMapper) AOSCxt.getBean("demo_orgMapper");
		Demo_orgPO demo_orgPO = new Demo_orgPO();
		demo_orgPO.setId_("5");
		demo_orgPO.setCascade_id_("0.003.002");
		demo_orgPO.setName_("云南分行大理支行");
		demo_orgPO.setParent_id_("3");
		demo_orgPO.setIs_leaf_(1);
		demo_orgPO.setIs_auto_expand_(0);
		demo_orgPO.setCreate_user_id_("1");
		demo_orgPO.setCreate_time_(AOSUtils.getDateTime());
		mapper.insert(demo_orgPO);
	}

}
