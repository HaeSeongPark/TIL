package ch2_2_PolyPoint;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Code10
{
	public static void main(String [] args)
	{
		try
		{
			Scanner s = new Scanner(new File("PolyPointData.txt"));
			int n = s.nextInt();
			OrthoPolygon thePolygon = new OrthoPolygon(n);
			for(int i=0; i<n; i++)
			{
				thePolygon.addVertex(s.nextInt() , s.nextInt());
			}
			Point target = new Point(s.nextInt() , s.nextInt());
			s.close();
			
			if(thePolygon.contains(target))
				System.out.println("yes");
			else
				System.out.println("no");
			
		}
		catch ( FileNotFoundException e )
		{
			System.out.println("no file");
			System.exit(0);
		}
	}
}
