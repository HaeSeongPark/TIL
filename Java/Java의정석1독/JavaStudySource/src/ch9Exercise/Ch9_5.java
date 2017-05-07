package ch9Exercise;

public class Ch9_5 {
	public static int count(String src, String target){
		int count = 0;
		int pos = 0;
		int index = 0;
		
		if(src == null && src.length() ==0)
			return 0;
		
		while( (index = src.indexOf(target,pos))!=-1){
			count++;
			pos = index + target.length();
		}	
		
		return count;
	}
	
	public static void main(String[] args) {
		System.out.println(count("12345AB12AB345AB","AB"));
		System.out.println(count("12345","AB"));
	}
}
