package practice;

public class OddOne {
	public static void main(String[] args) {
		String[] str = {"445455", "808908","21434s","6876978"};
		for(String s:str) {
			if(s.length() != 6||!s.matches("\\d+")){
				System.out.println("The Odd one: " + s);
			}
		}
	}

}
	