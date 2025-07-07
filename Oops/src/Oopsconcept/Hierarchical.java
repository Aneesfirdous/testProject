package Oopsconcept;

public class Hierarchical {
	void parentclassmethod() {
		System.out.println("Parent class");
	}
}
class childclass1 extends Hierarchical{
	void childclass1method() {
		System.out.println("child class1");
	}
}
class childclass2 extends Hierarchical{
	void childclass2method() {
		System.out.println("child class2");
	}
}