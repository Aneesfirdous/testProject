package Practice;

public class Calculator {
	public int add(int a,int b) {
		return a+b;
	}
	public double add(double a,double b) {
		return a+b;
	}
	public int add(int a,int b,int c) {
		return a+b+c;
	}
	public static void main(String[] args) {
		Calculator c = new Calculator();
		System.out.println(c.add(2, 3));
		System.out.println(c.add(2.3, 4.5));
		System.out.println(c.add(6,7,8));
	}
}
