package multithreading;

public class DeadLock {
	static final Object pen = new Object();
	static final Object notebook = new Object();
	
	public static void main(String[] args) {
		Thread person1 = new Thread(()->{
			synchronized(pen) {
				System.out.println("Person 1 has Pen, wants Notebook");
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				synchronized (notebook) {
					System.out.println("Person 1 got Notebook");
				}
			}
	});
		Thread person2 = new Thread(()->{
			synchronized(pen) {
				System.out.println("Person 2 has Notebook , wants Pen");
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				synchronized (notebook) {
					System.out.println("Person 2 got Pen");
				}
			}
	});
	person1.start();
	person2.start();
	}
}
