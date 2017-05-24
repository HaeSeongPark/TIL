package ch2_2_2;

import java.util.Scanner;
import jdk.management.resource.internal.inst.SocketOutputStreamRMHooks;
/* 개선할 점 3개
 * 1 .arrayList와 linkedlist 사용해서 개선
 * taskset도하고
 */

public class Code08
{
	static Polynomial[] polynomial = new Polynomial[100];
	static int n;
	
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		while ( true )
		{
			System.out.print("$ ");
			String command = s.next();
			if ( command.equalsIgnoreCase("create") )
			{
				char name = s.next().charAt(0);
				int index = findPolynomialName(name);
				if(index==-1) // 기존에 없으면 생성
				{
					polynomial[n] = new Polynomial(name);
					n++;
					System.out.println("다항식 " + name + "가 잘 생성됨");
				}
				else // 기존에 있으면
				{
					System.out.println("다항식 f가 기존에 있습니다.");
				}

			}
			else if ( command.equalsIgnoreCase("add") )
			{
				char name = s.next().charAt(0);
				int index = findPolynomialName(name);
				if(index==-1) // 항을 추가하려는 다항식이 없으면
				{
					System.out.println("추가하려는 다항식이 없습니다.");
				}
				else // 기존에 있으면 항을 추가
				{
					int c = s.nextInt(); // 계수
					int e = s.nextInt(); // 차수
					polynomial[index].addTerm(c , e);
				}
				
			}
			else if ( command.equalsIgnoreCase("calc") )
			{
				char name = s.next().charAt(0);
				int index = findPolynomialName(name);
				if(index == -1)
					System.out.println("찾는 다항식이 없습니다.");
				else
				{
					int x = s.nextInt();
					int result = polynomial[index].calcPolynomial(x);
					System.out.println("result : " + result);
				}
			}
			else if ( command.equalsIgnoreCase("print") )
			{
				char name = s.next().charAt(0);
				int index = findPolynomialName(name);
				if(index==-1)
					System.out.println("찾는 다항식이 없습니다.");
				else
				{
					polynomial[index].printPolynomial();
				}
			}
			else if ( command.equalsIgnoreCase("exit") )
			{
				System.out.println("프로그램 종료");
				break;
			}
		}
		s.close();
	}
	
	private static int findPolynomialName(char name)
	{
		for(int i=0; i<n; i++)
		{
			if(polynomial[i].name == name)
				return i;
		}
		return -1;
	}
}
