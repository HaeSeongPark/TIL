package ch13Exercise;

import java.util.*;

public class Ch13_8 {
	Vector words = new Vector();
	String[] data = {"태연","유리","윤아","효연","수영","서현","티파니","써니","제시카"};
	
	int interval = 2 * 1000; 
	
	WordGenerator wg = new WordGenerator();
	public static void main(String[] args) {
		Ch13_8 game = new Ch13_8();
		
		game.wg.start();
		
		Vector words = game.words;
		
		while(true){
			System.out.println(words);
			
			String prompt = ">>";
			System.out.print(prompt);
			
			Scanner s = new Scanner(System.in);
			String input = s.nextLine().trim();
			
			int index = words.indexOf(input);
			
			if(index!=-1){
				words.remove(index);
			}
		}
	}
	class WordGenerator extends Thread{
		public void run(){
			while(true){
				int random = (int)(Math.random()*data.length);
				words.add(data[random]);
				try {
					Thread.sleep(interval);
				} catch (InterruptedException e) {}
			}
		}
	}
}
