package Oopsconcept;


//multiple inheritance
public class inheritance {
	
	interface A{
		void show();
	}
	
	interface B{
		void display();
	}

//class implements both interfaces
	
	class MyClass implements A,B{
		public void show() {
			System.out.println("Showing from A");
		}
		public void display() {
			System.out.println("Displaying from B");
		}
	}
	
	
}
