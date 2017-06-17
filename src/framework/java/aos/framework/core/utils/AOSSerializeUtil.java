package aos.framework.core.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import aos.framework.core.exception.AOSException;

/**
 * 系列化工具类
 * 
 * @author xiongchun
 */
public class AOSSerializeUtil {
	
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
			throw new AOSException("对象序列化失败", e);
		}
	}
	
	/**
	 * 反序列化
	 * 
	 * @param bytes
	 * @return
	 */
	public static Object unSerialize(byte[] bytes){
		if (bytes == null) {
			throw new AOSException("传入的反序列化对象不能为空");
		}
		ByteArrayInputStream in = null;
		try{
			in = new ByteArrayInputStream(bytes);
			ObjectInputStream objIn = new ObjectInputStream(in);
			return objIn.readObject();
		}catch (Exception e) {
			throw new AOSException("反序列化失败", e);
		}
	}
}
