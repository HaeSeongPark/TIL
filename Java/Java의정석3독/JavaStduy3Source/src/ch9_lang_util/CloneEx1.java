package ch9_lang_util;

public class CloneEx1 {
	public static void main(String[] args) {
		Point original = new Point(3,5);
		Point clone = original.clone();
		System.out.println(original);
		System.out.println(clone);
	}
}
