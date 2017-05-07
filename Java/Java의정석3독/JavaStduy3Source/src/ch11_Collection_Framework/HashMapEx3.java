package ch11_Collection_Framework;

import java.util.*;
import java.util.Map.Entry;

public class HashMapEx3
{
	static HashMap<String, HashMap<String,String>> phoneBook = new HashMap<>();
	
	public static void main(String [] args)
	{
		addPhoneNo("친구", "이지바", "010-111-1111");
		addPhoneNo("친구", "김지바", "010-222-2222");
		addPhoneNo("친구", "김자바", "010-333-3333");
		addPhoneNo("회사", "김대리", "010-444-4444");
		addPhoneNo("회사", "김대리", "010-555-5555");
		addPhoneNo("회사", "박대리", "010-666-6666");
		addPhoneNo("회사", "이과장", "010-777-7777");
		addPhoneNo("세탁", "010-888-8888");

		printList();
	}
	
	static void addPhoneNo(String name, String tel){
		addPhoneNo("기타",name,tel);
	}
	
	static void addPhoneNo(String groupName, String name, String tel){
		addGroup(groupName);
		HashMap<String, String> group = phoneBook.get(groupName);
		group.put(tel , name);
	}
	static void addGroup(String groupName){
		if(!phoneBook.containsKey(groupName))
			phoneBook.put(groupName , new HashMap<>());
	}
	
	static void printList()
	{
		Set<Entry<String , HashMap<String , String>>> set = phoneBook.entrySet();
		Iterator<Entry<String , HashMap<String , String>>> it = set.iterator();
		while(it.hasNext())
		{	
			Entry<String , HashMap<String , String>> e = it.next();
			Set<Entry<String , String>> subset = e.getValue().entrySet();
			Iterator<Entry<String , String>> subIt = subset.iterator();
			
			System.out.println("*"+e.getKey()+"["+subset.size()+"]");
			
			while(subIt.hasNext()){
				Entry<String , String> subE = subIt.next();
				String telNo = (String)subE.getKey();
				String name = (String)subE.getValue();
				System.out.println(name+" " + telNo);
			}
			System.out.println();
		}
	}
}
