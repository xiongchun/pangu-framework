package aos.system.modules.icon;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.common.utils.SystemCons;
import aos.system.dao.AosIconDao;
import aos.system.dao.po.AosIconPO;

/**
 * 图标
 * 
 * @author xiongchun
 *
 */
@Service
public class IconService {

	@Autowired
	private AosIconDao aosIconDao;

	/**
	 * 在线用户监控页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		String type_ = inDto.getString("type");
		type_ = AOSUtils.isEmpty(type_) ? SystemCons.ICON_TYPE.SMALL : type_;
		httpModel.setAttribute("type", type_);
		int height_ = StringUtils.equalsIgnoreCase(type_, SystemCons.ICON_TYPE.BIG) ? 100 : 50;
		httpModel.setAttribute("height", height_);
		httpModel.setAttribute("juid", httpModel.getInDto().getString("juid"));
		httpModel.setViewPath("system/icon.jsp");
	}

	/**
	 * 查询图标
	 * 
	 * @param httpModel
	 */
	public void listIcons(HttpModel httpModel) {
		String cxt = httpModel.getRequest().getServletContext().getContextPath();
		Dto inDto = httpModel.getInDto();
		inDto.setOrder("type, name");
		List<AosIconPO> list = aosIconDao.like(inDto);
		List<Dto> newList = Lists.newArrayList();
		Dto dto = Dtos.newDto();
		for (AosIconPO aosIconPO : list) {
			dto = aosIconPO.toDto();
			// 截取过长字符串
			dto.put("name_s", StringUtils.substring(aosIconPO.getName(), 0, 14));
			String htmlString = "";
			if (aosIconPO.getType().equals("1")) {
				htmlString = "<img width=\"16\" height=\"16\" src=\"" + cxt + "/static/icon/" + aosIconPO.getName()
						+ "\" />";
			} else if (aosIconPO.getType().equals("2")) {
				htmlString = "<img width=\"64\" height=\"64\" src=\"" + cxt + "/static/icon/big64/"
						+ aosIconPO.getName() + "\" />";
			} else if (aosIconPO.getType().equals("3")) {
				htmlString = "<i class=\"fa " + aosIconPO.getName() + " fa-lg\"></i>";
			}
			dto.put("html", htmlString);
			newList.add(dto);
		}
		httpModel.setOutMsg(AOSJson.toGridJson(newList));
	}

}
