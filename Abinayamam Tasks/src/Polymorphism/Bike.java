package Polymorphism;

public interface Bike {
	 void cost();
	 void speed();
}
class Ktm implements Bike{
	public void cost() {
		System.out.println(" Cost of the Bike");
	}
	public void speed() {
		System.out.println("Speed of the Bike");
	}
}