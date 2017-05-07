package ch7Exercise;
/*
 * 지역 클래스에서 외부 클래스의 인스턴스멤버와 static멤버에 모두 접근할 수 있지만,
 * 지역변수는 fianl이 붙은 상수만 접근할 수 있는 이유는 무엇인가?
 * 
 * 
 * 메서드가 수행을 마쳐서 지역변수가 소멸된 시점에도, 지역 클래스의 인스턴스가 소멸된
 * 지역변수를 참조하려는 경우가 발생할 수 있기 때문
 * 
 * 아래와 같이  main메서드가 종료된 후에도 지역변수 VALUE의 값을 사용하고 있다는 것을 알 수 있다.
 * 지역변수는 메서드가 종료되면 함께 사라지지만, 상수의 경우 이미 컨스턴트 풀(constant pool, 상수를 따로 모아서 저장해 놓는 곳)에
 * 저장돼 있기 때문에 사용할 수 있는 것이다.
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
