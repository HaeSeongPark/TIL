package ch3_1;

public class Test
{
	public static void main(String [] args)
	{
		Computer computer = new Computer("Acme" , "Intel" , 2 , 160 , 2.4);
		
		Notebook notebook = new Notebook("DellGate", "AMD", 4, 240, 1.8, 15.0, 7.5);
		
		System.out.println(computer);
		System.out.println(notebook);
		
		Computer theComputer = new Notebook("DellGate", "AMD", 4, 240, 1.8, 15.0, 7.5);
		System.out.println(theComputer);
	}
}
