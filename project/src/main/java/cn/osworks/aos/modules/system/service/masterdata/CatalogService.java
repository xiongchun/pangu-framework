package cn.osworks.aos.modules.system.service.masterdata;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSCons;
import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.asset.AOSXmlParam;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.base.typewrap.Dtos;
import cn.osworks.aos.core.id.AOSId;
import cn.osworks.aos.modules.system.dao.mapper.Aos_ge_catalogMapper;
import cn.osworks.aos.modules.system.dao.po.Aos_ge_catalogPO;
import cn.osworks.aos.web.misc.IdCons;



/**
 * <b>分类科目服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
@Service
public class CatalogService {

	@Autowired
	private Aos_ge_catalogMapper aos_ge_catalogMapper;
	
	/**
	 * 获取分类树节点集合
	 * 
	 * @param qDto
	 */
	public List<Dto> listCatalogs(Dto qDto) {
		qDto.setOrder("sort_no_");
		List<Aos_ge_catalogPO> list = aos_ge_catalogMapper.list(qDto);
		List<Dto> treeNodes = new ArrayList<Dto>();
		String iconPath = System.getProperty(AOSCons.CXT_KEY) + AOSXmlParam.getValue("icon_path");
		for (Aos_ge_catalogPO aos_ge_catalogPO : list) {
			Dto treeNode = Dtos.newDto();
			AOSUtils.apply(aos_ge_catalogPO, treeNode);
			treeNode.put("id", aos_ge_catalogPO.getId_());
			treeNode.put("text", aos_ge_catalogPO.getName_());
			String icon_name_ = aos_ge_catalogPO.getIcon_name_();
			if (AOSUtils.isNotEmpty(icon_name_)) {
				treeNode.put("icon", iconPath + icon_name_);
			}
			String az02a6 = aos_ge_catalogPO.getIs_leaf_();
			if (AOSCons.YES.equals(az02a6)) {
				treeNode.put("leaf", true);
			} else {
				treeNode.put("leaf", false);
			}
			String is_auto_expand_ = aos_ge_catalogPO.getIs_auto_expand_();
			if (AOSCons.YES.equals(is_auto_expand_)) {
				treeNode.put("expanded", true);
			} else {
				treeNode.put("expanded", false);
			}
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

	/**
	 * 保存分类科目信息
	 * 
	 * @param qDto
	 */
	public Dto saveCatalog(Dto qDto) {
		Dto outDto = Dtos.newDto();
		outDto.put("flag", qDto.getString("flag"));
		Aos_ge_catalogPO aos_ge_catalogPO = new Aos_ge_catalogPO();
		AOSUtils.apply(qDto, aos_ge_catalogPO);
		// 新增
		aos_ge_catalogPO.setId_(AOSId.id(IdCons.GID));
		aos_ge_catalogPO.setIs_leaf_(AOSCons.YES);
		if (qDto.getString("flag").equals("1")) {
			// 新增科目
			aos_ge_catalogPO.setName_(aos_ge_catalogPO.getRoot_name_());
			aos_ge_catalogPO.setParent_id_("0");
			Dto countDto = Dtos.newDto();
			countDto.put("root_key_", aos_ge_catalogPO.getRoot_key_());
			int rows = aos_ge_catalogMapper.rows(countDto);
			if (rows > 0) {
				outDto.setAppMsg("科目标识键已被占用，请修改后再保存。");
				outDto.setAppCode(-1);
				return outDto;
			}
		} else {
			// 新增分类
		}
		//生成语义ID
		Dto calcDto = Dtos.newCalcDto("MAX(cascade_id_)");
		calcDto.put("parent_id_", aos_ge_catalogPO.getParent_id_());
		String maxAos_ge_catalog_b0 = aos_ge_catalogMapper.calc(calcDto);
		if (AOSUtils.isEmpty(maxAos_ge_catalog_b0)) {
			Aos_ge_catalogPO aos_ge_catalogPO2 = aos_ge_catalogMapper.selectByKey(aos_ge_catalogPO.getParent_id_());
			maxAos_ge_catalog_b0 = aos_ge_catalogPO2.getCascade_id_() + ".000";
		}
		String cascade_id_ = AOSId.treeId(maxAos_ge_catalog_b0, 999);
		aos_ge_catalogPO.setCascade_id_(cascade_id_);
		aos_ge_catalogMapper.insert(aos_ge_catalogPO);
		// 将其父节点更新为非叶子节点
		Aos_ge_catalogPO updatePO = new Aos_ge_catalogPO();
		updatePO.setId_(aos_ge_catalogPO.getParent_id_());
		updatePO.setIs_leaf_(AOSCons.NO);
		aos_ge_catalogMapper.updateByKey(updatePO);
		outDto.setAppMsg("操作完成，数据新增成功。");
		return outDto;
	}

	/**
	 * 修改分类数据
	 * 
	 * @param qDto
	 */
	public void updateCatalog(Dto qDto) {
		Aos_ge_catalogPO aos_ge_catalogPO = new Aos_ge_catalogPO();
		AOSUtils.apply(qDto, aos_ge_catalogPO);
		aos_ge_catalogMapper.updateByKey(aos_ge_catalogPO);
	}

	/**
	 * 删除分类数据
	 * 
	 * @param qDto
	 */
	public Dto deleteCatalog(Dto qDto) {
		Dto outDto = Dtos.newDto();
		Aos_ge_catalogPO aos_ge_catalogPO = new Aos_ge_catalogPO();
		AOSUtils.apply(qDto, aos_ge_catalogPO);
		//删除本节点
		aos_ge_catalogMapper.deleteByKey(aos_ge_catalogPO.getId_());
		Dto countDto = Dtos.newDto();
		countDto.put("parent_id_", aos_ge_catalogPO.getParent_id_());
		// 检测删除节点的父节点是否还有子节点，如果没有则将其更新为叶子节点
		int rows = aos_ge_catalogMapper.rows(countDto);
		if (rows == 0) {
			Aos_ge_catalogPO updatePO = new Aos_ge_catalogPO();
			updatePO.setId_(aos_ge_catalogPO.getParent_id_());
			updatePO.setIs_leaf_(AOSCons.YES);
			aos_ge_catalogMapper.updateByKey(updatePO);
			//此种情况前端要刷新删除节点的父节点的父节点
			outDto.setAppCode(1);
		}
		return outDto;
	}
}
