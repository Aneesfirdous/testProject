package ExceptionHandling;

public class Ex1 {
	public static void main(String[] args) {
		System.out.println(0);
		System.out.println(1);
		System.out.println(2);
		try {
			String s = "7hjj";
			int parse =Integer.parseInt(s);
			System.out.println(parse);
		}
		catch(NumberFormatException e) {
			System.out.println("Invalid statement!!!");
		}
		finally {
			System.out.println("Statement in Finally");
		}
		System.out.println(4);
		System.out.println(5);
	}
}