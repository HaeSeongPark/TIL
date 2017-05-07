package ch11_Collection_Framework;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class MyVector implements List{
	//객체를 담기 위한 객체배열을 선언
	Object[] data = null;
	// 용량
	int capacity;
	// 크기
	int size;
	
	//MyVector(int capacity) 작성
	public MyVector(int capacity){
		if(capacity < 0)
			throw new IllegalArgumentException("유효하지 않은 값입니다."+capacity);
		this.capacity = capacity;
		data = new Object[capacity];
	}
	
	//MyVector() 작성, 기본 크기 10
	public MyVector(){
		this(10);
	}
	
	//최소한의 공간(capacity)를 확보하는 메서드
	public void ensureCapacity(int minCapacity){
		if(minCapacity > capacity)
			setCapacity(minCapacity);
	}
	
	// size 반환
	@Override
	public int size() {
		return size;
	}
	
	// capacity 반환
	public int capacity(){
		return capacity;
	}
	
	// 비어있는지 확인
	@Override
	public boolean isEmpty() {
		return size==0;
	}
	
	// 객체 o가 있는지 확인
	@Override
	public boolean contains(Object o) {
		for(int i=0; i<size; i++){
			if(o.equals(data[i]))
				return true;
		}
		return false;
	}

	@Override
	public Iterator iterator() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 객체들을 객체배열로 변환
	@Override
	public Object[] toArray() {
		Object result[] = null;
		System.arraycopy(data, 0, result, 0, size);
		return result;
	}
	
	
	// 객체 배열 a에 담아서 반환
	@Override
	public Object[] toArray(Object[] a) {
		System.arraycopy(data, 0, a, 0, size);
		return a;
	}
	
	// 작성
	@Override
	public boolean add(Object obj) {
		// 새로운 객체를 저장하기 전에 저장할 공간을 확보한다.
		ensureCapacity(size+1);
		data[size++] = obj;
		return true;
	}

	// 작성
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
	
	// 작성
	public void trimToSize(){
		setCapacity(size);
	}
	
	// 작성
	public void setCapacity(int capacity){
		//크기가 같으면 변경하지 않는다.
		if(this.capacity == capacity) return;

		this.capacity = capacity;
		Object tmp[] = new Object[capacity];
		System.arraycopy(data, 0, tmp, 0, size);
		data = tmp;
	}
	
	// 작성
	@Override
	public Object remove(int index) {
		if(index < 0 || index >= size)
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		
		Object tmp = data[index];
		//삭제하고자 하는 객체가 마지막 객체가 아니라면, 배열복사를 통해 빈자리를 채워줘야 한다.
		if(index!=size-1){
			System.arraycopy(data, index+1, data, index, size-1-index);
		}
		
		//마지막 데이터를 null로 지정
		//배열은 0부터 시작하므로 마지막 요소는 index가 size-1이다.
		// size를 하나 줄인다.
		data[--size] = null;

		//삭제한 객체 반환
		return tmp;
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
	
	// 작성
	@Override
	public void clear() {
		for(int i=0; i<size; i--){
			data[i] = null;
		}
		size = 0;
	}

	//작성
	@Override
	public Object get(int index) {
		if( index < 0 || index >= size)
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		return data[index];
	}

	// 작성
	@Override
	public Object set(int index, Object element) {
		if( index < 0 || index >= size)
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		
		data[index] = element;
		
		return null;
	}
	
	// 작성
	@Override
	public void add(int index, Object element) {
		if ( index < 0 || index >= size )
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		ensureCapacity(size+1);
		System.arraycopy(data, index, data, index+1, size-index);
		data[index] = element;
		size++;
	}


	// 작성
	@Override
	public int indexOf(Object o) {
		for(int i=0; i<size; i++){
			if(o.equals(data[i]))
				return i;
		}
		return -1;
	}

	// 작성
	@Override
	public int lastIndexOf(Object o) {
		for(int i=size-1; i >=0; i--){
			if(o.equals(data[i]))
				return i;
		}
		return -1;
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
	
	public boolean equals(Object o){
		return super.equals(o);
	}
	
	public String toString() {
		return super.toString();
	}
}
