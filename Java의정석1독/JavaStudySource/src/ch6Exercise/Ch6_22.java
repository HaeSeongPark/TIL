package ch6Exercise;

public class Ch6_22 {
	static boolean isNumber(String str)
	{	
		boolean result = true;
		if(str==null || str.equals(""))
			result = false;
		
		for(int i=0; i<str.length(); i++)
		{	
			char ch = str.charAt(i);
			if(ch < '0' || ch > '9')
			{
				result = false;
			}
		}
		return result;
	}
	public static void main(String[] args) {
		String str = "123";
		System.out.println(str+"는 숫자입니까?"+isNumber(str));
		
		str = "1234o";
		System.out.println(str+"는 숫자입니까?"+isNumber(str));
	}


}
