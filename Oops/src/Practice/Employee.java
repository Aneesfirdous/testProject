package Practice;

abstract class Employee {
	String name;
	double salary;
	Employee(String name,double salary){
		this.name=name;
		this.salary=salary;
	}
	abstract void calculateSalary();
}
class Manager extends Employee{
	
	Manager(String name,double salary){
		super(name,salary);
		
	}
	void calculateSalary() {
		System.out.println("Name: " + name+ " Salary: "+salary);
	}
}
class clerk extends Employee{
	clerk(String name,double salary){
		super(name,salary);
		
	}
	void calculateSalary() {
		System.out.println("Name: " +name+ "Salary : " + salary);
	}
}