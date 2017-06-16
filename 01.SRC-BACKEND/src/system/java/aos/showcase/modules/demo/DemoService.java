package aos.showcase.modules.demo;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

import aos.demo.dao.DemoAccountDao;
import aos.demo.dao.po.DemoAccountPO;
import aos.framework.core.dao.SqlDao;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.po.AosParamsPO;
import aos.framework.taglib.core.model.TreeBuilder;
import aos.framework.taglib.core.model.TreeNode;
import aos.framework.web.router.HttpModel;
import aos.system.common.id.IdService;
import aos.system.common.utils.SystemCons;
import aos.system.dao.AosModuleDao;
import aos.system.dao.AosOrgDao;
import aos.system.dao.po.AosModulePO;
import aos.system.dao.po.AosOrgPO;

/**
 * 范例：综合实例
 * 
 * @author xiongchun
 *
 */
@Service
public class DemoService {

	@Autowired
	private DemoAccountDao demoAccountDao;
	@Autowired
	private AosOrgDao aosOrgDao;
	@Autowired
	private AosModuleDao aosModuleDao;
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private IdService idService;
	
	private static Logger logger = LoggerFactory.getLogger(DemoService.class);

	/**
	 * 查询账户信息列表
	 * 
	 * @param httpModel
	 */
	public void listAccounts(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<DemoAccountPO> accountPOs = demoAccountDao.listPage(inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(accountPOs, inDto.getPageTotal()));
	}

