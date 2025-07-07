package Oopsconcept;

public class bankmain {
	public static void main(String[] args) {
		bank sa = new Savingsaccount(50000.0);
		sa.deposit(5000.0);
		
		sa.withdraw(2000.0);
		System.out.println(" The remaining balance is : " + sa.getBalance());
	}
}
