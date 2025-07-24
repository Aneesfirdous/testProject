package Oopsconcept;

public class Shape1main {
	public static void main(String[] args) {
		triangle t = new triangle(20,32);
		t.calculatearea();
		rectangle r = new rectangle(100,50);
		r.calculatearea();
		circle c = new circle(5);
		c.calculatearea();
	}
}
