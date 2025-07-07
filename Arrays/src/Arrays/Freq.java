package Arrays;

public class Freq {
	public static void main(String[] args) {
		int[] arr = {2,4,2,5,4};
		boolean[] visited = new boolean[arr.length];
		
		for(int i=0;i<arr.length;i++) {
			if(!visited[i]) {
				int count = 1;
				for(int j=i+1;j<arr.length;j++){
					if(arr[i]==arr[j]) {
						count++;
						visited[j]=true;
					}
			}
				System.out.println(arr[i] +" occurs " + count +" times");
		}
			
	}
}
	
}
