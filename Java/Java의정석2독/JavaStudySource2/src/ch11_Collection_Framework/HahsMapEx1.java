package ch11_Collection_Framework;

import java.util.HashMap;
import java.util.Scanner;

public class HahsMapEx1 {
	public static void main(String[] args) {
		HashMap<String,String> map = new HashMap<>();
		map.put("asdf", "1234");
		map.put("myId", "1234");
		map.put("myId", "1234");
		
		Scanner s = new Scanner(System.in);
		
		while(true){
			System.out.println("id와 password를 입력하세요.");
			System.out.print("id : ");
			String id = s.nextLine().trim();
			
			System.out.print("password : ");
			String password = s.nextLine().trim();
			
			if(!map.containsKey(id)){
				System.out.println("입력하신 id는 존재하지 않습니다." + " 다시 입력해주세요");
				continue;
			} else{
				if(map.get(id).equals(password)){
					System.out.println("일치합니다.");
					break;
				} else{
					System.out.println(map.get(id));
					System.out.println("일치하지 않습니다.");
					continue;
				}
			}
			
			
		}
		
	}
}
