package aos.framework.core.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.utils.AOSUtils;

/**
 * <b>系统异常类</b>
 * 
 * @author xiongchun
 */
public class AOSException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	private static Logger log = LoggerFactory.getLogger(AOSException.class);

	public AOSException() {
		super();
	}

	/**
	 * 支持传参数给异常描述字符串进行合并
	 * 
	 * @param errID
	 * @param args
	 */
	public AOSException(int errID, Object... args) {
		super("异常编号：" + errID);
		ExceptionVO vo = ExceptionInfoUtil.getExceptionInfo(String.valueOf(errID));
		if (AOSUtils.isNotEmpty(vo)) {
			String errMsg = "异常编号：" + errID;
			errMsg = errMsg + "\n异常摘要：" + AOSUtils.merge(vo.getInfo(), args);
			errMsg = errMsg + "\n异常排查建议：" + vo.getSuggest() + " 更多信息请访问开发者社区：http://git.oschina.net/osworks/AOS";
			System.out.println(errMsg);
		} else {
			System.out.println("没有查询到异常编号为[" + errID + "]的异常配置信息。");
		}
	}

	/**
	 * 根据异常ID获取异常相关信息
	 * 
	 * @param errID
	 */
	public AOSException(int errID) {
		super("异常编号：" + errID);
		ExceptionVO vo = ExceptionInfoUtil.getExceptionInfo(String.valueOf(errID));
		if (AOSUtils.isNotEmpty(vo)) {
			String errMsg = "异常编号：" + errID;
			errMsg = errMsg + "\n异常摘要：" + AOSUtils.merge(vo.getInfo(), "");
			errMsg = errMsg + "\n异常排查建议：" + vo.getSuggest() + " 更多信息请访问开发者社区：http://git.oschina.net/osworks/AOS";
			System.out.println(errMsg);
		} else {
			System.out.println("没有查询到异常编号为[" + errID + "]的异常配置信息。");
		}
	}
	
	/**
	 * 直接打印简单信息
	 * 
	 * @param pMsg
	 * @param pNestedException
	 */
	public AOSException(String pMsg) {
		super(pMsg);
		log.error(pMsg);
	}

	/**
	 * 直接打印简单信息和异常堆栈
	 * 
	 * @param pMsg
	 * @param pNestedException
	 */
	public AOSException(String pMsg, Throwable pNestedException) {
		super(pMsg);
		pNestedException.printStackTrace();
	}
	
	/**
	 * 直接打印异常堆栈
	 * 
	 * @param pMsg
	 * @param pNestedException
	 */
	public AOSException(Throwable pNestedException) {
		super(pNestedException);
		pNestedException.printStackTrace();
	}

}
