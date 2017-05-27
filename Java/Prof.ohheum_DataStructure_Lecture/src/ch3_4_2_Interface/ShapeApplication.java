package ch3_4_2_Interface;

import java.util.Arrays;
import java.util.Scanner;

public class ShapeApplication
{
	private static final int INITIAL_CAPACITY = 100;
	private int capacity = INITIAL_CAPACITY;
	private int n = 0;
	private Shape[] shapes = new Shape[capacity];
	private Scanner s = new Scanner(System.in);
	
	public static void main(String [] args)
	{
		ShapeApplication app = new ShapeApplication();
		app.processCommand();
	}

	private void processCommand()
	{
		while(true)
		{
			System.out.print("$ ");
			String command = s.next();
			if(command.equals("add"))
				handleAdd();
			else if(command.equals("show") || command.equals("showdetail"))
				handleShow(command.equals("showdetail"));
			else if(command.equals("sort"))
				Arrays.sort(shapes,0,n);
			else if(command.equals("exit"))
				break;
		}
		s.close();
	}

	private void handleShow(boolean isShowDetail)
	{
		for(int i=0; i<n; i++)
		{
			System.out.println(shapes[i]);
			if(isShowDetail)
			{
				System.out.println("  -area : " + shapes[i].computeArea());
				System.out.println("  -perimeter : " + shapes[i].computePerimeter());
			}
		}
	}

	private void handleAdd()
	{
		String type = s.next();
		switch ( type )
		{
			case "R" :
				addShape(new Rectangle(s.nextInt() , s.nextInt()));
				break;
			case "C" :
				addShape(new Circle(s.nextInt()));
				break;
			case "T" :
				addShape(new RtTriangle(s.nextInt() , s.nextInt()));
				break;
			default :
				break;
		}
	}

	private void addShape(Shape s)
	{
		if(n>=capacity)
			reallocate();
		shapes[n++] = s;
	}

	private void reallocate()
	{
		Shape[] tmp = new Shape[capacity*=2];
		System.arraycopy(shapes, 0, tmp, 0 , shapes.length);
		shapes = tmp;
	}
}
