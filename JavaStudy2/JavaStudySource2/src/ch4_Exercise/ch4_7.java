package ch4_Exercise;

/*
 * Math.random()을 이용해서 1부터 6사이의 임의의 정수를 변수 value에 저장하는 코드를 완성
 */

public class ch4_7 {
	public static void main(String[] args) {
		int value = (int)(Math.random()*5) + 1;
		System.out.println("value:"+value);
	}
}
