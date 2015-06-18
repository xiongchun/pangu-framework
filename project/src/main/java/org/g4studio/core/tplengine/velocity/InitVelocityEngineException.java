package org.g4studio.core.tplengine.velocity;

import org.g4studio.core.util.G4Constants;

/**
 * 初始模板引擎异常类
 * @author XiongChun
 * @since 2009-07-28
 * @see RuntimeException
 */
public class InitVelocityEngineException extends RuntimeException{
	
	/**
	 * 缺省串行版本标识
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 构造函数1
	 * @param 
	 */
	public InitVelocityEngineException(){
		super(G4Constants.Exception_Head + "初始化G4Studio平台缺省模板引擎失败.\n");
	}
	
	/**
	 * 构造函数2
	 * @param 
	 */
	public InitVelocityEngineException(String msg){
		super(G4Constants.Exception_Head + "初始化G4Studio平台缺省模板引擎失败\n" + msg);
	}

}
