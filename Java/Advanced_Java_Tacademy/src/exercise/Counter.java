package exercise;

public class Counter
{
	private int mCount = 0;
	CounterListener mListener;
	
	public void setCouterListener(CounterListener listener)
	{
		mListener = listener;
	}
	
	public void inc()
	{
		mCount++;
		if(mCount%10==0)
		{
			if(mListener!=null)
				mListener.onNotifyCount(mCount);
		}
	}
}
