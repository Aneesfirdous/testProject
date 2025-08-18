package practice;

public class LastcharCaps {
	public static void main(String[] args) {
		
		String s ="hello friends good morning";
        StringBuilder result= new StringBuilder();
        for(int i=0;i<s.length();i++) {
        	char ch=s.charAt(i);
        	if(ch!=' ' && (i==s.length()-1||s.charAt(i+1)==' ')){
        		result.append(Character.toUpperCase(ch));
        	}else {
        		result.append(ch);
        	}
        }
        System.out.println(result.toString());
	}
			
}

