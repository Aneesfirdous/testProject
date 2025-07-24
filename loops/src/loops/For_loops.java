package loops;

public class For_loops {
	public static void main(String[] args) {
		System.out.println("The even numbers from 1 to 100 is : " );
		for(int i=0;i<=100;i++) {
			if(i%2==0) {
				System.out.println(i);
			}
		}
		System.out.println("The odd numbers from 1 to 100 is : " );
		for(int i=0;i<=100;i++) {
		if(i%2!=0) {
			System.out.println(i);
		}
		}
	}
}

