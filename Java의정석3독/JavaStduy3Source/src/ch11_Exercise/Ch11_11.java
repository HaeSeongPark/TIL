package ch11_Exercise;

import java.util.*;

class SutdaCard
{
	int num;
	boolean isKwang;
	
	SutdaCard()
	{
		this(1, true);
	}

	public SutdaCard(int num, boolean isKwang)
	{
		super();
		this.num = num;
		this.isKwang = isKwang;
	}
	
	public boolean equals(Object obj)
	{
		if(obj instanceof SutdaCard)
		{
			SutdaCard c = (SutdaCard)obj;
			return num == c.num && isKwang == c.isKwang;
		}
		else
		{
			return false;
		}
	}
	
	public String toString()
	{
		return num + (isKwang ? "K" : "");
	}
	
	@Override
	public int hashCode()
	{
		return Objects.hash(num,isKwang);
	}
}

public class Ch11_11
{
	public static void main(String [] args)
	{
		SutdaCard c1 = new SutdaCard(3, true);
		SutdaCard c2 = new SutdaCard(3, true);
		SutdaCard c3 = new SutdaCard(1, true);
		
		HashSet<SutdaCard> set = new HashSet<SutdaCard>();
		set.add(c1);
		set.add(c2);
		set.add(c3);
		System.out.println(set);
	}
}
