package Oopsconcept;

abstract class Shape {
	abstract double CalculateArea();
}
class Circle extends Shape{
	double radius; 
	Circle (double r){
		radius=r;
	}
	public double CalculateArea() {
		return Math.PI*radius*radius;
	}
	
}
class Rectangle extends Shape{
	double length, breadth;
	Rectangle (double l, double b){
		length=l;
		breadth=b;
	}
	public double CalculateArea() {
		return length*breadth;
	}
}
