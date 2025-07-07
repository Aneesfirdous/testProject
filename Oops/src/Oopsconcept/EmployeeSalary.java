package Oopsconcept;

abstract class EmployeeSalary {
	String name;
	EmployeeSalary(String name){
		this.name=name;
	}
	abstract double CalculateSalary();
	
}
class FulltimeEmployee extends EmployeeSalary{
	double monthlysalary;
	FulltimeEmployee(String name,double salary){
		super(name);
		this.monthlysalary=salary;
	}
	double CalculateSalary() {
		return monthlysalary;
	}
}
class ParttimeEmployee extends EmployeeSalary{
	int hoursworked;
	double hoursrate;
	ParttimeEmployee(String name, int hours,double rate){
		super(name);
		this.hoursworked=hours;
		this.hoursrate=rate;
	}
	double CalculateSalary() {
		return hoursworked*hoursrate;
}
}
