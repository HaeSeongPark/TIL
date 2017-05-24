package ch2_1;

import java.util.Scanner;
import jdk.management.resource.internal.inst.SocketOutputStreamRMHooks;
/* 개선할 점 3개
 * 1 .arrayList와 linkedlist 사용해서 개선
 * taskset도하고
 */

public class Code6
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
					polynomial[n] = new Polynomial();
					polynomial[n].name = name;
					polynomial[n].nTerms = 0;
					polynomial[n++].terms = new Term[100];
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
					addTerm(polynomial[index], c, e);
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
					int result = calcPolynomial(polynomial[index] ,x);
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
					printPolynomial(polynomial[index]);
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
	private static int calcPolynomial(Polynomial p, int x)
	{
		int result = 0;
		for(int i=0; i<p.nTerms; i++)
		{
			result += calcTerm(p.terms[i],x);
		}
		return result;
	}
	private static int calcTerm(Term term, int x)
	{
		return (int)(term.coef * Math.pow(x , term.expo));
	}
	private static void printPolynomial(Polynomial p)
	{
		for(int i=0; i<p.nTerms; i++)
		{
			printTerm(p.terms[i]);
			System.out.print("+");
		}
		System.out.println();
	}
	private static void printTerm(Term term)
	{	 //2.  +-1x^2   ---> -x^2 계선
		System.out.print(term.coef + "x^" + term.expo);
	}
	private static void addTerm(Polynomial p, int c, int e)
	{
		int index = findExpo(p, e);
		if(index==-1)  // 해당계수가 존재하지 않는다면, 위치 찾아서 넣기
		{
			int i = p.nTerms-1;
			while(i>=0 && p.terms[i].expo < e)
			{
				p.terms[i+1] = p.terms[i];
				i--;
			}
			p.terms[i+1] = new Term();
			p.terms[i+1].coef = c;
			p.terms[i+1].expo = e;
			p.nTerms++;
		}
		else  // 존재 한다면 계수 찾아서 넣기
		{
			 // 3. 계수가 0이 될 때 처리
			p.terms[index].coef += c;
		}
	}
	private static int findExpo(Polynomial p, int e)
	{
		for(int i=0; i<p.nTerms && p.terms[i].expo>=e ; i++)
		{
			if(p.terms[i].expo == e)
				return i;
		}
		return -1;
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
