package org.g4studio.demo.online.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.common.web.BaseAction;
import org.g4studio.common.web.BaseActionForm;
import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.web.report.fcf.Categorie;
import org.g4studio.core.web.report.fcf.CategoriesConfig;
import org.g4studio.core.web.report.fcf.DataSet;
import org.g4studio.core.web.report.fcf.FcfDataMapper;
import org.g4studio.core.web.report.fcf.GraphConfig;
import org.g4studio.core.web.report.fcf.Set;

/**
 * FlashReport标准范例暨教程Action
 * 
 * @author OSWorks-XC
 * @since 2010-10-13
 * @see BaseAction
 */
public class FlashReportAction extends BaseAction {
	/**
	 * FCF 2D柱状图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcf2DColumnInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表 (产品一)");
		//X坐标轴名称
		graphConfig.setXAxisName("月度");
		//数字值前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("2dColumnView");
	}
	
	/**
	 * FCF 3D柱状图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcf3DColumnInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("3dColumnView");
	}
	
	/**
	 * FCF 折线图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfLineInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		//设置水平分割线的颜色
		graphConfig.put("divLineColor", "008ED6");
		//设置水平分割线的透明度
		graphConfig.put("divLineAlpha", "20");
		//设置对水平分割区域使用斑马纹
		graphConfig.put("showAlternateHGridColor", "1");
		//设置斑马纹颜色
		graphConfig.put("AlternateHGridColor", "BFFFFF");
		//设置斑马纹的透明度
		graphConfig.put("alternateHGridAlpha", "20");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("lineView");
	}
	
	/**
	 * FCF 2D饼图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcf2DPieInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		graphConfig.setShowNames(new Boolean(true));
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			set.setIsSliced(dto.getAsString("issliced"));//浮动
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("2dPieView");
	}
	
	/**
	 * FCF 3D饼图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcf3DPieInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("3dPieView");
	}
	
	/**
	 * FCF 面积图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfAreaInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//graphConfig.setShowValues(true);
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		//设置水平分割线的颜色
		graphConfig.put("divLineColor", "008ED6");
		//设置水平分割线的透明度
		graphConfig.put("divLineAlpha", "10");
		//设置对水平分割区域使用斑马纹
		graphConfig.put("showAlternateHGridColor", "1");
		//设置斑马纹颜色
		graphConfig.put("AlternateHGridColor", "BFFFFF");
		//设置斑马纹的透明度
		graphConfig.put("alternateHGridAlpha", "10");
		//graphConfig.put("areaAlpha", "60");
		//graphConfig.put("areaBorderColor", "441570");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			//set.setColor(dto.getAsString("color")); 
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("areaView");
	}
	
	/**
	 * FCF 环状图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfCircularityInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		graphConfig.setShowNames(new Boolean(true));
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); 
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("circularityView");
	}
	

	/**
	 * 2D柱形组合图初始化
	 * 综合图和前面的单一图使用的元数据格式是不一样的,请大家注意它们的区别
	 * @param
	 * @return
	 */
	public ActionForward fcf2DColumnMsInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4Group(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("2dColumnMsView");
	}
	
	/**
	 * 3D柱形组合图初始化
	 * 综合图和前面的单一图使用的元数据格式是不一样的,请大家注意它们的区别
	 * @param
	 * @return
	 */
	public ActionForward fcf3DColumnMsInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4Group(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("3dColumnMsView");
	}
	
