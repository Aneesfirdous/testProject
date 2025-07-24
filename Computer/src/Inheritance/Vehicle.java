package Inheritance;

public class Vehicle {
	public void Start() {
		System.out.println("The vehicle is starting");
	}
}
class Bike extends Vehicle{
	public void Start() {
		System.out.println("The bike is starting");
	}
}
class Car extends Vehicle{
	public void Start() {
		System.out.println("Car is starting");
	}
}
