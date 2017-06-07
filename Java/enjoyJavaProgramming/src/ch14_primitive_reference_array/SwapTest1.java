package ch14_primitive_reference_array;

public class SwapTest1
{
	public static void main(String [] args)
	{
		int x = 5;
		int y = 10;
		System.out.printf("스왑전 , x : %d, y : %d\n",x,y);
		swap(x,y);
		System.out.printf("스왑후 , x : %d, y : %d\n",x,y);
	}
	
	public static void swap(int x, int y)
	{
		int tmp = x;
		x = y;
		y = tmp;
		System.out.printf("스왑메서드 안에서, x : %d, y : %d\n",x,y);
	}
}
