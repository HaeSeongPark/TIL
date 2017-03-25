package ch7_Exercise;
/*
 * 아래 세 개의 클래스로부터 공통부분을 뽑아서 Unit이라는 클래스를 만들고, 이 클래스를 상속 받도록
 */
//class Marine{
//	int x, y;
//	void move(int x, int y){}
//	void stop(){}
//	void stimPack(){}
//}
//
//class Tank{
//	int x, y;
//	void move(int x, int y){}
//	void stop(){}
//	void changeMode(){}
//}
//
//class Dropship{
//	int x, y;
//	void move(int x, int y){}
//	void stop(){}
//	void load(){}
//	void unload(){}
//}
// 공통된거 int x, y; void move(int x, int y){} void stop(){}
abstract class Unit{  // 추상클래스
	int x, y;
	abstract void move(int x, int y);  // 추상메서드, 클래스마다 이동방법이 다르므로 move메서드는 추상메서드로
	void stop(){}
}

class Marine extends Unit{
	void stimPack(){}
	@Override
	void move(int x, int y) {}
}

class Tank extends Unit{
	void changeMode(){}
	@Override
	void move(int x, int y) {}
}

class Dropship extends Unit{
	void load(){}
	void unload(){}
	@Override
	void move(int x, int y) {}
}
public class Ch7_17 {

}
