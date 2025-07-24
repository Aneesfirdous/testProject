package TypeVariable;

public class Variable {
	private void local() {
		int a = 100;//local variable
		System.out.println("Value of a is : "+a);
	}
	static int a =50;//static variable
	public static void main(String[] args) {
		//int a = 50;   global or instance variable
		System.out.println("The value of a is:"+a);
		Variable v = new Variable();
		v.local();
	}
}
