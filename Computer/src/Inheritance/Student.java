package Inheritance;

public class Student {
	String name;
	int age;
	int mark;
	
	public Student(){
		name = "";
		age=0;
		mark=0;
	}
	public Student(String name,int age) {
		this.name=name;
		this.age=age;
		this.mark=0;
	}
	public Student(String name,int age,int mark) {
		this.name=name;
		this.age=age;
		this.mark=mark;
	}
	public void checkpass() {
		if(mark>=35) {
			System.out.println("Passed");
		}else {
			System.out.println("Failed");
		}
	}
	public void display() {
		System.out.println("Name: "+name+ "Age: "+age+ "Mark: "+ mark);
	} 
	public static void main(String args[]) {
		Student s1 = new Student();
		Student s2 = new Student("Anees",30 );
		Student s3 = new Student("Firdous",30,90 );
		
		
		s1.display();
		s1.checkpass();
		s2.display();
		s2.checkpass();
		s3.display();
		s3.checkpass();
	}
}
