package Arrays;

import java.util.Arrays;

public class Merge {
	public static void main(String[] args) {
		int[] a= {2,4,6};
		int[] b= {3,5,7};
		int[] merged = new int[a.length+b.length];
		
		for(int i=0;i<a.length;i++) {
			merged[i]=a[i];
		}
		for(int i=0;i<b.length;i++) {
			merged[a.length+i]=b[i];
		}
		System.out.println(Arrays.toString(merged));
	}
}
