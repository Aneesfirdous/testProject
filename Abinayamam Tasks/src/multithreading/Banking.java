package multithreading;

public class Banking {
	public static void main(String[] args) {
		process p = new process();
		deposittask d= new deposittask(p,"Anees",1000);
		d.start();
		withdrawtask w= new withdrawtask(p,"Anees",2000);
		w.start();
		check c = new check(p,"Anees");
		c.start();
	}
}
class process{
	double balance = 5000;
	synchronized void deposit(String name,double amount) {
		if(amount>0) {
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			balance+=amount;
			System.out.println(name + " deposited " + amount);
		}
	}
	synchronized void withdraw(String name,double amount) {
		if(amount<=balance) {
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			balance-=amount;
			System.out.println(name + " withdraw " + amount);
		}else {
			System.out.println("Insufficient balance");
		}
	}
	synchronized void checkbalance(String name) {
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		System.out.println(name +" The available balance is "+  balance);
	}
}
class deposittask extends Thread{
	process p;
	int amount;
	String name;
	deposittask(process p,String name,int amount){
		this.p=p;
		this.name=name;
		this.amount=amount;
	}
	public void run() {
		p.deposit(name, amount);
	}
}
class withdrawtask extends Thread{
	process p;
	int amount;
	String name;
	withdrawtask(process p,String name,int amount){
		this.p=p;
		this.name=name;
		this.amount=amount;
	}
	public void run() {
		p.withdraw(name, amount);
	}
}
class check extends Thread{
	process p;
	String name;
	check(process p,String name){
		this.p=p;
		this.name=name;
	}
	public void run() {
		p.checkbalance(name);
	}
}