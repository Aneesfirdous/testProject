package Oopsconcept;

public class Vehiclemain {
	public static void main(String[] args) {
		Vehicle car = new Car("Swift",45.8,10.0);
		Vehicle bike = new Bike("Splender",65.9,455.9);
		System.out.println("The Car fuelcalculation : "+ car.Fuelcalculator());
		System.out.println("The Bike fuelcalculation : "+ bike.Fuelcalculator());
	}
}
