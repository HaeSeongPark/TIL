package ch9_Exercise;

public class Ch9_5 {
	public static int count(String src, String target){
		int count = 0;
		int pos = 0;
		int targetLength = target.length();
		
		
		while((pos = src.indexOf(target, pos))!=-1){
			count++;
			pos += targetLength;
		}
		return count;
	}
	public static void main(String[] args) {
		System.out.println(count("12345AB12AB345AB","AB"));
		System.out.println(count("12345","AB"));
	}
}
