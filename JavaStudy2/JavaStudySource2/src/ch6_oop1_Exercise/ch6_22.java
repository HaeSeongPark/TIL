package ch6_oop1_Exercise;

public class ch6_22 {
	
	static boolean isNumber(String s){
		if(s==null || s.equals(""))
			return false;
		
		for(int i=0; i<s.length(); i++){
			char ch = s.charAt(i);
			
			if(ch<'0' || ch>'9')
				return false;
		}
		
		return true;
		
//		boolean result = false;
//		for(int i=0; i<s.length(); i++){
//			if('0' <= s.charAt(i) && s.charAt(i) <= '9')
//				result = true;
//			else
//				result = false;
//		}
//		return result;
	}

	public static void main(String[] args) {
		String str = "123";
		System.out.println(str+"는 숫자입니까? " + isNumber(str));
		
		str = "1234o";
		System.out.println(str+"는 숫자입니까? " + isNumber(str));
	}

}
