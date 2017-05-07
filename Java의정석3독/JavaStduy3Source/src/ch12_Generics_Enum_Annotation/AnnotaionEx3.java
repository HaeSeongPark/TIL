package ch12_Generics_Enum_Annotation;

import java.util.*;

class NewClass
{
	int newField;
	int getNewField()
	{
		return newField;
	}
	
	@Deprecated
	int oldField;
	
	@Deprecated
	int getOldField()
	{
		return oldField;
	}
}

public class AnnotaionEx3
{
	@SuppressWarnings("deprecation")
	public static void main(String [] args)
	{
		NewClass nc = new NewClass();
		nc.oldField = 10;
		System.out.println(nc.getOldField());
		
		@SuppressWarnings("unchecked")
		ArrayList list = new ArrayList();
		list.add(nc);
		
	}
}
