package Polymorphism;

public class BankInfo {
	public void saving() {
		System.out.println("Savings Account: 4% interest");
	}
	public void fixed() {
		System.out.println("Fixed Deposit: 6.5 interest");
	}
	public void deposit() {
		System.out.println("General Deposit: handled by BankInfo");
	}
}
class AxisBank extends BankInfo{
	public void deposit() {
		System.out.println("AxisBank Deposit: handled by AxisBank");
	}
}
