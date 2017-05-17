import static org.junit.Assert.*;
import org.junit.Test;

public class CoutnerTest
{
	@Test
	public void test()
	{
		Calculator c = new Calculator();
		double result = c.add(10 , 50);
		assertEquals(60 , result,0);
	}
}
