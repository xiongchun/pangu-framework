package org.g4studio.common.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.g4studio.common.dao.Dao;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;
import org.g4studio.core.util.G4Utils;
import org.g4studio.system.common.util.idgenerator.IDHelper;

/**
 * SpringBean监控切面
 * 
 * @author OSWorks-XC
 * @since 2010-09-21
 */
public class SpringBeanAspect {

	private static Log log = LogFactory.getLog(SpringBeanAspect.class);

	/**
	 * SpringBean方法调用通知
	 * 
	 * @param pjp
	 * @return
	 * @throws Throwable
	 */
	public Object interceptCall(ProceedingJoinPoint pjp) throws Throwable {
		String clazzString = pjp.getTarget().getClass().getName();
		String methodName = pjp.getSignature().getName();
		String fullPath = clazzString + "." + methodName;
		int flag = clazzString.indexOf("$");
		if (flag < 0)
			log.info("开始业务处理[" + methodName + "];全路径[" + fullPath + "]");
		long time = System.currentTimeMillis();
		Object retVal = pjp.proceed();
		time = System.currentTimeMillis() - time;
		if (flag < 0)
			log.info("结束业务处理[" + methodName + "];耗时:" + time + "毫秒;全路径[" + fullPath + "]");
		return retVal;
	}

	/**
	 * SpringBean方法异常通知 synchronized:标记为同步方法主要是为处理开启切面监控时候造成死锁的问题.
	 * 
	 * @param jp
	 * @param ex
	 */
	public synchronized void interceptException(JoinPoint jp, Throwable ex) {
		PropertiesHelper g4PHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
		String exceptionMonitor = g4PHelper.getValue("exceptionMonitor");
		if (exceptionMonitor.equals("0")) {
			return;
		}
		String clazzString = jp.getTarget().getClass().getName();
		String methodName = jp.getSignature().getName();
		String fullPath = clazzString + "." + methodName;
		int flag = clazzString.indexOf("$");
		if (flag < 0) {
			log.info("业务处理时发生了异常:[" + fullPath + "]");
			// ex.printStackTrace();
			String exceptionid = IDHelper.getExceptionID();
			Dao g4Dao = (Dao) SpringBeanLoader.getSpringBean("g4Dao");
			Connection connection = null;
			PreparedStatement statement = null;
			try {
				connection = g4Dao.getConnection();
				String inserSql = "	INSERT INTO eaexception (exceptionid, clazz, methodname, activetime, exception) VALUES ( ?,?,?,?,?)";
				statement = connection.prepareStatement(inserSql);
				statement.setString(1, exceptionid);
				statement.setString(2, clazzString);
				statement.setString(3, methodName);
				statement.setBigDecimal(4, G4Utils.getCurrentTimeAsNumber());
				statement.setString(5, ex.getMessage());
				statement.executeUpdate();
				connection.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (connection != null) {
					try {
						statement.close();
					} catch (SQLException e) {
					}
				}
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
					}
				}
			}
		}
	}

}
