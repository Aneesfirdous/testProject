package Oopsconcept;

public class encap_child {
	public static void main(String[] args) {
		encapsulation E = new encapsulation();
		E.setUsername("Anees");
		E.setPassword("anees@123");
		E.setMobile(98657439);
		E.setGender('F');
		E.setAge(30);
		
		System.out.println(E.getUsername());
		System.out.println(E.getPassword());
		System.out.println(E.getMobile());
		System.out.println(E.getGender());
		System.out.println(E.getAge());
		
		encapsulation E1 = new encapsulation();
	}
}
