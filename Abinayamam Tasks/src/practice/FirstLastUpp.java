package practice;

public class FirstLastUpp {
	public static void main(String[] args) {
		String str ="welcome to softlogic systems";
		StringBuilder result = new StringBuilder();
		int wordstart =0;
		for(int i=0;i<str.length();i++) {
			char ch = str.charAt(i);
			if(i==0 ||str.charAt(i-1)==' ') {
				result.append(Character.toUpperCase(ch));
				wordstart=i;
			}else if(i==str.length()-1|| str.charAt(i+1)==' '){
				if(i-wordstart>=2) {
					result.append(Character.toUpperCase(ch));
				}else {
					result.append(ch);
					}
			}else {
				result.append(ch);
			}
		}
		System.out.println(result);
	}
}
