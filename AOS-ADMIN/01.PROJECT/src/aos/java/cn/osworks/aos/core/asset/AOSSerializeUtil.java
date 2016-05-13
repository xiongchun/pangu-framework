package cn.osworks.aos.core.asset;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 系列化工具类
 * 
 * @author OSWorks-XC
 */
public class AOSSerializeUtil {
	
	static Log log = LogFactory.getLog(AOSSerializeUtil.class);
	
	/**
	 * 序列化
	 * 
	 * @param obj
	 * @return
	 */
	public static byte[] serialize(Object obj){
		try{
			ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(byteOut);
			oos.writeObject(obj);
			byte[] bytes = byteOut.toByteArray();
			oos.close();
			byteOut.close();
			return bytes;
		}catch (Exception e) {
			log.error("对象序列化失败");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 反序列化
	 * 
	 * @param bytes
	 * @return
	 */
	public static Object unSerialize(byte[] bytes){
		ByteArrayInputStream in = null;
		try{
			in = new ByteArrayInputStream(bytes);
			ObjectInputStream objIn = new ObjectInputStream(in);
			return objIn.readObject();
		}catch (Exception e) {
			log.error("反序列化失败");
			e.printStackTrace();
		}
		return null;
	}
}
