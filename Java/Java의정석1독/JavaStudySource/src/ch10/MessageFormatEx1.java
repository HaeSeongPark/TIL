package ch10;

import java.text.MessageFormat;

public class MessageFormatEx1 {

	public static void main(String[] args) {
		String msg = "Name: {0} \nTel: {1} \nAge: {2} \nBirthday: {3}";
		
		Object[] arguments = { "이지바","02-123-1234", "27", "07-09"};
		
		String result = MessageFormat.format(msg, arguments);
		
		System.out.println(result);
	}
/*
 * 		Name: 이지바 
		Tel: 02-123-1234 
		Age: 27 
		Birthday: 07-09

 */
}
