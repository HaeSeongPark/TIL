package ch9_Exercise;

import java.util.Arrays;

public class Ch9_10 {
	public static String format(String str, int length, int aligment){
		// length의 값이 str의 길이보다 작으면 length만큼만 잘라서 반환
		
		int diff = length - str.length();
		
		if( diff < 0){
			return str.substring(0, length);
		} else {
			int strLen = str.length();
			char[] srtCharArray = str.toCharArray();
			
			// 1의 경우가 아니면, length크기의 char배열을 생성하고 공백으로채운다.
			char[] c = new char[length];
			
			// 정렬 조건에 따라 문자열(str)을 복사할 위치를 결정한다. (System.arrycopy()사용)
			if(aligment == 0) // 왼쪽정렬
				System.arraycopy(srtCharArray, 0, c, 0, strLen);
			else if(aligment == 1)  // 가운데 정렬
				System.arraycopy(srtCharArray, 0, c, diff/2, strLen);
			else if(aligment ==2)  // 오른쪽 정렬
				System.arraycopy(srtCharArray, 0, c, diff, strLen);

			return String.valueOf(c);
		}
	}
	
	public static void main(String[] args) {
		String str = "가나다";
		
		System.out.println(format(str,7,0)); // 왼쪽 정렬
		System.out.println(format(str,7,1)); // 가운데 정렬
		System.out.println(format(str,7,2)); // 오른쪽 정렬
	}
}
