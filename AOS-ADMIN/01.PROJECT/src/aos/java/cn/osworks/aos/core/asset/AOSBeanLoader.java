package cn.osworks.aos.core.asset;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.web.asset.WebApplicationContextExporterListener;

/**
 * <b>SpringBean加载器, 提供直接获取SpringBean的方法</b>
 * <p>
 * 优先使用Web.xml里的WebApplicationContext。如果WebApplicationContext为null,
 * 则重新初始化ApplicationContext(在一些未启动Web的场景下使用,如后台测试等)。
 * </p>
 * <p>
 * (1)、使用此加载器可以获得一个Spring容器的ApplicationContext实例,通过此实例你就可以方便的使用getBean()
 * 方法获取SpringBean. <br>
 * (2)、您也可以直接通过我们提供的getSpringBean()方法活得SpringBean。
 * </p>
 * 
 * @author OSWorks-XC
 */
public class AOSBeanLoader {

	private static Log log = LogFactory.getLog(AOSBeanLoader.class);

	private static ApplicationContext applicationContext;

	static {
		try {
			initApplicationContext();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 初始化ApplicationContext对象
	 * 
	 * @throws Exception
	 */
	private static void initApplicationContext() throws Exception {
		applicationContext = WebApplicationContextExporterListener.getWebApplicationContext();
		// 优先使用ServletContext环境下导出的WebApplicationContext()
		if (applicationContext == null) {
			try {
				if (log.isInfoEnabled())
					log.info("系统正在初始化...");
				applicationContext = new ClassPathXmlApplicationContext(new String[] { "aos.cxt.xml" });
				if (log.isInfoEnabled())
					log.info("初始化完成.");
			} catch (Exception e) {
				log.error("Spring初始化失败,请检查您的配置文件。");
				e.printStackTrace();
				System.exit(0);
			}
		}
	}

	/**
	 * 返回ApplicationContext对象
	 * 
	 * @return ApplicationContext 返回的ApplicationContext实例
	 */
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 获取一个SpringBean服务
	 * 
	 * @param pBeanId
	 *            Spring配置文件名中配置的SpringID号
	 * @return Object 返回的SpringBean实例
	 */
	public static Object getSpringBean(String pBeanId) {
		Object springBean = null;
		try {
			springBean = applicationContext.getBean(pBeanId);
		} catch (NoSuchBeanDefinitionException e) {
			String msg = "Spring容器中没有找到ID为:[" + pBeanId + "]的SpringBean组件,请检查!";
			throw new AOSException(msg, e);
		}
		return springBean;
	}

}
