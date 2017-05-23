package ch2_1;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// 사각형 면적 작은 것부터 큰 것 순으로 출력
public class Code05
{
	public static Rectangle[] rects = new Rectangle[100];
	public static int n;
	
	public static void main(String [] args)
	{
		try
		{
			Scanner s = new Scanner(new File("rect.txt"));
			while(s.hasNext())
			{
				rects[n] = new Rectangle();
				rects[n].p = new Point();
				rects[n].p.x = s.nextInt();
				rects[n].p.y = s.nextInt();
				rects[n].width = s.nextInt();
				rects[n++].height = s.nextInt();
			}
			s.close();
		}
		catch ( FileNotFoundException e )
		{
			System.out.println("no file");
			System.exit(0);
		}
		
		bubbleSort();
		
		for(int i=0; i<n;i++)
			System.out.println(rects[i].toString());
	}

	private static void bubbleSort()
	{
		for(int i=n-1; i>0 ;i--)
		{
			for(int j=0; j<i; j++)
			{
				if(rects[j].getArea() > rects[j+1].getArea() )
				{
					Rectangle tmp = rects[j];
					rects[j] = rects[j+1];
					rects[j+1] = tmp;
				}
			}
		}
	}

}
