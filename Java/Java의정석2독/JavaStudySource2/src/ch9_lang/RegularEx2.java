package ch9_lang;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegularEx2 {
	public static void main(String[] args) {
		String[] data = {"bat", "baby", "bonus", "c", "cA",
		        "ca", "co", "c.", "c0", "c#",
			"car","combat","count", "date", "disc"
				};
		String[] pattern = {".*","c[a-z]*","c[a-z]", "c[a-zA-Z]",
                "c[a-zA-Z0-9]","c.","c.*","c\\.","c\\w",
                "c\\d","c.*t", "[b|c].*", ".*a.*", ".*a.+",
                "[b|c].{2}"
               };
		
		for(int i=0; i<pattern.length; i++){
			Pattern p = Pattern.compile(pattern[i]);
			System.out.print(" Pattern : " + pattern[i] + " °á°ú : ");
			for(int j=0; j<data.length; j++){
				Matcher matcher = p.matcher(data[j]);
				if(matcher.matches())
					System.out.print(data[j]+ ",");
			}
			System.out.println();
		}

	}
}
