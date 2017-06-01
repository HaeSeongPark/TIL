package ch08;

public class MyBean implements BeanInterface
{
	/* (non-Javadoc)
	 * @see ch8.BeanInterface#exec()
	 */
	@Override
	public void exec()
	{
		System.out.println("exec");
	}
}

//interface 추출  기존클래스에서
//Refactor -> Extract interface
