package ch5_array;

public class ArrayEx13 {
	public static void main(String[] args) {
		char[] hex = { 'C', 'A', 'F', 'E'};

		
		String[] binary = { "0000", "0001", "0010", "0011"
						   ,"0100", "0101", "0110", "0111"
						   ,"1000", "1001", "1010", "1011"
						   ,"1100", "1101", "1110", "1111"};
		
		String result="";
		
		for(int i=0; i < hex.length; i++){
			if('0'<= hex[i] && hex[i] <= '9')
				result += binary[hex[i]-'0'];
			else if ('A' <= hex[i] && hex[i] <= 'Z')
				result += binary[hex[i]-'A'+10];
		}
		System.out.println(new String(hex));  // String(char[] value)
		System.out.println(result);
		
	}
}
