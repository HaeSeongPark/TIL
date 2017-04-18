package ch11_Collection_Framework;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/*
 * 다시 작성하고 내가 짠 거랑 api에 있는 거랑 비교
 * contains, equals, et, add, indexOf, lastIndexOf, toString 등도
 * 추가적으로 작성해보고 비교. p.593참조
 */

public class MyVector implements List{
	//객체를 담기 위한 객체배열을 선언
	Object[] data = null;
	// 용량
	int capacity = 0;
	// 크기
	int size = 0;
	
	//MyVector(int capacity) 작성
	public MyVector(int capacity){
		if(capacity<0)
			throw new IllegalArgumentException("유효하지 않은 값입니다. :"+capacity);
		this.capacity = capacity;
		data = new Object[capacity];
	}
	
	//MyVector() 작성, 기본 크기 10
	public MyVector(){
		this(10);
	}
	
	//최소한의 공간(capacity)를 확보하는 메서드
	public void ensureCapacity(int minCapacity){
		if(minCapacity > data.length)
			setCapacity(minCapacity);
	}

	@Override
	public int size() {
		return size;
	}
	
	public int capacity(){
		return capacity;
	}

	@Override
	public boolean isEmpty() {
		return size == 0;
	}

	@Override
	public boolean contains(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterator iterator() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object[] toArray() {
		// 그냥 return data해도 되지 않나?
		Object[] result = new Object[size];
		System.arraycopy(data, 0, result, 0, size);
		return result;
	}

	@Override
	public Object[] toArray(Object[] a) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean add(Object obj) {
		// 새로운 객체를 저장하기 전에 저장할 공간을 확보한다.
		ensureCapacity(size+1);
		data[size++] = obj;
		return true;
	}

	@Override
	public boolean remove(Object obj) {
		for(int i=0; i<size; i++){
			if(obj.equals(data[i])){
				remove(i);
				return true;
			}
		}
		return false;
	}
	
	public void trimToSize(){
		setCapacity(size);
	}
	
	public void setCapacity(int capacity){
		//크기가 같으면 변경하지 않는다.
		if(this.capacity==capacity) return;
		
		Object[] tmp = new Object[capacity];
		System.arraycopy(data, 0, tmp, 0, size);
		data = tmp;
		this.capacity = capacity;
	}
	
	@Override
	public Object remove(int index) {
		Object oldObj = null;
		
		if(index < 0 || index>=size)
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		oldObj = data[index];
		
		//삭제하고자 하는 객체가 마지막 객체가 아니라면, 배열복사를 통해 빈자리를 채워줘야 한다.
		if(index != size-1)
			System.arraycopy(data, index+1, data, index, size-1-index);
		
		//마지막 데이터를 null로 지정
		//배열은 0부터 시작하므로 마지막 요소는 index가 size-1이다.
		// size를 하나 줄인다.
		data[--size] = null;
		
		//삭제한 객체 반환
		return oldObj;
	}

	@Override
	public boolean containsAll(Collection c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addAll(Collection c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addAll(int index, Collection c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeAll(Collection c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean retainAll(Collection c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void clear() {
		for(int i=0; i<size; i++){
			data[i] = null;
		}
		size = 0;
	}

	@Override
	public Object get(int index) {
		if( index < 0 || index >= size)
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		return data[index];
	}

	@Override
	public Object set(int index, Object element) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(int index, Object element) {
		
	}



	@Override
	public int indexOf(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int lastIndexOf(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ListIterator listIterator() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListIterator listIterator(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List subList(int fromIndex, int toIndex) {
		// TODO Auto-generated method stub
		return null;
	}
}
