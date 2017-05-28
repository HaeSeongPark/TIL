package ch3_5_Generics;

import java.util.Arrays;

public class MyArrayList<E>
{
	private static final int NOT_FIND = -1;
	private static final int INIT_CAPACITY = 10;
	private E[] theData;
	private int size = 0;
	private int capacity;
	
	@SuppressWarnings("unchecked")
	public MyArrayList()
	{
		capacity = INIT_CAPACITY;
		theData = (E[]) new Object[capacity];
	}
	
	public void add(int index, E e)
	{
		indexCheck(index);
		
		if(size>=capacity)
			reallocate();
		
		for(int i=size-1; i>=index; i++)
		{
			theData[i+1] = theData[i];
		}
		theData[index] = e;
		size++;
	}
	
	public int getSize()
	{
		return size;
	}
	
	public void add(E e)
	{
		add(size, e);
	}
	
	public int indexOf(E e)
	{
		for(int i=0; i<size; i++)
		{
			if(theData[i].equals(e))
				return i;
		}
		return NOT_FIND;
	}
	
	public E get(int index)
	{
		indexCheck(index);
		return theData[index];
	}
	
	
	public E set(int index, E newE)
	{
		indexCheck(index);
		E old = theData[index];
		theData[index] = newE;
		return old;
	}
	
	public E remove(int index)
	{
		indexCheck(index);
		
		E returnValue = theData[index];
		for(int i=index+1; i<size; i++)
			theData[i-1] = theData[i];
		size--;
		return returnValue;
	}
	
	public void indexCheck(int index)
	{
		if(index <0 || index>=size)
			throw new ArrayIndexOutOfBoundsException();
	}
	
	private void reallocate()
	{
		theData = Arrays.copyOf(theData , capacity*=2);
	}
}
