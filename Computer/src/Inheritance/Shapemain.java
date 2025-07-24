package Inheritance;

public class Shapemain {
	public static void main(String[] args) {
		Shape[] shapes = new Shape[2];
		shapes[0]= new circle(5.0);
		shapes[1]= new square(4.0);
		
		for(Shape s : shapes) {
			s.area();
		}
	}
}
