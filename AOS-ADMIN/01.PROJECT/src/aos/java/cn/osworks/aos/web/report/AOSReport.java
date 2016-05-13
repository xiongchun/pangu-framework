package cn.osworks.aos.web.report;

import java.io.File;
import java.util.List;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;

/**
 * 报表处理类
 * 
 * @author OSWorks-XC
 */
public class AOSReport {
	
	//缺省的AOSPrint对象在会话中的标识
	public static final String DEFAULT_AOSPRINT_KEY = "DEFAULT_AOSPRINT_KEY";
	
	/**
	 * 填充报表数据，生成报表打印对象
	 * @param reportModel
	 * @return
	 */
	public static AOSPrint fillReport(AOSReportModel reportModel){
		AOSPrint aosPrint = new AOSPrint();
		JasperPrint jasperPrint = null;
		Dto paramsDto = reportModel.getParametersDto();
		List<?> fieldsList = reportModel.getFieldsList();
		String jasperFile = reportModel.getJasperFile();
		if (AOSUtils.isNotEmpty(jasperFile)) {
			if (!new File(jasperFile).exists()){
				throw new AOSException(8, jasperFile);
			}
			try {
				//JasperReport jasperReport = (JasperReport)JRLoader.loadObjectFromFile(jasperFile);
				if (AOSUtils.isEmpty(fieldsList)) {
					jasperPrint = JasperFillManager.fillReport(jasperFile, paramsDto, new JREmptyDataSource());
				}else {
					jasperPrint = JasperFillManager.fillReport(jasperFile, paramsDto, new JRBeanCollectionDataSource(fieldsList));
				}
			} catch (JRException e) {
				e.printStackTrace();
			}
		}
		aosPrint.setJasperPrint(jasperPrint);
		return aosPrint;
	}
	
}
