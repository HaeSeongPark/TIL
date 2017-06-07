package ch14_primitive_reference_array;

public class SwapTest2
{
	public static void main(String [] args)
	{
		Data d = new Data();
		d.x = 5;
		d.y = 10;
		swap(d);
		System.out.println(d.x +", "+d.y);
	}
	
	public static void swap(Data d)
	{
		int tmp = d.x;
		d.x = d.y;
		d.y = tmp;
	}
}

class Data{
	int x;
	int y;
}
