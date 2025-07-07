package Oopsconcept;

import Oopsconcept.inheritance.MyClass;
import Oopsconcept.singleinheritance.Dog;


//outerclass obj=new outerclass();
//outerclass.innerclass objn = obj.new innerclass();
/*public class inhermain {
	
		public static void main(String[] args) {
			inheritance outer = new inheritance();
			inheritance.MyClass obj = outer.new MyClass();
			obj.show();
			obj.display();
		}
	}*/
public class inhermain{
	/*public static void main(String args[]) {
		singleinheritance obj =new singleinheritance();
		singleinheritance.Dog d = obj.new Dog();
		d.sound();
		d.bark();
	}*/
	/*public static void main(String[] args) {
		puppy p = new puppy();
		p.weep();
		p.bark();
		p.sound();
	}*/
	public static void main(String[] args) {
		childclass2 ob = new childclass2();
		ob.childclass2method();
		ob.parentclassmethod();
		
		childclass1 ob1 = new childclass1();
		ob1.childclass1method();
		ob1.parentclassmethod();
	}
	
}

