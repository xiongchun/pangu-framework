package cn.osworks.aos.modules.builder.factory.dialect;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.base.asset.AOSUtils;
import cn.osworks.aos.base.typewrap.Dto;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.builder.dao.vo.ColumnVO;
import cn.osworks.aos.modules.builder.dao.vo.TableVO;
import cn.osworks.aos.modules.builder.factory.IMetaService;
import cn.osworks.aos.modules.builder.misc.BuilderUtils;


/**
 * <b>Postgresql代码生成服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-18
 */
@Service
public class PostgresqlService implements IMetaService {

	@Autowired
	private SqlDao sqlDao;

	/**
	 * 列出数据表集合
	 * 
	 * @return
	 */
	@Override
	public List<TableVO> listTables(Dto qDto) {
		List<TableVO> list = sqlDao.list("Postgresql.listTables", qDto);
		for (TableVO tableVO : list) {
			String comment = (String) sqlDao.selectOne("Postgresql.selectTableComment", tableVO.getName());
			tableVO.setComment(comment);
		}
		return list;
	}

	/**
	 * 查询数据表
	 * 
	 * @return
	 */
	@Override
	public TableVO selectTable(Dto qDto) {
		TableVO tableVO = (TableVO) sqlDao.selectOne("Postgresql.selectTable", qDto);
		String comment = selectTableComment(tableVO.getName());
		tableVO.setComment(comment);
		return tableVO;
	}

	/**
	 * 查询数据表注释
	 * 
	 * @return
	 */
	@Override
	public String selectTableComment(String tablename) {
		String comment = (String) sqlDao.selectOne("Postgresql.selectTableComment", tablename);
		return comment;
	}

	/**
	 * 列出数据表字段集合
	 * 
	 * @return
	 */
	@Override
	public List<ColumnVO> listColumns(Dto qDto) {
		List<ColumnVO> list = sqlDao.list("Postgresql.listColumnsPage", qDto);
		for (ColumnVO columnVO : list) {
			if (!"varchar".equalsIgnoreCase(columnVO.getType())) {
				// 只能找到获取varchar类型字段的长度的方法，其余字段忽略
				columnVO.setLength(-1);
			}
			String comment = (String) sqlDao.selectOne("Postgresql.selectColumnComment", columnVO.toDto());
			columnVO.setComment(comment);
			// 标识该字段是否为主键
			Dto pkeyDto = sqlDao.selectDto("Postgresql.selectPkey", columnVO.toDto());
			if (AOSUtils.isEmpty(pkeyDto)) {
				columnVO.setIsPkey(false);
			} else {
				columnVO.setIsPkey(true);
			}
			// 生成首字母大写的字段名
			columnVO.setUpname(StringUtils.capitalize(columnVO.getName()));
			// dbype转换为对应的JavaType PO变量类型使用
			columnVO.setJavatype(BuilderUtils.toJavaType(columnVO.getType()));
			// dbype转换为对应的JavaType Mapper Xml文件使用
			columnVO.setJdbctype(BuilderUtils.toJdbcType(columnVO.getType()));
		}
		return list;
	}

}
