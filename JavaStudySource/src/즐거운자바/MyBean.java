package 즐거운자바;

public class MyBean implements BeanInterface {
	/* (non-Javadoc)
	 * @see 즐거운자바.BeanInterface#exec()
	 */
	@Override
	public void exec(){
		System.out.println("exex!!!");
	}
}
//interface 추출  기존클래스에서
//Refactor -> Extract interface