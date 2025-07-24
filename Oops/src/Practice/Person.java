package Practice;

public class Person {
	private String name;
	private int age;
	
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name=name;
	}
	public int getage() {
		return age;
	}
	public void setage(int age) {
		this.age=age;
		if(age>0) {
			System.out.println("Eligible");
		}else {
			System.out.println("Not Eligible");
		}
		
	}
	public static void main(String[] args) {
		Person p = new Person();
		p.setname("Anees");
		System.out.println(p.getname());
		
		p.setage(30);
		System.out.println(p.getage());
		
	}
}
