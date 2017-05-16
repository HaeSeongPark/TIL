package main;

import drawable.GroupDrawable;
import drawable.Image;
import drawable.ImageDrawable;
import drawable.ShapeDrawable;
import shape.BadPointException;
import shape.Rectangle;
import shape.Shape;
import shape.ShapeFactory;

public class Main
{
	public static final int SHAPE_COUNT = 10;
	Shape [] shapes;

	public Main()
	{
		shapes = new Shape [SHAPE_COUNT];
		for ( int i = 0; i < shapes.length; i++ )
		{
			try
			{
				shapes[i] = ShapeFactory.createShape();
			}
			catch ( BadPointException e )
			{
				e.printStackTrace();
				try
				{
					shapes[i] = new Rectangle();
				}
				catch ( BadPointException e1 )
				{
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
		Game g = new Game();
		GroupDrawable<ShapeDrawable> group = new GroupDrawable<>();

		try
		{
			ShapeDrawable sd = new ShapeDrawable();
			sd.setShape(ShapeFactory.createShape());
			g.setDrawable(sd);
		}
		catch ( BadPointException e )
		{
			e.printStackTrace();
		}

		for ( Shape s : shapes )
		{
			ShapeDrawable sd = new ShapeDrawable();
			sd.setShape(s);
			// g.setDrawable(sd);
			group.addChild(sd);
		}
		g.setDrawable(group);

		Image i = new Image();
		ImageDrawable id = new ImageDrawable();
		id.setImage(i);

		g.setDrawable(id);

		MoveRunnable moveRunnable = new MoveRunnable();
		moveRunnable.setGame(g);
		moveRunnable.start();
	}

	public void printSumArea()
	{
		int sum = 0;
		for ( int i = 0; i < shapes.length; i++ )
			sum += shapes[i].calculateArea();
		System.out.println("Sum : " + sum);
	}

	public void printShapes()
	{
		System.out.println("Shapes[" + shapes.length + "]");
		for ( int i = 0; i < shapes.length; i++ )
			System.out.println(shapes[i]);
	}

	public static void main(String [] args)
	{
		Main main = new Main();
		main.printShapes();
		main.printSumArea();
	}
}