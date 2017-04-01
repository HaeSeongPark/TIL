package ch9_Exercise;

import java.util.StringTokenizer;

public class Ch9_9 {
	public static String delChar(String src, String delCh) {
		
		StringTokenizer st = new StringTokenizer(src,delCh);
		
		StringBuffer sb = new StringBuffer(src.length());  // src.length() + 16 ³Ë³ËÈ÷¸¸µë
		
		while(st.hasMoreTokens())
			sb.append(st.nextToken());  // ÅäÅ«À¸·Î Àß¶ó¼­ Ãß°¡
		return sb.toString();
		
//		for(int i=0; i < src.length(); i++){
//			char ch = src.charAt(i);
//			
//			if(delCh.indexOf(ch) == -1)
//				sb.append(ch);
//		}
//		return sb.toString();
	}
	public static void main(String[] args){
		System.out.println("(1!2@3^4~5)" + " -> " + delChar("(1!2@3^4~5)", "~!@#$%^&*()"));
		System.out.println("(1 2     3   4   \t 5) "+ "->" + delChar("(1 2     3   4   \t 5)"," \t"));
	}
}
