package ch2_3;

public class Term
{
	private int coef; //계수
	private final int expo; // 차수
	
	public Term(int c, int e)
	{
		coef = c;
		expo = e;
	}
	
	public int getCoef()
	{
		return coef;
	}

	public void setCoef(int coef)
	{
		this.coef = coef;
	}

	public int getExpo()
	{
		return expo;
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
