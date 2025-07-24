package Practice;

public class Animal {
	public void sound() {
		System.out.println("Animal makes sound");
	}
}
class dog extends Animal{
	public void sound() {
		System.out.println("Dog barks");
	}
}
class cat extends Animal{
	public void sound() {
		System.out.println("Cat Meows");
	}
}