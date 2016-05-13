package cn.osworks.aos.mylab.study.concurrent;


public class ThreadClass implements Runnable{
	
	private String aString;
	
	public ThreadClass(String in){
		aString = in;
	}

	@Override
	public void run() {
		System.out.println(aString);
		System.out.println("MW:" + Thread.currentThread().getId() + "-" + Thread.currentThread().getName());
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
