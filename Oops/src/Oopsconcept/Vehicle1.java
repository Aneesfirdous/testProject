package Oopsconcept;

public class Vehicle1 {
	String brand;
	int speed;
	Vehicle1(String brand,int speed){
		this.brand=brand;
		this.speed=speed;
	}
	void show() {
		System.out.println("The vehicle brand is : "+brand+ "and speed is "+speed);
	}
}
class car extends Vehicle1{
	int seats;
	
	car(String brand,int speed,int seats){
		super(brand,speed);
		this.seats=seats;
	}
	void display() {
		System.out.println("The car has seats : "+seats);
	}
}
class bike extends Vehicle1{
	
	int no;
	bike(String brand,int speed,int no){
		super(brand,speed);
		this.no=no;
	}
	void display() {
		System.out.println("The bike No: "+no);
	}
}
