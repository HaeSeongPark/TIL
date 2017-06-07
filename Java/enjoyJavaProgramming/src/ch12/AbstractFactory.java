package ch12;

// 추상 클래스 : 보통 이러한 템플릿 메소드 패턴에서 많이 사용
// 추상 클래스는 인스턴스가 되면 안되는 것
public abstract class AbstractFactory
{	
	// final 메소드 - 오버라이딩 금지
	// 템플릿메소드패턴 : 메소드의 순서만 기억
	// abstract가 아닌 메소드도 만들 수 있음
	public final void exex()
	{
		init();
		make();
		clear();
	}
	// 메소드가 오버라이딩 돼 있으면 자식 메소드가 실행
	protected abstract void init();
	protected abstract void make();
	protected abstract void clear();
}
