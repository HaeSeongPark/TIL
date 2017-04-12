package ch9_lang_util;

public class ShallowDeepCopy {

	public static void main(String[] args) {
		Circle c1 = new Circle(new Point(1,1),20);
		Circle c2 = c1.shallowCopy();
		Circle c3 = c1.deepCopy();
		
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		
		c1.p.x = 9;
		c1.p.y = 9;
		
		System.out.println("º¯°æ ÈÄ");
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
	}

}
