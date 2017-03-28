package ch9_lang;

public class EqualsEx1 {
	public static void main(String[] args) {
		Value v1 = new Value(10);
		Value v2 = new Value(10);
		
		System.out.println("v1.equls(v2) : " + v1.equals(v2));
		System.out.println("v1==v2 : " + (v1==v2));
		
		v2 = v1;
		
		System.out.println("v2 = v1 ÈÄ");
		
		System.out.println("v1.equls(v2) : " + v1.equals(v2));
		System.out.println("v1==v2 : " + (v1==v2));
		
	}
}

class Value{
	int value;
	
	Value(int value){
		this.value = value;
	}
}