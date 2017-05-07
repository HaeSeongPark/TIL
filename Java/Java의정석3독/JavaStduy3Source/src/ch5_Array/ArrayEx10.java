package ch5_Array;

public class ArrayEx10 {
	public static void main(String[] args) {
		int[] numArr = new int[10];
		
		for(int i=0; i<numArr.length; i++)
			System.out.print(numArr[i] = (int)(Math.random()*10));
		System.out.println();
		
		int length = numArr.length;
		for(int i=0; i<length-1; i++)
		{
			boolean changed = false;
			for(int j=0; j<length-1-i; j++){
				if(numArr[j]>numArr[j+1]){
					int tmp = numArr[j];
					numArr[j] = numArr[j+1];
					numArr[j+1] = tmp;
					changed = true;
				}
			}
			if(changed == false) break;
			
			for(int k=0; k<numArr.length;k++)
				System.out.print(numArr[k]); // 정렬된 결과를 출력한다.
			System.out.println();
		}
	}
}
