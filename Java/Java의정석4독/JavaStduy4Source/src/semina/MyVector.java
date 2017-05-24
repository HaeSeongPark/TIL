package semina;
import java.util.Arrays;

public class MyVector
{
	// trimToSize 
	
	private Object [] objArr;
	private int capacity;
	private int size;

	final static int NOT_FIND = -1;

	public MyVector()
	{
		this(16);
	}
	
	public MyVector(int capacity)
	{
		if(capacity < 0)
			throw new IllegalArgumentException();
		this.capacity = capacity;
		objArr = new Object[this.capacity];
	}
	
	// 용량과 크기가 같아진다.
	public void trimToSize()
	{
		Object[] tmp = new Object[size];
		System.arraycopy(objArr , 0 , tmp , 0 , size);
		objArr = tmp;
		capacity = size;
	}
	
	public void ensuerCapacity(int minCapacity)
	{
		if( minCapacity > objArr.length)
			setCapacity(minCapacity);
	}


	public void setSize(int size)
	{
		this.size = size;
	}
	public int getSize()
	{
		return size;
	}

	public int getCapacity()
	{
//		return capacity;
		return objArr.length;
	}
	
	public void setCapacity(int capacity)
	{
		Object[] tmp = new Object[capacity];
		System.arraycopy(objArr , 0 , tmp , 0 , size);
		objArr = tmp;
	}
	public boolean isEmpty()
	{
		return size == 0;
	}

	public boolean add(Object obj)
	{
		ensuerCapacity(size+1);
		objArr[size++] = obj;
		return true;
	}

	public Object get(int index)
	{
		if(index < 0 || index >= size)
			throw new IndexOutOfBoundsException();
		return objArr[index];
	}

	@Override
	public String toString()
	{
		StringBuilder s = new StringBuilder(capacity);
		for ( int i = 0; i < size; i++ )
		{
			s.append(objArr[i]+",");
		}
		return "["+s.toString()+"]";
	}

	public int indexOf(Object obj)
	{
		for ( int i = 0; i < size; i++ )
		{
			if ( obj.equals(objArr[i]) )
				return i;
		}
		return NOT_FIND;
	}

	public boolean remove(Object obj)
	{
		int index = indexOf(obj);
		if ( index != NOT_FIND )
		{
			remove(index);
			return true;
		}
		
		return false;
	}
	
	public Object remove(int index)
	{
		if(index<0 || index>=size)
			throw new IndexOutOfBoundsException("범위를 벗어났습니다.");
		Object oldObj = objArr[index];
		
		if ( index != size - 1 )
			System.arraycopy(objArr , index + 1 , objArr , index , size - 1 - index);

		objArr[size - 1] = null;
		size--;
		return oldObj;
	}
	
	public void clear()
	{
		for(int i=0; i<size; i++)
			objArr[i] = null;
		size = 0;
	}
}
