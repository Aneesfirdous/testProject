package Inheritance;

public class LanguageInfo {
	void tamillanguage() {
		System.out.println("Tamil");
	}
	void englishlanguage() {
		System.out.println("English");
	}
	void hindilanguage() {
		System.out.println("Hindi");
	}
}
class Statedetails extends LanguageInfo{
	void southIndia() {
		System.out.println("South");
	}
	void northIndia() {
		System.out.println("North");
	}
}