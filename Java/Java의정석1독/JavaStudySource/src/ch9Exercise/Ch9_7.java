package ch9Exercise;

public class Ch9_7 {
	public static boolean contains(String src, String target){
		if(src == null && src.length() == 0)
			return false;
		
		return src.contains(target);
//		return src.indexOf(target)!=-1;
	}

	public static void main(String[] args) {
		System.out.println(contains("12345","23"));
		System.out.println(contains("12345","67"));
	}

}
