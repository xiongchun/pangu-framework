package cn.osworks.aos.temp;

import cn.osworks.aos.core.id.AOSId;


public class Temp1 {
	
	public static void main(String[] argStrings) {
/*		SqlDao sysDao = (SqlDao)AOSBeanLoader.getSpringBean("sysDao");
		Aos_sys_dic_indexMapper aos_sys_dic_indexMapper = (Aos_sys_dic_indexMapper)AOSBeanLoader.getSpringBean("aos_sys_dic_indexMapper");
		Aos_sys_dicMapper aos_sys_dicMapper = (Aos_sys_dicMapper)AOSBeanLoader.getSpringBean("aos_sys_dicMapper");
		Aos_sys_catalogMapper aos_sys_catalogMapper = (Aos_sys_catalogMapper)AOSBeanLoader.getSpringBean("aos_sys_catalogMapper");
		Aos_sys_paramMapper aos_sys_paramMapper = (Aos_sys_paramMapper)AOSBeanLoader.getSpringBean("aos_sys_paramMapper");
		
		List<Aos_sys_paramPO> list = aos_sys_paramMapper.list(null);
		for (Aos_sys_paramPO aos_sys_paramPO : list) {
			String ccid_ = aos_sys_paramPO.getCatalog_cascade_id_();
			String uuid = (String)sysDao.selectOne("Auth.test3", ccid_);
			Dto dto = Dtos.newDto();
			dto.put("catalog_id_", uuid);
			dto.put("catalog_cascade_id_", ccid_);
			sysDao.update("Auth.test1", dto);
		}*/
		
/*		for (Aos_sys_modulePO aos_sys_modulePO : list) {
			Dto dto = Dtos.newDto();
			String parent_id_ = aos_sys_modulePO.getParent_id_();
			String uuid_ = (String)sysDao.selectOne("Auth.test3", parent_id_);
			if (AOSUtils.isEmpty(uuid_)) {
				continue;
			}
			dto.put("parent_id_", uuid_);
			dto.put("cascade_id_", aos_sys_modulePO.getCascade_id_());
			sysDao.update("Auth.test2", dto);
		}*/
		
		for (int i = 0; i < 100; i++) {
			System.out.println(AOSId.uuid());
		}
		
	}
}
