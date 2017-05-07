package ch11_Collection_Framework;

import java.util.PriorityQueue;
import java.util.Queue;

public class PriorityQueueEx1 {
	public static void main(String[] args) {
		Queue pq = new PriorityQueue();
		int i=0;
		pq.offer(3);
		pq.offer(1);
		pq.offer(5);
		pq.offer(2);
		pq.offer(4);
		
		System.out.println(pq);
		
		Object obj = null;
		while((obj = pq.poll())!=null)
			System.out.println(obj);
	}
}
