package ch5_array_Exercise;

public class ch5_10 {
	public static void main(String[] args) {
		char[] abcCode = {
				'`','~','!','@','#','$','%','^','&','*',
				'(', ')', '-', '_','+','=','|','[',']','{',
				'}',';',':',',','.','/'
		};
		
		char[] numCode = {'q','w','e','r','t','y','u','i','o','p'};
		
		String src = "abc123";
		String result = "";
		
		// ���ڿ� src�� ���ڸ� charAt()���� �ϳ��� ��� ��ȯ �� result�� ����
		for(int i=0; i < src.length(); i++){
			char ch = src.charAt(i);
			
			if('0'<=ch && ch<='9') result += numCode[ch-'0'];
			else result += abcCode[ch-'a'];
		}
		
		System.out.println("src:"+src);
		System.out.println("result:"+result);
		
	}
}