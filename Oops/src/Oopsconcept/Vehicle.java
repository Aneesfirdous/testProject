package Oopsconcept;

abstract class Vehicle {
	String model;
	Vehicle(String model){
		this.model=model;
	}
	abstract double Fuelcalculator();
	
}
class Car extends Vehicle{
	double distance,Fuelused;
	Car(String model,double distance,double Fuelused){
		super(model);
		this.distance=distance;
		this.Fuelused=Fuelused;
	}
	double Fuelcalculator() {
		return distance/Fuelused;
	}
}
class Bike extends Vehicle{
	double distance,Fuelused;
	Bike(String model,double distance,double Fuelused){
		super(model);
		this.distance=distance;
		this.Fuelused=Fuelused;
	}
	double Fuelcalculator() {
		return distance/Fuelused;
}
}

