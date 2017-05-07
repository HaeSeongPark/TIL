package ch12_Generics_Enum_Annotation;

import java.util.*;

class MyArrayList<T>
{
	T[] arr;

	public MyArrayList(T [] arr)
	{
		super();
		this.arr = arr;
	}
	
	@SafeVarargs
	public static <T> MyArrayList<T> asList(T...a)
	{
		return new MyArrayList<>(a);
	}
}

public class AnnotationEx4
{
	public static void main(String [] args)
	{
		MyArrayList<String> list = MyArrayList.asList("1","2","3");
		System.out.println(list);
	}
}
