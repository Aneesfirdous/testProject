package Accessmodi;

public class Constructor {
	
	//default constructor
	public Constructor(){
		this("Anees");
		System.out.println("Details about constructor");
	}
	public Constructor(String name) {
		this(23);
		System.out.println("Name of the Constructor");
	}
	public Constructor(int type) {
		this("Anees", 5);
		System.out.println("Type of the Constructor");
	}
	public Constructor(String name, int id ) {
		System.out.println("Name and id of the constructor");
	}
	public static void main(String[] args) {
		Constructor c = new Constructor();
	}
}
