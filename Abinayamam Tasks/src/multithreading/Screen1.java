package multithreading;

public class Screen1 {
	public static void main(String[] args) {
		Screen2 s2 = new Screen2();
		Screen3 s3 = new Screen3();
		s2.start();
		s3.start();
	}
}
class Screen2 extends Thread{
	public void run() {
		for(int i=0;i<=5;i++) {
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println(i);
		}
	}
}
class Screen3 extends Thread{
	public void run() {
		for(int i=0;i<=10;i++) {
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println(i);
		}
	}
}
