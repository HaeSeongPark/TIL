package ch9_Exercise;

import java.util.Arrays;

public class Ch9_10 {
	public static String format(String str, int length, int alignment){
		int diff = length - str.length();
		if(diff < 0 ) return str.substring(0, length);
		
		char[] source = str.toCharArray();
		char[] result = new char[length];
		
		Arrays.fill(result, ' ');
		
		switch(alignment){
		case 0:
		default:
			System.arraycopy(source, 0, result, 0, source.length);
			break;
		case 1:
			System.arraycopy(source, 0, result, diff/2 ,source.length );
			break;
		case 2:
			System.arraycopy(source, 0, result, diff, source.length);
			break;

		}
		
		return new String(result);
//		if(length < str.length()) return str.substring(0, length);
//		else{
//			char[] c = new char[length];
//			Arrays.fill(c, ' ');
//			
//			if(alignment==0){
//				System.arraycopy(str.toCharArray(), 0, c, 0, str.length());
//				return new String(c);
//			} else if(alignment==1){
//				System.arraycopy(str.toCharArray(), 0, c, length/str.length(), str.length());
//				return new String(c);
//			} else{
//				System.arraycopy(str.toCharArray(), 0, c, length-str.length(), str.length());
//				return new String(c);
//			}
//
//		}
	}
	public static void main(String[] args) {
		String str = "가나다";
		
		System.out.println(format(str,7,0)); // 왼쪽정렬
		System.out.println(format(str,7,1)); // 가운데정렬
		System.out.println(format(str,7,2)); // 오른쪽정렬
	}
}
