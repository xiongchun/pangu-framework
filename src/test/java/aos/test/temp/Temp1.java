package aos.test.temp;

import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.gson.reflect.TypeToken;

import aos.framework.core.redis.JedisUtil;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.system.common.utils.SystemCons;

public class Temp1 {
	public static void main(String[] args) {
		final String cacheKey = SystemCons.KEYS.CARDLIST + -1;
		List<Dto> cardList = Lists.newArrayList();
		String cardListJson = JedisUtil.getString(cacheKey);
		if (AOSUtils.isNotEmpty(cardListJson)) {
			List<Map<String, String>> cardList2 = AOSJson.fromJson(cardListJson,new TypeToken<List<Map<String, String>>>() {
			}.getType());
			for (Map<String, String> map : cardList2) {
				Dto dto = Dtos.newDto(map);
				cardList.add(dto);
			}
		} 
		for (Dto dto : cardList) {
			System.out.println(dto);
		}
	}


}
