package org.g4studio.demo.online.service;

import java.sql.SQLException;

import org.g4studio.common.service.BaseService;
import org.g4studio.core.metatype.Dto;

/**
 * 系统演示接口
 * 
 * @author OSWorks-XC
 * @since 2010-02-13
 */
public interface DemoService extends BaseService {

	/**
	 * 插入一条收费项目
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSfxmDomain(Dto pDto);
	
	/**
	 * 插入一批收费项目(JDBC批处理演示)
	 * @param pDto
	 * @return
	 * @throws SQLException 
	 */
	public Dto batchSaveSfxmDomains(Dto pDto);

	/**
	 * 修改一条收费项目
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateSfxmDomain(Dto pDto);

	/**
	 * 删除一条收费项目
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteSfxm(Dto pDto);

	/**
	 * 调用存储过程演示
	 * 
	 * @return
	 */
	public Dto callPrc(Dto inDto);

	/**
	 * 演示声明式事务配置
	 */
	public Dto doTransactionTest();

	/**
	 * 异常处理
	 */
	public Dto doError();

	/**
	 * 保存文件上传数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto doUpload(Dto pDto);

	/**
	 * 删除文件数据
	 * 
	 * @param pFileId
	 * @return
	 */
	public Dto delFile(String pFileId);
	
	/**
	 * sayHi
	 * 
	 * @param pDto
	 */
	public void sayHi(Dto pDto);

}
