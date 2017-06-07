package ch14_primitive_reference_array;

public class StringArrayTest
{
	public static void main(String [] args)
	{
//		String[] stringArray = new String[3];
//		stringArray[0] = "hello";
//		System.out.println(stringArray[0]);
//		
//		int[] array = new int[]{5,10,15};
//		for ( int i : array )
//		{
//			System.out.println(i);
//		}
		
//		 * 자바에서 2차원 배열은 없다. 1차원배열을 가리키는 1차원 배열
		 int[][] array = new int[3][2];
		 // array변수가 참조하는 배열의 길이
		 System.out.println(array.length);
		 // array[0] 변수가 참조하는 배열의 길이
		 System.out.println(array[0].length);
		 
		 int[][] array2 = new int[3][];
		 array2[0] = new int[2];
		 array2[1] = new int[3];
		 array2[2] = new int[4];
		 
		 System.out.println("----------------------");
		 int[][] array3 = new int[][] { {1,2}, {1,2,3}, {1,2,3,4}};
		 for(int i=0; i<array3.length; i++)
		 {
			 for(int k=0; k<array3[i].length; k++)
			 {
				 System.out.print(array3[i][k] + "\t");
			 }
			 System.out.println();
		 }
	}
}
