package ch2_2_2;

public class Term
{
	public int coef; //계수
	public int expo; // 차수
	
	public Term(int c, int e)
	{
		coef = c;
		expo = e;
	}
	
	public  void printTerm()
	{	 //2.  +-1x^2   ---> -x^2 계선
		System.out.print(coef + "x^" + expo);
	}
	
	public int calcTerm(int x)
	{
		return (int)(coef * Math.pow(x , expo));
	}
}
