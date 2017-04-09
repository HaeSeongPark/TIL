package ch9_Exercise;

import java.util.StringTokenizer;

public class Ch9_9 {
	public static String delChar(String src, String delCh){
//		StringBuffer sb = new StringBuffer();
//		for(int i=0; i<src.length(); i++){
//			char c = src.charAt(i);
//			if(delCh.indexOf(c)==-1)
//				sb.append(c);
//		}
//		return sb.toString();
		
		StringTokenizer st = new StringTokenizer(src,delCh);
		StringBuffer sb = new StringBuffer();
		while(st.hasMoreTokens()){
			sb.append(st.nextToken());
		}
		return sb.toString();
	}
	public static void main(String[] args) {
		System.out.println("(1!2@3%4~5)" + "-> " + delChar("(1!2@3%4~5)","~!@#$%^&*()"));
		System.out.println("(1 2      3    4 \t5)" + "->" + delChar("(1 2      3    4 \t5)"," \t"));
	}
}
