package ch6_Exercise;

public class Ch6_22 {
	
	static boolean isNumber(String str){
		if(str == null || str.equals(""))
			return false;
		for(int i=0, length=str.length(); i<length; i++){
			char check = str.charAt(i);
			if(!('0'<= check && check <='9'))
				return false;
		}
		return true;
	}
	public static void main(String[] args) {
		String str = "123";
		System.out.println(str+"는 숫자입니까? "+isNumber(str));
		
		str = "1234o";
		System.out.println(str+"는 숫자입니까? "+isNumber(str));

	}
}
