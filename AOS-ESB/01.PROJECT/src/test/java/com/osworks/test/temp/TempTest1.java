package com.osworks.test.temp;

import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dtos;

public class TempTest1 {

	public static void main(String[] args) {
		SqlDao sqlDao = (SqlDao) AOSCxt.getBean("sqlDao");
		sqlDao.list("Cache.test1", Dtos.newDto());
	}
}
