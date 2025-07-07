package Oopsconcept;

public class ShapeTest {
	
		public static void main(String args[]) {
			Shape circle = new Circle(5);
			Shape rectangle = new Rectangle(7,8);
			System.out.println("The Area of the circle : " + circle.CalculateArea());
			System.out.println("The Area of the Rectangle is: " + rectangle.CalculateArea());
		}
	}


