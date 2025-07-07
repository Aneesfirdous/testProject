package Arrays;

import java.util.Scanner;

public class SumAndAverage {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the size of an Array : ");
		int size = sc.nextInt();
		
		int arr[] = new int[size];
		System.out.println("Enter " +size+ " elements: ");
		for(int i=0;i<size;i++) {
			arr[i]=sc.nextInt();
		}
		int sum=0;
		for(int num:arr) {
			sum+=num;
		}
		double average=(double)sum/size;
		System.out.println("Sum: "+sum+" Average: "+ average);
}
}
