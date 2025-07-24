package Accessmodi;

public class Home {
	Home(String family){
		System.out.println("Family is in Home");
	}
}
class Father extends Home{
	Father(){
		super("Rahim");
		System.out.println("Father of me");
	}
	public static void main(String[] args) {
		Father   = new Father();
	}
}