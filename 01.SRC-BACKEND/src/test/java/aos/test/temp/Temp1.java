package aos.test.temp;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCxt;

public class Temp1 {
	public static void main(String[] args) {
		Dto inDto = Dtos.newDto();
		inDto.put("cascade_", "true");
		inDto.put("cascade_id_", "0.001.007");
		inDto.setPageStart(0);
		inDto.setPageLimit(100);
		AOSCxt.getSqlDao().list("Module.listModulesPage", inDto);
	}

}
