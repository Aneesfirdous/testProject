package Oopsconcept;

public class Student {
	String name;
	int rollno;
	int marks;
	
	Student(String name,int rollno,int marks){
		this.name=name;
		this.rollno=rollno;
		this.marks=marks;
	}
	
	public void displayDetails() {
		System.out.println("Name : "+name +" RollNo : "+rollno+" Marks: "+marks);
	}
	
	public static void main(String[] args) {
		Student s = new Student("Anees",675,90);
		s.displayDetails();
		}
}
