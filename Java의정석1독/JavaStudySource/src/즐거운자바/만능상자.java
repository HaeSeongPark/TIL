package 즐거운자바;

public class 만능상자 {
	private Object obj;
	
	public void set(Object o){
		//버스를 넣어줘도 Object가 갖고있는 메서드만 사용가능
		obj = o;
	}
	public Object get(){
		return obj;
	}
}
