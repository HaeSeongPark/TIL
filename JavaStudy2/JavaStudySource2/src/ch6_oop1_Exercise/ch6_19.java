package ch6_oop1_Exercise;

public class ch6_19 {
	
	public static void change(String str){
		str += "456";
	}
	public static void main(String[] args) {
		String str = "ABC123";
		System.out.println(str); // ABC123
		change(str);
		System.out.println("After change:"+str);  // ABC123
		
		/*
		 * String�� �������� �̱� ������ 
		 * ���ڿ� ������ ������ �� ����
		 * ���������� �ϸ� ���մ� ���ڿ��� ������.
		 */
	}
}