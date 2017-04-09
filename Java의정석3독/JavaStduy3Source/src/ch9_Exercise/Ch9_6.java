package ch9_Exercise;

import java.util.Arrays;

public class Ch9_6 {
	public static String fillZero(String src, int length){
		if(src==null || src.length()==length)
			return src;
		if(length <= 0)
			return "";
		if(src.length() > length)
			return src.substring(0, length);
		
		char[] tmp = new char[length];
		Arrays.fill(tmp, '0');
		System.arraycopy(src.toCharArray(), 0, tmp, length-src.length(), src.length());
//		return new String(tmp);
		return String.valueOf(tmp);
			
//		return String.format("%0"+length+"d", Integer.valueOf(src));
	}
	public static void main(String[] args) {
		String src = "12345";
		System.out.println(fillZero(src,10));
		System.out.println(fillZero(src,-1));
		System.out.println(fillZero(src,3));
	}
}
