package ch9;

import java.util.regex.*;

public class RegularEx2 {
	public static void main(String[] args) {
		String[] data = {"bat","baby","bonus","cA","ca","co","c.","c0",
						 "car","combat","count","date","disc"};
		String[] pattern = {".*","c[a-z]*","c[a-z]","c[a-zA-Z]","c[a-zA-z0-9]"
							,"c.","c.*","c\\.","c\\w","c\\d","c.*t","[b|c].*",
							".*a.*",".*a.+","[b|c].{2}"
						  };
		
		for(int i=0; i<pattern.length; i++){
			Pattern p = Pattern.compile(pattern[i]);
			System.out.print("Pattern : " +pattern[i]+ " °á°ú : ");
			for(int j=0; j<data.length; j++)
			{
				Matcher m = p.matcher(data[j]);
				if(m.matches())
					System.out.print(data[j]+" | ");
			}
			System.out.println();
		}
		
	}
}
