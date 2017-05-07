package ch_12_Generics_Enum_Annotation;

import java.util.*;

class NewClass{
	int newField;
	
	int getNewField(){
		return newField;
	}
	
	@Deprecated
	int oldField;
	
	@Deprecated
	int getOldField(){
		return oldField;
	}
}

public class AnnotationEx3 {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		NewClass nc = new NewClass();
		
		nc.oldField = 10;
		System.out.println(nc.getOldField());
		
		@SuppressWarnings("unchecked")
		ArrayList<NewClass> list = new ArrayList();
		list.add(nc);
	}
}
