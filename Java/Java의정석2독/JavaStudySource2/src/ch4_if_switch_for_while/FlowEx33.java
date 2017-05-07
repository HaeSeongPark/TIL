package ch4_if_switch_for_while;

public class FlowEx33 
{
	public static void main(String[] args) 
	{
		Loop1 : for (int i=2; i<=9; i++)
		{
			for(int j=1; j<=9; j++)
			{
				if(j==5)
					break Loop1;  // -> 1
//					break;  // -> 2
//					continue Loop1;  // ->3
//					continue;  // ->4
				System.out.println(i+"*"+j+"="+i*j);
			} // 4
			// 2
			System.out.println();
		} // 3
		// 1
	}
}
