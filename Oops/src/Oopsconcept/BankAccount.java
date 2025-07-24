package Oopsconcept;

public class BankAccount {
	int accno;
	double balance;
	
	BankAccount(int accno,double balance){
		this.accno=accno;
		this.balance=balance;
		
	}
	
	public void deposit(double amount) {
		balance +=amount;
		System.out.println("The deposited amount is: "+amount);
	}
	public void withdraw(double amount) {
		if(amount>balance) {
			System.out.println("Insufficient Balance");
		}else if(amount<=balance) {
			balance-=amount;
			System.out.println("The withdraw amount is: "+amount);
		}
	}
	public void checkbalance() {
		System.out.println("The available balance is: "+balance);
	}
	public static void main(String[] args) {
		BankAccount b = new BankAccount(000234,10000);
		b.checkbalance();
		b.deposit(5000);
		b.withdraw(2000);
		b.checkbalance();
	}
}
