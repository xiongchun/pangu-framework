package cn.osworks.aos.testcase;


/**
 * <b>JSON资料格式参考处理类单元测试用例</b>
 * 
 * @author OSWorks-XC
 * @date 2013-08-10
 */
public class JsonHelperTest {

/*	@Test
	public void testToJson_0() {
		Aos_sh_az01PO az01PO = getAos_sh_az01PO();
		String jsonString = AOSJson.toJson(az01PO, AOSCons.DATA);
		String expectString = "{\"az01a0\":\"000001\",\"az01a1\":\"0001\",\"az01a2\":\"xiongchun\"}";
		assertEquals(expectString, jsonString);
	}

	@Test
	public void testToJson_1() {
		Date date = new Date();
		String expectString = new SimpleDateFormat(AOSCons.DATATIME).format(date);
		Aos_sh_az01PO az01PO = new Aos_sh_az01PO();
		az01PO.setAz01b7(date);
		String jsonsString = AOSJson.toJson(az01PO);
		expectString = "{\"az01b7\":\"" + expectString + "\"}";
		assertEquals(expectString, jsonsString);
	}

	@Test
	public void testToJson_2() {
		Dto dto = getAz01Dto();
		String expectString = "{\"az01a0\":\"000001\",\"az01a1\":\"0001\",\"az01a2\":\"xiongchun\"}";
		String jsonsString = AOSJson.toJson(dto);
		assertEquals(expectString, jsonsString);
	}

	private Aos_sh_az01PO getAos_sh_az01PO() {
		Aos_sh_az01PO az01PO = new Aos_sh_az01PO();
		az01PO.setAz01a0("000001");
		az01PO.setAz01a1("0001");
		az01PO.setAz01a2("xiongchun");
		return az01PO;
	}

	private Dto getAz01Dto() {
		Aos_sh_az01PO az01PO = getAos_sh_az01PO();
		return az01PO.toDto();
	}*/
}
