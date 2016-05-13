package cn.osworks.aos.testcase;


/**
 * <b>集合工具类测试用例</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2009-08-10
 */
public class ListUtilsTest {
/*
	*//**
	 * AOSListUtils.select()方法测试用例
	 *//*
	@Test
	public void testSelect() {
		List<Aos_sh_az01PO> list = TestData.getAz01List2(100);
		String jql = "SELECT * FROM :AOSList WHERE az01a2 LIKE :az01a2 ORDER BY az01a0 DESC";
		Dto dto = Dtos.newDto("az01a2", "xiongchun_2%");
		List<Aos_sh_az01PO> outList = AOSListUtils.select(list, Aos_sh_az01PO.class, jql, dto);
		assertEquals(11, outList.size());
	}

	*//**
	 * AOSListUtils.selectDto()方法测试用例 ：重点演示去除属性值相等的重复对象，和非数值字段的排序。
	 *//*
	@Test
	public void testUnion() {
		List<Aos_sh_az01PO> list1 = TestData.getAz01List2(10);
		List<Aos_sh_az01PO> list2 = TestData.getAz01List2(15);
		list1.addAll(list2);
		String jql = "SELECT DISTINCT az01a0,az01a1,az01a2 FROM :AOSList ORDER BY toNumber(az01a0) DESC";
		List<Dto> outList = AOSListUtils.selectDto(list1, Aos_sh_az01PO.class, jql, null);
		assertEquals(15, outList.size());
	}

	*//**
	 * 测试函数的应用
	 *//*
	@Test
	public void testFunction() {
		List<Aos_sh_az01PO> list1 = TestData.getAz01List2(20);
		String jqlText = "SELECT * FROM :AOSList WHERE length(az01a1) = 4";
		List<Dto> outList = AOSListUtils.selectDto(list1, Aos_sh_az01PO.class, jqlText, null);
		assertEquals(10, outList.size());
	}
	
	*//**
	 * AOSListUtils.distinct()方法测试用例
	 *//*
	@Test
	public void testDistinct() {
		List<Aos_sh_az01PO> list1 = TestData.getAz01List2(100);
		List<Aos_sh_az01PO> list2 = TestData.getAz01List2(150);
		list1.addAll(list2);
		List<Aos_sh_az01PO> outList = AOSListUtils.distinct(list1, Aos_sh_az01PO.class);
		assertEquals(150, outList.size());
	}*/
}
