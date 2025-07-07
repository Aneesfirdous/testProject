package Oopsconcept;


//POJO----plain old java object
//realtime ex---accounts creation of instagram, we will submit name,mail etc., that will store as a data to them and 
//we will get username.
//we can give variables,methods,constructors


public class encapsulation {
	private String Username;
	private String Password;
	private long mobile;
	private int age;
	private char gender;
	
	
	
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
	
}
