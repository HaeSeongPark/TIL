package ch3_operator_Excercise;

/*
 * 아래의 코드는 사과를 담는데 필요한 바구니의 수를 구하는 코드
 * 만일 사과의 수가 123개이고 하나의 바구니에는 10개의 사과를 담을 수 있다면, 13개의 바구니가 필요
 */
public class ch3_2 {
	public static void main(String[] args) {
		int numOfApples = 123;
		int sizeOfBucket = 10;
		int numOfBucket = (numOfApples/sizeOfBucket) + ((numOfApples%sizeOfBucket == 0) ? 0 : 1);
		
		System.out.println("필요한 바구니의 수 : " + numOfBucket);
	}
}
