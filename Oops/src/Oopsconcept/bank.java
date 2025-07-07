package Oopsconcept;

abstract class bank {
	double balance;
	bank(double initialbalance){
		this.balance=initialbalance;
	}
	abstract void deposit(double amount);
	abstract void withdraw(double amount);
	abstract double getBalance();
}
class Savingsaccount extends bank{
	Savingsaccount(double initialbalance){
		super(initialbalance);
	}
	void deposit(double amount) {
		balance+=amount;
	}
	void withdraw(double amount) {
		if(balance>=amount) {
			balance-=amount;
		}
	}
	double getBalance() {
		return balance;
	}
}