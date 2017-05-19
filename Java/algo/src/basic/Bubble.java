package basic;


public class Bubble {
	public static void main(String[] args) {
		int[] numArr = {4,3,8,3,1,7,8,4,9,1 };

//		for (int i = 0; i < numArr.length; i++) {
//			System.out.print(numArr[i] = (int) (Math.random() * 10));
//		}
		
		
		System.out.println();

		for (int i = 0; i < numArr.length - 1; i++) {
			boolean changed = false; // 자리 바꿈이 발생했는지 체크한다.
			for (int j = 0; j < numArr.length - 1 - i; j++) {
				if (numArr[j] > numArr[j + 1]) {
					int temp = numArr[j];
					numArr[j] = numArr[j + 1];
					numArr[j + 1] = temp;
					changed = true;
				}
			}
			if (changed == false) // !changed
				break;

			for (int k = 0; k < numArr.length; k++)
				System.out.print(numArr[k]);
			System.out.println();
		}
	}
}
