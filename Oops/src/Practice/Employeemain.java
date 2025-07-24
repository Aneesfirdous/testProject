package Practice;

public class Employeemain {
	public static void main(String[] args) {
		Manager m = new Manager("Anees", 50000.0);
		m.calculateSalary();
		clerk c = new clerk("Firdous", 60000.0);
		c.calculateSalary();
}
}