package ch11_Collection_Framework;

import java.util.*;

public class TreeMapEx1 {
	public static void main(String[] args) {
		String[] data = { "A", "K", "A", "K", "D", "K", "A", "K", "K", "K", "Z", "D" };

		TreeMap treeMap = new TreeMap();

		for (int i = 0; i < data.length; i++) {
			if (treeMap.containsKey(data[i])) {
				int value = (Integer) treeMap.get(data[i]);
				treeMap.put(data[i], value+1);
			} else {
				treeMap.put(data[i], 1);
			}
		}

		Iterator it = treeMap.entrySet().iterator();
		System.out.println("기본정렬");
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			int value = (Integer) entry.getValue();
			System.out.println(entry.getKey() + ":" + printBar('#', value) + " " + value);
		}

		System.out.println();

		// map을 ArrayList로 변환한 다음에 Collections.sort()를 이용해서 정렬
		Set set = treeMap.entrySet();
		List list = new ArrayList(set);
		Collections.sort(list, new ValueComparator());
		
		it = list.iterator();
		
		System.out.println("값의 크기가 큰 순서로 정렬");
		while(it.hasNext()){
			Map.Entry entry = (Map.Entry)it.next();
			int value = (Integer)entry.getValue();
			System.out.println(entry.getKey() + ":" + printBar('#', value) + " " + value);

		}

	}

	public static String printBar(char ch, int value) {
		char[] bar = new char[value];

		for (int i = 0; i < bar.length; i++)
			bar[i] = ch;

		return new String(bar); // String(char[] chArr)
	}

	static class ValueComparator implements Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			if (o1 instanceof Map.Entry && o2 instanceof Map.Entry) {
				Map.Entry e1 = (Map.Entry) o1;
				Map.Entry e2 = (Map.Entry) o2;

				int v1 = (Integer) e1.getValue();
				int v2 = (Integer) e2.getValue();
				return v2 - v1;
			}
			return -1;
		}
	}
}
