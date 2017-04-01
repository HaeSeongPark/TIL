package ch6_oop1;

class Data1{
	int vlaue;
}

class Data2{
	int value;
	
	Data2(int x){
		value = x;
	}
}

public class ConstructorTest {
	public static void main(String[] args) {
		Data1 d1 = new Data1();
//		Data2 d2 = new Data2(); // compile error ¹ß»ý
	}
}
