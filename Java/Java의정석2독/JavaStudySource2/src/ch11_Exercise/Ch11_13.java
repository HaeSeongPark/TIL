package ch11_Exercise;

import java.util.Comparator;
import java.util.TreeMap;

public class Ch11_13 {
	public static void main(String[] args) throws Exception{
		SutdaDeck deck = new SutdaDeck();
		
		deck.shuffle();
		
		Player[] pArr = {
				new Player("타짜",deck.pick(),deck.pick()),
				new Player("고수",deck.pick(),deck.pick()),
				new Player("물주",deck.pick(),deck.pick()),
				new Player("중수",deck.pick(),deck.pick()),
				new Player("하수",deck.pick(),deck.pick()),
		};
		
		TreeMap<Player, Integer> rank = new TreeMap<>(new Comparator<Player>(){


			@Override
			public int compare(Player o1, Player o2) {
				return o2.point - o1.point;
			}
		});
		
		for(int i=0; i<pArr.length; i++){
			Player p = pArr[i];
			rank.put(p, deck.getPoint(p));
			System.out.println(p+" "+deck.getPoint(p));
		}
		System.out.println();
		System.out.println("1위는"+rank.firstKey()+"입니다.");
	}
}
