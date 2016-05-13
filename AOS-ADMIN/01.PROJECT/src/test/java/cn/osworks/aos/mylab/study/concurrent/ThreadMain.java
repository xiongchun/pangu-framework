package cn.osworks.aos.mylab.study.concurrent;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadMain {

	public static void main(String[] args) {
		test3();
	}
	
	/**
	 * 线程池运行线程
	 */
	public static void  test1(){
		// TaskExecutor taskExecutor =
		// (TaskExecutor)AOSBeanLoader.getSpringBean("taskExecutor");
		System.out.println("MW:" + Thread.currentThread().getId() + "-" + Thread.currentThread().getName());
		BlockingQueue<Runnable> queue = new LinkedBlockingQueue<Runnable>();
		ThreadPoolExecutor executor = new ThreadPoolExecutor(3, 3, 1, TimeUnit.DAYS, queue);
		for (int i = 0; i < 3; i++) {
			executor.execute(new Runnable() {
				public void run() {
					System.out.println("MW:" + Thread.currentThread().getName());
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			});
		}
		executor.shutdown();
	}
	
	/**
	 * 简单开新线程
	 */
	public static void  test2(){
		System.out.println("AAA");
		new Thread(new ThreadClass("A")).start();
		new Thread(new ThreadClass("B")).start();
		System.out.println("BBB");
	}
	
	/**
	 * 线程池运行线程
	 */
	public static void  test3(){
		// TaskExecutor taskExecutor =
		// (TaskExecutor)AOSBeanLoader.getSpringBean("taskExecutor");
		System.out.println("MW:" + Thread.currentThread().getId() + "-" + Thread.currentThread().getName());
		BlockingQueue<Runnable> queue = new LinkedBlockingQueue<Runnable>();
		ThreadPoolExecutor executor = new ThreadPoolExecutor(3, 3, 1, TimeUnit.DAYS, queue);
		for (int i = 0; i < 3; i++) {
			executor.execute(new ThreadClass(String.valueOf(i)));
		}
		executor.shutdown();
	}
}
