package cn.osworks.aos.mylab.study;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;

import cn.osworks.aos.core.exception.ExceptionInfoUtil;



/**
 * <b>一些资源处理相关的基础的模版代码</b>
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
@SuppressWarnings("all")
public class ResourceExample {

	public static void main(String[] args) throws IOException, URISyntaxException {
		showUri();
		//getResourceAsStream();
	}

	/**
	 * 获取相关路径的方法
	 * 
	 * @throws IOException
	 * @throws URISyntaxException 
	 */
	private static void showUri() throws IOException, URISyntaxException {
		File f = new File(ResourceExample.class.getResource("/").getPath());
		System.out.println(f);
		File f2 = new File(ResourceExample.class.getResource("").getPath());
		System.out.println(f2);
		//支持中文路径、空格。
		String anypath = ResourceExample.class.getResource("/").toURI().getPath();
		System.out.println(anypath);
		File directory = new File("");
		String sourseFile = directory.getCanonicalPath();
		System.out.println("a:" + sourseFile);
		URL xmlpath = ResourceExample.class.getClassLoader().getResource("");
		System.out.println(xmlpath);
		System.out.println(System.getProperty("user.dir"));
		System.out.println(System.getProperty("java.class.path"));
	}

	/**
	 * 从类路径读取文件流
	 * 
	 * @throws IOException
	 */
	private static void getResourceAsStream() throws IOException {
		// 从当前类路径读取文件流(注意：相对路径的哦)
		InputStream is = ExceptionInfoUtil.class.getResourceAsStream("exceptionInfo.xml");
		System.out.println(is);
		// 也可以是用这样的相对路径(注意：conf是相对与当前类ExceptionInfoUtil的而不是相对与跟路径的)
		// InputStream is3 = ExceptionInfoUtil.class.getResourceAsStream("conf/exceptionInfo.xml");
		
		// 也可以指定全路径(需要/开头)
		InputStream is4 = ExceptionInfoUtil.class
				.getResourceAsStream("/aos/core/exception/exceptionInfo.xml");
		System.out.println(is4);

		// 从跟路径开始指定绝对路径读取资源文件信息
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream is2 = classLoader.getResourceAsStream("/aos/core/exception/exceptionInfo.xml");
		System.out.println(is2);
	}

}
