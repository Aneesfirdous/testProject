package Inheritance;

public class BankInfo {
	void saving() {
		System.out.println("Savings Account");
	}
	void fixed() {
		System.out.println("Fixed Account");
	}
}
class AxisBank extends BankInfo{
	void deposit() {
		System.out.println("Deposit Amount");
		
		
	}
}
