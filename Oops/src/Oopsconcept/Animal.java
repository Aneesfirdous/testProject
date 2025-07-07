package Oopsconcept;


//multilevel inheritance
public class Animal {
	void sound() {
		System.out.println("Animal makes sound");
	}
}
class Dog extends Animal{
	void bark() {
		System.out.println("Dog barks");
	}
}
class puppy extends Dog{
	void weep() {
		System.out.println("puppy weeping");
	}
}
