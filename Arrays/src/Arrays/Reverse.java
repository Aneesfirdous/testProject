package Arrays;

import java.util.Arrays;

public class Reverse {
	public static void main(String[] args) {
		int[] arr= {1,2,3,4,5};
		for(int i=0;i<arr.length/2;i++) {
			int temp = arr[i];
			arr[i]=arr[arr.length-1-i];
			arr[arr.length-1-i]=temp;
			
		}
		//converts the entire array into string, it print array contents clearly
		System.out.println(Arrays.toString(arr));
		
		}
	}

