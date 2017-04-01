package ch6_oop1;

public class ReferenceParamEx3 {
	public static void main(String[] args) {
		int[] arr = new int[] {3,2,1,6,5,4};
		
		printArr(arr);
		sortArr(arr);
		printArr(arr);
		System.out.println("sum="+sumArr(arr));
	}
	
	static void printArr(int[] arr){
		System.out.print("[");
		
		for(int i : arr)
			System.out.print(i+",");
		System.out.println("]");
	}
	
	static int sumArr(int[] arr){
		int sum = 0;
		
		for(int i=0; i<arr.length; i++)
			sum += arr[i];
		return sum;
	}
	static void sortArr(int[] arr){  // bubble sort
		for(int i=0; i<arr.length; i++)
		{
			boolean change = false;  // 매 반복마다 changed를 false로 초기화
			
			for(int j=0; j<arr.length-1-i; j++)
			{
				if(arr[j] > arr[j+1])     // 옆의 값이 작으면 서로 바꾼다.
				{
					int tmp = arr[j];
					arr[j] = arr[j+1];                                                                     
					arr[j+1] = tmp;
					change = true;       // 자리바꿈이 발생했으니 changed를 true로 바꾼다.
				}
			}
			
			if(!change) break;  // 자리바꿈이 없으면 정렬이 다 된상태이므로 반복문을 벗어나 불필요한 비교를 더 이상 하지 않는다.
		}
	}
}
