package drawable;

import java.io.Serializable;
import java.util.Random;

public class Image implements Serializable
{
	static Random sR = new Random();
	
	String image;
	public Image()
	{
		image = "image NO." + sR.nextInt();
	}
	
	@Override
	public String toString()
	{
		return "image : " + image;
	}
}
