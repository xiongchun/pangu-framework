package cn.osworks.aos.web.report;

import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

/**
 * 报表打印对象
 * 
 * @author OSWorks-XC
 */
public class AOSPrint {
	
	/**
	 * 原始打印对象
	 */
	private JasperPrint jasperPrint;
	
    /**
     * 文件下载或另存为时的缺省文件名
     */
	private String fileName;
	
	/**
	 * 导出XLS时的配置对象
	 */
	private SimpleXlsReportConfiguration xlsConfiguration;
	
	/**
	 * 导出XLSX时的配置对象
	 */
	private SimpleXlsxReportConfiguration xlsxConfiguration;

	public JasperPrint getJasperPrint() {
		return jasperPrint;
	}

	public void setJasperPrint(JasperPrint jasperPrint) {
		this.jasperPrint = jasperPrint;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public SimpleXlsReportConfiguration getXlsConfiguration() {
		return xlsConfiguration;
	}

	public void setXlsConfiguration(SimpleXlsReportConfiguration xlsConfiguration) {
		this.xlsConfiguration = xlsConfiguration;
	}

	public SimpleXlsxReportConfiguration getXlsxConfiguration() {
		return xlsxConfiguration;
	}

	public void setXlsxConfiguration(SimpleXlsxReportConfiguration xlsxConfiguration) {
		this.xlsxConfiguration = xlsxConfiguration;
	}
	
}
