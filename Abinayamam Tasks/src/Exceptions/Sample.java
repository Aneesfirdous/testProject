package Exceptions;
import java.util.*;


public class Sample {
	//Arithmetic Exception
public static void main(String[] args) {
	/*System.out.println(0);
	System.out.println(1+5);
	System.out.println(2+7);
	System.out.println(3/0);
	System.out.println(4+11);
	System.out.println(5+13);
	
	
	String s = null; //nullpointer
	s.indexOf('a');
	System.out.println(s);
	
	int[] a= {1,2,3};//Arrayindexoutof Bound
	System.out.println(a[3]);
	
	Scanner sc =new Scanner(System.in);//InputMismatchException
	System.out.println("Enter your age");//if I typed in string
	int age = sc.nextInt();
	
	String s = "Anees";//StringIndexOutOfBoundsException
	System.out.println(s.charAt(5));
	
	List<Integer> li = new LinkedList<>();//IndexOutOfBoundsException
	li.add(200);
	li.add(400);
	li.add(500);
	li.add(600);
	
	System.out.println(li.get(5));*/
	
	String s = "7c";//NumberFormatException//if there is number in string, we can convert or else this exception.
	int parse =Integer.parseInt(s);
	System.out.println(parse);
	
	
}
}
