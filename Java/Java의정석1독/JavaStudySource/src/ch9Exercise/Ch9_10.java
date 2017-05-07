package ch9Exercise;

public class Ch9_10 {

	public static String format(String str, int length, int alignment)
	{
		//1 length의 값이 str의 길이보다 작으면 length만큼만 잘라서 반환
		int diff = length - str.length();
		if(diff<0) return str.substring(0, length);
		
		//1의 경우가 아니면, length크기의 char배열을 생성하고 공백으로 채운다.
		char [] source = str.toCharArray();  // 문자열을 char배열로 변환
		char[] result = new char[length];
		for(int i=0; i<result.length; i++)
			result[i]=' ';
		
		switch(alignment){
			case 0:
			default:
				System.arraycopy(source,0, result, 0, source.length);
				break;
			case 1:
				System.arraycopy(source,0, result, diff/2, source.length);
				break;
			case 2:
				System.arraycopy(source,0, result, diff, source.length);
				break;
		}
		return new String(result);
	}
	public static void main(String[] args) {
		String str = "가나다";
		
		System.out.println(format(str,7,0));
		System.out.println(format(str,7,1));
		System.out.println(format(str,7,2));
	}

}
