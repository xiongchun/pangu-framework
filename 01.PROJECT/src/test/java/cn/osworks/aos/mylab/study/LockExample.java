package cn.osworks.aos.mylab.study;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 实现同步锁的一个小例子   
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
public class LockExample {

	private final Lock lock = new ReentrantLock();

	/**
	 * 方法一
	 */
	public void doAny() {
		lock.lock();
		try {
			//做一些需要同步锁的事
		} finally {
			lock.unlock();
		}
	}
	
	/**
	 * 方法二
	 */
	public synchronized void doAny2(){
		//做一些需要同步锁的事
	}

}
