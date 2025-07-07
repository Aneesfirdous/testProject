package Oopsconcept;

public class singleinheritance{
	class Animal{
		void sound() {
			System.out.println("Animal makes sound");
		}
	}
	class Dog extends Animal{
		void bark() {
			System.out.println("Dog barks");
		}
	}
}

