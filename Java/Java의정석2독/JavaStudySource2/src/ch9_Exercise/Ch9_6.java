package ch9_Exercise;

import java.util.Arrays;

public class Ch9_6 {
	public static void main(String[] args) {
		String src = "12345";
		System.out.println(fillZero(src,10));
		System.out.println(fillZero(src,-1));
		System.out.println(fillZero(src,3));
	}
	public static String fillZero(String src, int length){
		//1. src가 널이거나 src.length()가 length와 같으면 src를 그대로 반환한다.
		if(src==null || src.length() == length) {
			return src;
		//2. length의 값이 0보다 같거나 작으면 빈 문자열("")을 반환한다
	    } else if(length <= 0 ){
	    	return "";
		//3. src의 길이가 length의 값보다 크면 src를 length만큼 잘라서 반환
	    } else if(src.length() > length) {
			return src.substring(0, length);
	    }
		
//		//4. 길이가 length인 char배열을 생성한다.
//		char[] c = new char[length];
//		
//		//5. 4에서 생성한 char배열을 '0'으로 채운다.
//		Arrays.fill(c, '0');
//		
//		//6. src에서 문자배열을 뽑아내서 4에서 생성한 배열에 복사한다.
//		int len = src.toCharArray().length;
//		System.arraycopy(src.toCharArray(), 0, c, length - len, len);
//			
//		return String.valueOf(c);
		// 포맷사용 5줄 -> 2줄
		int srcInt = Integer.parseInt(src);
		return String.format("%0"+length+"d",srcInt);
	}
}
