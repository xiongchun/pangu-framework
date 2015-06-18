package org.g4studio.core.properties;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.util.G4Constants;

/**
 * Properties处理器
 * @author XiongChun
 * @since 2009-07-10
 */
public class PropertiesHelper {
	private static Log log = LogFactory.getLog(PropertiesHelper.class);
	private Properties objProperties;
	
	/**
	 * 构造函数
	 * @param is 属性文件输入流
	 * @throws Exception
	 */
	public PropertiesHelper(InputStream is) throws Exception {
		try{
			objProperties = new Properties();
			objProperties.load(is);
		}
		catch(FileNotFoundException e){
			log.error(G4Constants.Exception_Head + "未找到属性资源文件!");
			e.printStackTrace();
			throw e;
		}
		catch(Exception e){
			log.error(G4Constants.Exception_Head + "读取属性资源文件发生未知错误!");
			e.printStackTrace();
			throw e;
		}finally{
			is.close();
		}
	}

    /**
     * 持久化属性文件<br>
     * 使用setProperty()设置属性后,必须调用此方法才能将属性持久化到属性文件中
     * @param pFileName 属性文件名
     * @throws IOException 
     */
	public void storefile(String pFileName){
		FileOutputStream outStream = null;
		try{
			File file = new File(pFileName + ".properties");
			outStream = new FileOutputStream(file);
			objProperties.store(outStream, "#G4Studio");
		}catch(Exception e){
			log.error(G4Constants.Exception_Head + "保存属性文件出错.");
			e.printStackTrace();
		}finally{
			try {
				outStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

    /**
     * 获取属性值
     * @param key 指定Key值，获取value
     * @return String 返回属性值
     */
	public String getValue(String key){
		return objProperties.getProperty(key);
	}

    /**
     * 获取属性值,支持缺省设置
     * @param key
     * @param defaultValue 缺省值
     * @return String 返回属性值
     */
	public String getValue(String key, String defaultValue){
		return objProperties.getProperty(key, defaultValue);
	}

    /**
     * 删除属性
     * @param key 属性Key
     */
	public void removeProperty(String key){
		objProperties.remove(key);
	}
	
    /**
     * 设置属性
     * @param key 属性Key
     * @param value 属性值
     */
	public void setProperty(String key, String value){
		objProperties.setProperty(key, value);
	}
	
    /**
     * 打印所有属性值
     */
	public void printAllVlue(){
		 objProperties.list(System.out);
	}
}
