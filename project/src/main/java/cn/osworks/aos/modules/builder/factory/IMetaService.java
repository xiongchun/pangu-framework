package cn.osworks.aos.modules.builder.factory;

import java.util.List;

import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;
import cn.osworks.aos.modules.builder.dao.vo.TableVO;


/**
 * <b>元数据服务接口</b>
 * 
 * @author OSWorks-XC
 * @date 2013-06-06
 */
public interface IMetaService {

	/**
	 * 列出数据表集合
	 * 
	 * @return
	 */
	List<TableVO> listTables(Dto qDto);

	/**
	 * 查询数据表
	 * 
	 * @return
	 */
	TableVO selectTable(Dto qDto);

	/**
	 * 查询数据表注释
	 * 
	 * @return
	 */
	String selectTableComment(String tablename);

	/**
	 * 列出数据表字段集合
	 * 
	 * @return
	 */
	List<ColumnVO> listColumns(Dto qDto);

}