	/**
	 * 面积组合图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfAreaMsInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		cateList.add(new Categorie("七月"));
		cateList.add(new Categorie("八月"));
		cateList.add(new Categorie("九月"));
		cateList.add(new Categorie("十月"));
		cateList.add(new Categorie("十一月"));
		cateList.add(new Categorie("十二月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4AreaGroup(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("areaMsView");
	}
	
	/**
	 * 折线组合图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfLineMsInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		cateList.add(new Categorie("七月"));
		cateList.add(new Categorie("八月"));
		cateList.add(new Categorie("九月"));
		cateList.add(new Categorie("十月"));
		cateList.add(new Categorie("十一月"));
		cateList.add(new Categorie("十二月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4LineGroup(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("lineMsView");
	}
	
	/**
	 * 折线组合图初始化(双Y轴)
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfLineMs2YInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		//graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		//主Y轴坐标名
		graphConfig.put("PYAxisName", "Product A"); //不支持中文
		//次Y轴坐标名
		graphConfig.put("SYAxisName", "Product B"); //不支持中文
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		graphConfig.setShowValues(new Boolean(false));
		//是否格式化数字,默认为1(True),自动的给你的数字加上K（千）或M（百万）；若取0,则不加K或M
		graphConfig.put("formatNumberScale ", "0");
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		cateList.add(new Categorie("七月"));
		cateList.add(new Categorie("八月"));
		cateList.add(new Categorie("九月"));
		cateList.add(new Categorie("十月"));
		cateList.add(new Categorie("十一月"));
		cateList.add(new Categorie("十二月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4LineGroup42Y(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		System.out.println(xmlString);
		return mapping.findForward("lineMs2YView");
	}
	
	/**
	 * 3D交叉图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcf3DLineColumnInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		cateList.add(new Categorie("七月"));
		cateList.add(new Categorie("八月"));
		cateList.add(new Categorie("九月"));
		cateList.add(new Categorie("十月"));
		cateList.add(new Categorie("十一月"));
		cateList.add(new Categorie("十二月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4JCT(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("3dLineColumnView");
	}
	
	/**
	 * FCF 交互图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcfAdvancedInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		graphConfig.setSubcaption("点击柱子看看交互效果");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "2");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			set.setJsFunction("fnMyJs(\"xiongchun\")"); //调用的JS函数
			//set.setLink("这里可以是一个下钻的url链接");
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("3dColumnView");
	}
	
	/**
	 * 获取FlashReport元数据 (交叉图)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4JCT(Dto pDto){
		pDto.put("fcfid", "12");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("产品A");
		dataSet1.setColor("FDC12E");
		dataSet1.setShowValues(new Boolean(false));
		pDto.put("product", "1");
		List alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);;
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("产品B");
		dataSet2.setColor("44BC2F");
		dataSet2.setShowValues(new Boolean(false));
		pDto.put("product", "2");
		List blist = blist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		
		DataSet dataSet3 = new DataSet();
		dataSet3.setSeriesname("合计");
		dataSet3.setColor("3CBBD7");
		dataSet3.setShowValues(new Boolean(false));
		dataSet3.setParentYAxis(G4Constants.REPORT2Y_SECOND);
		List sumlist = g4Reader.queryForList("Demo.getFcfSumDataList", pDto);
		List sumSetList = new ArrayList();
		for (int i = 0; i < sumlist.size(); i++) {
			Dto dto = (BaseDto)sumlist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			sumSetList.add(set);
		}
		dataSet3.setData(sumSetList);
		dataList.add(dataSet3);
		return dataList;
	}
	
	/**
	 * 获取FlashReport元数据 (折线组合图)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4LineGroup(Dto pDto){
		pDto.put("fcfid", "12");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("产品A");
		dataSet1.setColor("FDC12E");
		pDto.put("product", "1");
		List alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);;
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("产品B");
		dataSet2.setColor("44BC2F");
		pDto.put("product", "2");
		List blist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		return dataList;
	}
	
	/**
	 * 获取FlashReport元数据 (折线组合图)(双Y轴)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4LineGroup42Y(Dto pDto){
		pDto.put("fcfid", "12");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("产品A");
		dataSet1.setColor("FDC12E");
		dataSet1.setParentYAxis(G4Constants.REPORT2Y_FIRST);
		dataSet1.setRenderAs("Line");
		pDto.put("product", "1");
		List alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("产品B");
		dataSet2.setColor("44BC2F");
		dataSet2.setParentYAxis(G4Constants.REPORT2Y_SECOND);
		pDto.put("product", "2");
		List blist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		return dataList;
	}
	
	/**
	 * 获取FlashReport元数据 (面积组合图)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4AreaGroup(Dto pDto){
		pDto.put("fcfid", "12");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("产品A");
		dataSet1.setColor("FDC12E");
		dataSet1.setAreaBorderColor("FDC12E");
		dataSet1.setAreaBorderThickness("1");
		dataSet1.setAreaAlpha("70");
		pDto.put("product", "1");
		List alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("产品B");
		dataSet2.setColor("56B9F9");
		dataSet2.setAreaBorderColor("56B9F9");
		dataSet2.setAreaBorderThickness("2");
		dataSet2.setAreaAlpha("50");
		pDto.put("product", "2");
		List blist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		return dataList;
	}
	
	/**
	 * 获取FlashReport元数据 (柱状组合图)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4Group(Dto pDto){
		pDto.put("fcfid", "6");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("产品A");
		dataSet1.setColor("FDC12E");
		pDto.put("product", "1");
		List alist = alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("产品B");
		dataSet2.setColor("56B9F9");
		pDto.put("product", "2");
		List blist  = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		return dataList;
	}
	
	/**
	 * FCF 2D栏位图初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fcf2DBarInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//X坐标轴名称
		graphConfig.setXAxisName("月度");
		//数字值前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("2dBarView");
	}
	
	/**
	 * 2D栏位组合图初始化
	 * 组合图和前面的单一图使用的元数据格式是不一样的,请大家注意它们的区别
	 * @param
	 * @return
	 */
	public ActionForward fcf2DBarMsInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表");
		//设置数字值的前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		graphConfig.setCanvasBorderThickness(new Boolean(true));
		//实例化组合种类配置对象
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		cateList.add(new Categorie("一月"));
		cateList.add(new Categorie("二月"));
		cateList.add(new Categorie("三月"));
		cateList.add(new Categorie("四月"));
		cateList.add(new Categorie("五月"));
		cateList.add(new Categorie("六月"));
		categoriesConfig.setCategories(cateList);
		List list = getFcfDataList4Group(new BaseDto());
		String xmlString = FcfDataMapper.toFcfXmlData(list, graphConfig, categoriesConfig);
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("2dBarMsView");
	}
	
	/**
	 * FlashReport报表综合图示一
	 * 
	 * @param
	 * @return
	 */
	public ActionForward integrateFlashReport1Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表(产品一)");
		//X坐标轴名称
		graphConfig.setXAxisName("月度");
		//数字值前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		List list = g4Reader.queryForList("Demo.getFcfDataList", qDto);
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto.getAsString("name")); //名称
			set.setValue(dto.getAsString("value")); //数据值
			set.setColor(dto.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("integrateFlashReport1View");
	}
	
	/**
	 * FlashReport报表综合图示二
	 * 
	 * @param
	 * @return
	 */
	public ActionForward integrateFlashReport2Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("integrateFlashReport2View");
	}
	
	/**
	 * 查询表格数据
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryXsyjDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List list = g4Reader.queryForPage("Demo.getFcfDataList", dto);
		String jsonString = JsonHelper.encodeList2PageJson(list, new Integer(12), G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询数据报表XML格式串
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryReportXmlDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BaseActionForm aForm = (BaseActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String product = "(产品一)";
		if (dto.getAsString("product").equals("2")) {
			product = "(产品二)";
		}
		List list = g4Reader.queryForList("Demo.getFcfDataList", dto);
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("Google软件2010年月度销售业绩图表" + product);
		//X坐标轴名称
		graphConfig.setXAxisName("月度");
		//数字值前缀
		graphConfig.setNumberPrefix("$");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto1 = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto1.getAsString("name")); //名称
			set.setValue(dto1.getAsString("value")); //数据值
			set.setColor(dto1.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("xmlstring", xmlString);
		write(JsonHelper.encodeObject2Json(outDto), response);
		return mapping.findForward(null);
	}
	
	/**
	 * FlashReport动态却换图表种类
	 * 
	 * @param
	 * @return
	 */
	public ActionForward integrateFlashReport3Init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("integrateFlashReport3View");
	}
}
