package Inheritance;

abstract class Shape {
	abstract void area();
}
class circle extends Shape{
	double radius;
	circle(double radius){
		this.radius=radius;
	}
	@Override
	void area() {
		double result =Math.PI*radius*radius;
		System.out.println("Area of the circle is : " +result);
		}
}
class square extends Shape{
	double side;
	square(double side){
		this.side=side;
	}
	@Override
	void area() {
		double result=side*side;
		System.out.println("Area of the Square: "+result);
		}
}
