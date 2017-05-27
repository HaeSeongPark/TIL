package ch3_4;

import java.util.Arrays;
import java.util.Scanner;
/*
 * 날짜 유형성검사(형식, duration begin end 비교)
 * 날짜 자바 라이브러리 time이나 Date나 Calendar 사용
 * 
 */

public class Scheduler
{
	public int capacity = 10;
	Event [] events = new Event [capacity];
	int n;
	Scanner scanner;

	public static void main(String [] args)
	{
		Scheduler scheduler = new Scheduler();
		scheduler.processCommand();
	}

	private void processCommand()
	{
		scanner = new Scanner(System.in);
		while ( true )
		{
			System.out.print("$ ");
			String command = scanner.next();
			if ( command.equalsIgnoreCase("addevent") )
			{
				String type = scanner.next();
				if ( type.equals("oneday") )
				{
					handleOneDay();
				}
				else if ( type.equals("duration") )
				{
					handleDuration();
				}
				else if ( type.equals("deadline") )
				{
					handleDeadline();
				}
			}
			else if ( command.equalsIgnoreCase("list") )
			{
				handleList();
			}
			else if ( command.equalsIgnoreCase("show") )
			{
				handleShow();
			}
			else if ( command.equalsIgnoreCase("sort") )
			{
				Arrays.sort(events,0,n);
			}
			else if ( command.equalsIgnoreCase("exit") )
			{
				break;
			}
		}

		scanner.close();
	}

	private void handleDeadline()
	{
		scanner.nextLine();
		System.out.print("   title : ");
		String title = scanner.nextLine();
		System.out.print("   until : ");
		String until = scanner.next();

		DeadlinedEvent e = new DeadlinedEvent(title , paresDate(until));
		addEvent(e);
	}

	private void handleDuration()
	{
		scanner.nextLine();
		System.out.print("   title : ");
		String title = scanner.nextLine();
		System.out.print("   begin : ");
		String begin = scanner.next();
		System.out.print("   end : ");
		String end = scanner.next();

		DurationEvent e = new DurationEvent(title , paresDate(begin) , paresDate(end));
		addEvent(e);
	}

	private void handleOneDay()
	{
		scanner.nextLine();
		System.out.print("   title : ");
		String title = scanner.nextLine();
		System.out.print("   when : ");
		String date = scanner.next();

		OneDayEvent oneDayEvent = new OneDayEvent(title , paresDate(date));
		addEvent(oneDayEvent);
	}

	private void addEvent(Event e)
	{
		if ( n >= capacity )
		{
			reallocate();
		}
		events[n++] = e;
	}

	private void reallocate()
	{
		Event[] tmp = new Event[capacity*=2];
		for(int i=0; i<n; i++)
			tmp[i] = events[i];
		events = tmp;
	}

	private MyDate paresDate(String date)
	{
		String [] tokens = date.split("/");
		int year = Integer.parseInt(tokens[0]);
		int month = Integer.parseInt(tokens[1]);
		int day = Integer.parseInt(tokens[2]);

		return new MyDate(year , month , day);
	}

	private void handleShow()
	{
		String inputDate = scanner.next();
		for(int i=0; i<n; i++)
		{
			if(events[i].isRelevant(paresDate(inputDate)))
				System.out.println(events[i]);
		}
	}

	private void handleList()
	{
		for(int i=0; i<n; i++)
			System.out.println("  " + events[i]);
	}
}
