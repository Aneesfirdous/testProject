package Oopsconcept;

abstract class Shape1 {
	abstract void calculatearea();
}
class circle extends Shape1{
	double radius;
	circle(double radius){
		this.radius=radius;
	}
	void calculatearea() {
		double area= Math.PI*radius*radius;
		System.out.println("The area of the circle is: "+area);
	}
}
class rectangle extends Shape1{
	long length;
	long breadth;
	rectangle(long length,long breadth){
		this.length=length;
		this.breadth=breadth;
	}
	void calculatearea() {
		double area= length*breadth;
		System.out.println("The area of the rectangle is: "+area);
	}
}
class triangle extends Shape1{
	int base;
	int height;
	triangle(int base,int height){
		this.base=base;
		this.height=height;
	}
	void calculatearea() {
		double triarea= 0.5*base*height;
		System.out.println("The area of the triangle is: "+triarea);
	}
}
