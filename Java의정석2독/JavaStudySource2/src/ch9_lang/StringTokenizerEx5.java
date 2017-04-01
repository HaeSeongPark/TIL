package ch9_lang;

import java.util.StringTokenizer;

public class StringTokenizerEx5 {
	public static void main(String[] args) {
		String data = "100,,,2000,300";
		String[] result = data.split(",");
		StringTokenizer st = new StringTokenizer(data,",");
		
		for(int i=0; i<result.length; i++)
			System.out.print(result[i] + "|");
		System.out.println("개수 : " + result.length);
		
//		int i=0;
//		
//		for(;st.hasMoreTokens();i++)
//			System.out.print(st.nextToken() + "|");
//		
//		System.out.println("개수 : " + st.countTokens());
		
		int count = st.countTokens();
		while(st.hasMoreTokens()){
			System.out.print(st.nextToken() + "|");
		}
		System.out.println("개수 : " + count);
		
	}
}
