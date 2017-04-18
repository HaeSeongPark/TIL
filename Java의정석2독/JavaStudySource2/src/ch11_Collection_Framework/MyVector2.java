package ch11_Collection_Framework;

import java.util.*;

// 소스짜고 MyVector2Test로 테스트해보기 p.625

public class MyVector2 extends MyVector implements Iterator{
	// cursor, lastRet 선언
	int cursor = 0;
	int lastRet = -1;
	
	public MyVector2(int capacity){
		super(capacity);
	}
	
	public MyVector2(){
		this(10);
	}
	
	public String toString(){
		return "";
	}
	
	public Iterator iterator(){
		// cursor와 lastRet초기화
		cursor = 0;
		lastRet = -1;
		return this;
	}
	
	@Override
	public boolean hasNext() {
		// 구현
		return false;
	}

	@Override
	public Object next() {

		return null;
	}
	
	public void remove(){
		//더이상 삭제할 것이 없으면 IllegalStateException을 발생

		// 최근에 읽어온 요소를 삭제한다.
	}
}
