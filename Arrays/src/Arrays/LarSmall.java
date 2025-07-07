package Arrays;
import java.util.Scanner;

public class LarSmall {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the size of an Array : ");
		int size = sc.nextInt();
		
		int arr[] = new int[size];
		System.out.println("Enter " +size+ "elements: ");
		for(int i=0;i<size;i++) {
			arr[i]=sc.nextInt();
		}
		
		int max = arr[0];
		int min = arr[0];
		for(int i=1;i<arr.length;i++) {
			if(arr[i]>max) {
				max=arr[i];
			}
			if(arr[i]<min) {
				min=arr[i];
			}
		}
		System.out.println("Largest element: "+max+ "Smallest element: "+min);
	}
}
