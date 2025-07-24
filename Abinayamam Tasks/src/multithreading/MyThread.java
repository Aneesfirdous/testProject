package multithreading;

public class MyThread extends Thread {
	public void run(){
		System.out.println(getName() + "Thread is running");
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			System.out.println(getName() +"Thread interrupted");
		}
		System.out.println(getName() +"Thread finished");
}
	public static void main(String[] args) {
		MyThread t = new MyThread();
		System.out.println("Thread started, current state:" + t.getState());
		t.start();
		System.out.println("Thread state after completion" + t.getState());
	}
}
