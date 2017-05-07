package ch10_data_time_formatting;

import java.text.*;

public class MessageFormatEx1 {
	public static void main(String[] args) {
		String msg = "Name: {0} \nTel:{1} \nAge:{2} \nBirthday:{3}";
		Object[] arguments = {
				"ÀÌÁö¹Ù", "02-555-5555", "20", "08-09"
		};
		
		String result = MessageFormat.format(msg, arguments);
		System.out.println(result);
	}
}
