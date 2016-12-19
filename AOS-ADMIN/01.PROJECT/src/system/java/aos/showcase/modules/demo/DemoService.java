package aos.showcase.modules.demo;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import aos.demo.dao.Demo_accountDao;
import aos.demo.dao.Demo_accountPO;
import aos.framework.core.id.AOSId;
import aos.framework.core.service.AOSBaseService;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.Aos_paramsPO;
import aos.framework.web.router.HttpModel;
import aos.system.dao.Aos_orgDao;
import aos.system.dao.Aos_orgPO;

/**
 * 范例：综合实例
 * 
 * @author xiongchun
 *
 */
@Service
public class DemoService extends AOSBaseService {

	@Autowired
	private Demo_accountDao demo_accountDao;
	@Autowired
	private Aos_orgDao aos_orgDao;

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
	 * 查询账户信息列表
	 * 
	 * @param httpModel
	 */
	public void listAccounts(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<Demo_accountPO> accountPOs = demo_accountDao.listPage(inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(accountPOs, inDto.getPageTotal()));
	}

	/**
	 * 查询账户信息
	 * 
	 * @param httpModel
	 */
	public void getAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Demo_accountPO demo_accountPo = demo_accountDao.selectByKey(inDto.getString("id_"));
		httpModel.setOutMsg(AOSJson.toJson(demo_accountPo));
	}

	/**
	 * 新增账户信息
	 * 
	 * @param httpModel
	 */
	public void saveAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Demo_accountPO demo_accountPO = new Demo_accountPO();
		// 如果表示自增列，则不需要预先对主键ID赋值
		demo_accountPO.setId_(String.valueOf(AOSId.nextVal("seq_demo")));
		demo_accountPO.copyProperties(inDto);
		demo_accountPO.setOrg_id_("000");
		demo_accountPO.setCreate_time_(AOSUtils.getDateTime());
		demo_accountPO.setCreate_user_id_("1");
		demo_accountDao.insert(demo_accountPO);
		// 不管是自增列主键还是非自增列的主键，都可以通过下面的语句获取到主键值
		// demo_accountPO.getId_();
		httpModel.setOutMsg("账户信息新增成功");
	}

	/**
	 * 修改账户信息
	 * 
	 * @param httpModel
	 */
	public void updateAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Demo_accountPO demo_accountPO = new Demo_accountPO();
		demo_accountPO.copyProperties(inDto);
		demo_accountDao.updateByKey(demo_accountPO);
		httpModel.setOutMsg("账户信息修改成功");
	}

	/**
	 * 删除账户信息
	 * 
	 * @param httpModel
	 */
	public void delAccountInfo(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		demo_accountDao.deleteByKey(inDto.getString("id_"));
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
		for (String id_ : selectionIds) {
			demo_accountDao.deleteByKey(id_);
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
		List<Aos_orgPO> orgPOs = aos_orgDao.listPage(inDto);
		httpModel.setOutMsg(AOSJson.toGridJson(orgPOs, inDto.getPageTotal()));
	}

	/**
	 * 查询参数信息列表
	 * 
	 * @param httpModel
	 */
	public void listParams(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		List<Aos_paramsPO> paramPOs = sqlDao.list("Demo.listParamsPage", inDto);
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

}
