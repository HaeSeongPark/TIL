package ch7Exercise;
/*
 * 지역 클래스에서 외부 클래스의 인스턴스멤버와 static멤버에 모두 접근할 수 있지만,
 * 지역변수는 fianl이 붙은 상수만 접근할 수 있는 이유는 무엇인가?
 * 
 * 
 * 메서드가 수행을 마쳐서 지역변수가 소멸된 시점에도, 지역 클래스의 인스턴스가 소멸된
 * 지역변수를 참조하려는 경우가 발생할 수 있기 때문
 */
public class Ch7_29 {
	public static void main(String[] args) {
		final int VALUE = 10;
		
		Thread t = new Thread(new Runnable(){  // 익명클래스

			@Override
			public void run() {
				for(int i=0; i<10; i++){
					try{
						Thread.sleep(1000);
					}catch(InterruptedException e){}
					System.out.println(VALUE);  // 외부클래스의 지역변수를 사용
				}
			}
			
		});
		t.start();
		System.out.println("main() 종료");
	}
}
