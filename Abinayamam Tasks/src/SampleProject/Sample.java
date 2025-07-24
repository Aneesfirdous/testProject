package SampleProject;
import java.util.*;

public class Sample {
	
	public void Account_creation() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter your Name:");
		String name = sc.next();
		System.out.println("Enter your MailId:");
		String mail = sc.next();
		System.out.println("Enter your MobileNumber:");
		int mobile = sc.nextInt();
		System.out.println("Enter your Password:");
		String pwd = sc.next();
		System.out.println("Enter your DOB:");
		int dob = sc.nextInt();
	}
	
	public static void main(String[] args) {
		System.out.println("Shopping Zone!!!");
		List<String> s = new ArrayList<>();
		s.add("Electronics");
		s.add("Groceries");
		s.add("Fashion");
		s.add("Home Appliances");
		s.add("Sports");
		
	}
}
