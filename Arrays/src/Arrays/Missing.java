package Arrays;

public class Missing {
	public static void main(String[] args) {
		int[] arr = {1,2,3,5};
		int n = 5;
		int arr_sum=0;
		int total_sum = n*(n+1)/2;
		for(int num:arr) {
			arr_sum += num;
		}
		int result=total_sum-arr_sum;
		System.out.println("The missing element: "+result);
		
	}
}
