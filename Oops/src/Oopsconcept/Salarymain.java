package Oopsconcept;

public class Salarymain {
	public static void main(String args[]) {
		EmployeeSalary fulltime = new FulltimeEmployee("Anees", 50000);
		EmployeeSalary parttime = new ParttimeEmployee("Firdous", 5, 1000.0);
		System.out.println("The fulltime employee salary is " +fulltime.CalculateSalary());
		System.out.println("The time partemployee salary is " +parttime.CalculateSalary());
	}

}