	/**
	 * 查询账户信息
	 * 
	 * @param httpModel
	 */
	public void getAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		DemoAccountPO demo_accountPo = demoAccountDao.selectByKey(inDto.getInteger("id"));
		httpModel.setOutMsg(AOSJson.toJson(demo_accountPo));
	}

	/**
	 * 新增账户信息
	 * 
	 * @param httpModel
	 */
	public void saveAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		DemoAccountPO demo_accountPO = new DemoAccountPO();
		// 如果主键字段是自增列，则不需要预先对主键ID赋值。
		//演示模块为了兼容各种数据库处理的便利性，使用了非自增列。业务系统的主键策略，请根据自己的实际情况而定。
		demo_accountPO.setId(idService.nextValue("seq_demo").intValue());
		demo_accountPO.copyProperties(inDto);
		demo_accountPO.setOrg_id("000");
		demo_accountPO.setCreate_time(AOSUtils.getDateTime());
		demo_accountPO.setCreate_user_id("1");
		demoAccountDao.insert(demo_accountPO);
		// 不管是自增列主键还是非自增列的主键，都可以通过下面的语句获取到主键值
		// demo_accountPO.getId();
		httpModel.setOutMsg("账户信息新增成功");
	}

	/**
	 * 修改账户信息
	 * 
	 * @param httpModel
	 */
	public void updateAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		DemoAccountPO demo_accountPO = new DemoAccountPO();
		demo_accountPO.copyProperties(inDto);
		demoAccountDao.updateByKey(demo_accountPO);
		httpModel.setOutMsg("账户信息修改成功");
	}
	
	/**
	 * 测试事务传播行为
	 * 
	 * @param httpModel
	 */
	@Transactional
	@SuppressWarnings("unused")
	public void transactionDemo1(HttpModel httpModel) {
		DemoAccountPO demo_accountPO = new DemoAccountPO();
		demo_accountPO.setId(10000);
		demo_accountPO.setName("测试100");
		demoAccountDao.updateByKey(demo_accountPO);
		//同一个service方法内部的方法调用，要想被调用的方法按照预期传播行为就需要按照切面代理方式调用。
		//跨Service的事务方法调用则可以直接调用
		 ((DemoService)AOSCxt.getBean("demoService")).transactionDemo1_1();
		int i = 3 /0 ;
		httpModel.setOutMsg("账户信息修改成功");
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void transactionDemo1_1() {
		DemoAccountPO demo_accountPO = new DemoAccountPO();
		demo_accountPO.setId(10006);
		demo_accountPO.setName("测试200");
		demoAccountDao.updateByKey(demo_accountPO);
	}

	/**
	 * 删除账户信息
	 * 
	 * @param httpModel
	 */
	public void delAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		demoAccountDao.deleteByKey(inDto.getInteger("id"));
		httpModel.setOutMsg("账户信息删除成功");
	}

	/**
	 * 批量删除
	 * 
	 * @param httpModel
	 */
	@Transactional
	public void delAccountInfos(HttpModel httpModel) {
		String[] selectionIds = httpModel.getInDto().getRows();
		for (String id : selectionIds) {
			demoAccountDao.deleteByKey(Integer.valueOf(id));
		}
		httpModel.setOutMsg("批量删除账户数据成功。");
	}

	/**
	 * 查询账户信息列表
	 * 
	 * @param httpModel
	 */
	public void listOrgs(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<AosOrgPO> orgPOs = aosOrgDao.listPage(inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(orgPOs, inDto.getPageTotal()));
	}

	/**
	 * 查询参数信息列表
	 * 
	 * @param httpModel
	 */
	public void listParams(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<AosParamsPO> paramPOs = sqlDao.list("Demo.listParamsPage", inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(paramPOs, inDto.getPageTotal()));
	}

	/**
	 * 导出电子表格
	 * 
	 * excel导出的几个注意点 1、查询条件建议在执行表格查询时候将查询条件缓存到Redis(根据模块标识)；
	 * 2、导出数量需要控制，不能太大。建议10000以内。
	 * 3、其实如果条件允许，导出功能需要考虑和业务系统分离设计的(由业务系统发起导出任务，由专门的导出服务器完成导出到服务器磁盘并返回路径给业务系统。
	 * 由业务系统操作员去主动下载)。 导出功能容易给业务系统带来很大的不稳定因素(数据量大和并发时容易占用很大内存和CPU瞬间高峰)。
	 * 
	 * @param httpModel
	 */
	public void exportExcel(HttpModel httpModel) {
		// 这里只是演示获取httpmodel获取response对象，具体的表格生成请自行使用poi生成电子表格
		HttpServletResponse response = httpModel.getResponse();
		String filename = AOSUtils.encodeChineseDownloadFileName(httpModel.getRequest().getHeader("USER-AGENT"),
				"文件名称.css");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
		String path = httpModel.getRequest().getServletContext().getRealPath("/");
		File file = new File(path + "/static/css/aos-all.css");
		BufferedInputStream in;
		ServletOutputStream os = null;
		try {
			in = new BufferedInputStream(new FileInputStream(file));
			ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
			byte[] temp = new byte[1024];
			int size = 0;
			while ((size = in.read(temp)) != -1) {
				out.write(temp, 0, size);
			}
			in.close();
			os = response.getOutputStream();
			os.write(out.toByteArray());
			os.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 获取树组件数据(一次性全部加载树节点)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getTreeData(HttpModel httpModel) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		List<AosModulePO> aosModulePOs = aosModuleDao.list(null);
		for (AosModulePO aosModulePO : aosModulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aosModulePO.getId().toString());
			treeNode.setText(aosModulePO.getName());
			treeNode.setParentId(aosModulePO.getParent_id().toString());
			treeNode.setIcon(aosModulePO.getIcon_name());
			//这个决定是否在节点上初选复选框，true为初始选中
			//treeNode.setChecked(true);
			treeNode.setLeaf(StringUtils.equals(aosModulePO.getIs_leaf(), SystemCons.IS.YES) ? true : false );
			treeNode.setExpanded(StringUtils.equals(aosModulePO.getIs_auto_expand(), SystemCons.IS.YES) ? true : false );
			//附加属性
			treeNode.setA(aosModulePO.getUrl());
			treeNodes.add(treeNode);
		}
		String jsonString = TreeBuilder.build(treeNodes);
		httpModel.setOutMsg(jsonString);
	}
	
	/**
	 * 获取树组件数据(一次性全部加载树节点)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getCheckboxTreeData(HttpModel httpModel) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		List<AosModulePO> aosModulePOs = aosModuleDao.list(null);
		for (AosModulePO aosModulePO : aosModulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aosModulePO.getId().toString());
			treeNode.setText(aosModulePO.getName());
			treeNode.setParentId(aosModulePO.getParent_id().toString());
			treeNode.setIcon(aosModulePO.getIcon_name());
			//这个决定是否在节点上初选复选框，true为初始选中
			treeNode.setChecked(false);
			treeNode.setLeaf(StringUtils.equals(aosModulePO.getIs_leaf(), SystemCons.IS.YES) ? true : false );
			treeNode.setExpanded(StringUtils.equals(aosModulePO.getIs_auto_expand(), SystemCons.IS.YES) ? true : false );
			//附加属性
			treeNode.setA(aosModulePO.getUrl());
			treeNodes.add(treeNode);
		}
		String jsonString = TreeBuilder.build(treeNodes);
		httpModel.setOutMsg(jsonString);
	}
	
	/**
	 * 获取按需加载树
	 * 
	 * @param httpModel
	 * @return
	 */
	public void getAsyncTreeData(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		inDto.setOrder("sort_no");
		List<AosModulePO> aosModulePOs = aosModuleDao.list(inDto);
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (AosModulePO aosModulePO : aosModulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aosModulePO.getId().toString());
			treeNode.setText(aosModulePO.getName());
			String icon_ = aosModulePO.getIcon_name();
			if (AOSUtils.isNotEmpty(icon_)) {
				treeNode.setIcon(icon_);
			}
			String is_leaf_ = aosModulePO.getIs_leaf();
			treeNode.setLeaf(AOSCons.YES.equals(is_leaf_) ? true : false);
			//String is_auto_expand_ = aosModulePO.getIs_auto_expand();
			//treeNode.setExpanded(AOSCons.YES.equals(is_auto_expand_) ? true : false);
			treeNode.setExpanded(false);
			treeNode.setA(aosModulePO.getCascade_id());
			treeNodes.add(treeNode);
		}
		httpModel.setOutMsg(AOSJson.toJson(treeNodes));
	}
	
	/**
	 * 查询自定义下拉组件数据
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listComboBoxData(HttpModel httpModel) {
		List<Dto> list = sqlDao.list("Demo.listComboBoxData", null);
		httpModel.setOutMsg(AOSJson.toJson(list));
	}
	
	/**
	 * 查询多级联动下拉框数据(第一级)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listComboBoxCascadeData(HttpModel httpModel) {
		List<Dto> list = sqlDao.list("Demo.listComboBoxCascadeData", httpModel.getInDto());
		httpModel.setOutMsg(AOSJson.toJson(list));
	}
	
	/**
	 * 查询多级联动下拉框数据(第二级)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listComboBoxCascadeSubData(HttpModel httpModel) {
		List<Dto> list = sqlDao.list("Demo.listComboBoxCascadeSubData", httpModel.getInDto());
		httpModel.setOutMsg(AOSJson.toJson(list));
	}
	
	/**
	 * 表单数据加载
	 * 
	 * @param httpModel
	 * @return
	 */
	public void loadFormInfo(HttpModel httpModel) {
		Dto dto = Dtos.newDto();
		dto.put("name", "凤姐");
		dto.put("age", 18);
		dto.put("sex", "1");
		dto.put("birthday", AOSUtils.getDateStr()); //日期类型必须是yyyy-mm-dd格式的日期字符串
		String[] c1={"1","2","3"}; //也可以是List
		dto.put("c1", c1);
		dto.put("r1", "2");
		dto.put("home", "华盛顿白宫8号院");
		dto.put("operateTime", AOSUtils.getDateTime());
		httpModel.setOutMsg(AOSJson.toJson(dto));
	}
	
	/**
	 * 表单数据提交(异步Aiax)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void submitSync(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		logger.info("接收到提交的数据：{}", inDto);
		httpModel.setOutMsg("接收数据成功，请查看控制台。");
		//如果要给前端返回一些数据，可以返回JSON
		//httpModel.setOutMsg(AOSJson.toJson(dto));
	}
	
	/**
	 * 表单数据提交(异步Aiax)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void submitAsync(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		logger.info("接收到提交的数据：{}", inDto);
		httpModel.setAttribute("data", AOSJson.toJson(inDto));
		httpModel.setViewPath("showcase/basic/formSubmitAsync.jsp");	
	}
	
	/**
	 * 行编辑表格提交的数据，一次只会提交一条记录
	 * @param httpModel
	 */
	public void saveEditGrid(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		AOSUtils.debug("====表格编辑行数据[新增的或修改的]====");
		inDto.println();
		httpModel.setOutMsg("接收数据成功，请查看控制台。");
	}
	
	/**
	 * 单元格编辑表格提交的数据，一次有可能会提交多条记录
	 * @param httpModel
	 */
	public void saveCellEditGrid(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<Dto> modifies = inDto.getRows();
		//根据是否有id_值来区分是新增还是修改
		AOSUtils.debug("====表格编辑数据[含新增的和修改的]====");
		for (Dto dto : modifies) {
			dto.println();
		}
		httpModel.setOutMsg("接收数据成功，请查看控制台。");
	}
	
	/**
	 * 返回统计汇总对象
	 * @param httpModel
	 */
	public void querySummary(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		//根据inDto参数去统计相关信息
		Dto outDto = sqlDao.selectDto("Demo.querySummary", inDto);
		httpModel.setOutMsg(AOSJson.toJson(outDto));
	}
	
	
	/**
	 * 范例1(简单查询)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc1(HttpModel httpModel) {
		httpModel.setAttribute("juid", httpModel.getInDto().getString("juid"));
		httpModel.setViewPath("showcase/misc/misc1.jsp");		
	}
	
	/**
	 * 范例2(增删改查)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc2(HttpModel httpModel) {
		httpModel.setViewPath("showcase/misc/misc2.jsp");
	}

	/**
	 * 范例3(常用布局一)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc3(HttpModel httpModel) {
		httpModel.setViewPath("showcase/misc/misc3.jsp");
	}

	/**
	 * 范例4(常用布局二)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc4(HttpModel httpModel) {
		httpModel.setViewPath("showcase/misc/misc4.jsp");
	}

	/**
	 * 范例5(常用布局三)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc5(HttpModel httpModel) {
		httpModel.setViewPath("showcase/misc/misc5.jsp");
	}
	
	/**
	 * 范例1(基本组件)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initBasic1(HttpModel httpModel) {
		httpModel.setAttribute("juid", httpModel.getInDto().getString("juid"));
		httpModel.setViewPath("showcase/basic/basic1.jsp");
	}
	
	/**
	 * 范例2(容器组件)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initBasic2(HttpModel httpModel) {
		httpModel.setViewPath("showcase/basic/basic2.jsp");
	}
	
	/**
	 * 开关按钮页
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initToggle(HttpModel httpModel) {
		httpModel.setViewPath("showcase/basic/toggle.jsp");
	}
	
	/**
	 * 初始化树组件
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initTree(HttpModel httpModel) {
		httpModel.setViewPath("showcase/basic/tree.jsp");
	}
	
	/**
	 * 初始化表单组件
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initForm(HttpModel httpModel) {
		httpModel.setAttribute("vercode_uuid", idService.uuid());
		httpModel.setAttribute("juid", httpModel.getInDto().getString("juid"));
		httpModel.setViewPath("showcase/basic/form.jsp");
	}
	
	/**
	 * 初始化表格组件
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initGrid(HttpModel httpModel) {
		httpModel.setViewPath("showcase/basic/grid.jsp");
	}
	
	/**
	 * 初始化表格组件
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initGrid2(HttpModel httpModel) {
		httpModel.setViewPath("showcase/basic/grid2.jsp");
	}
	
	/**
	 * 范例(常用布局四)
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initMisc6(HttpModel httpModel) {
		httpModel.setViewPath("showcase/misc/misc6.jsp");
	}
	
	/**
	 * 测试1
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initTest1(HttpModel httpModel) {
		httpModel.setViewPath("showcase/test/test1.jsp");
	}
	
	/**
	 * 测试2
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initTest2(HttpModel httpModel) {
		httpModel.setViewPath("showcase/test/test2.jsp");
	}
	
	/**
	 * 测试3
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initTest3(HttpModel httpModel) {
		httpModel.setViewPath("showcase/test/test3.jsp");
	}

}
