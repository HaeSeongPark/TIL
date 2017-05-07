package ch_14_Lambda_Stream;


public class Tmp 
{
	
	String caesar(String s, int n) 
	{
		StringBuilder result = new StringBuilder(n);
		
		for(int i=0, length=s.length(); i<length;i++)
		{
			char tmp = s.charAt(i);
			if(tmp!=' ')
			{ // 공백아닌 것
				char plus = (char)(tmp + n%26);
				if('a'<=tmp && tmp <='z') // 소문자
				{	
					if( plus > 'z')
						result.append((char)('a'+(plus-'z')-1));
					else
						result.append(plus);
				}
				else // 대문자
				{
					if( plus > 'Z')
						result.append((char)('A'+(plus-'Z')-1));
					else
						result.append(plus);
				}
			} 
			else
			{
				result.append(tmp);
			}
		}
		return result.toString();
		
//	        String result = "";
//	    n = n % 26;
//	    for (int i = 0; i < s.length(); i++) {
//	      char ch = s.charAt(i);
//	      if (Character.isLowerCase(ch)) {
//	        ch = (char) ((ch - 'a' + n) % 26 + 'a');
//	      } else if (Character.isUpperCase(ch)) {
//	        ch = (char) ((ch - 'A' + n) % 26 + 'A');
//	      }
//	      result += ch;
//	    }
//	        return result;
//	    }
		/*
		 *   return s.chars().map(c -> {
            int n = _n % 26;
            if (c >= 'a' && c <= 'z') {
                return 'a' + (c - 'a' + n) % 26;
            } else if (c >= 'A' && c <= 'Z') {
                return 'A' + (c - 'A' + n) % 26;
            } else {
                return c;
            }
        }).mapToObj(c -> String.valueOf((char)c))
        .reduce((a, b) -> a + b).orElse("");
    }
		 */
	}
	public static void main(String[] args)
	{
		Tmp c = new Tmp();
		System.out.println("s는 'a B z', n은 4인 경우: " + c.caesar("a B z", 4));
	}
}
