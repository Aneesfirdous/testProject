package Oopsconcept;

public class Employee {
	String name;
	double salary;
	
	Employee(){
		String name;
		double salary;
		
	}
	Employee(String name){
		this.name=name;
		double salary;
	}
	Employee(String name,double salary){
		this.name=name;
		this.salary=salary;
	}
	public void display() {
		System.out.println("Name :" +name+ " Salary : "+salary);
	}
	public static void main(String[] args) {
		Employee e = new Employee();
		Employee m = new Employee("Anees");
		Employee p = new Employee("Anees",50000);
		e.display();
		m.display();
		p.display();
	}
}
