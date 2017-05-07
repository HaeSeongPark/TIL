package ch7Exercise;

public class Ch7_17 {

}

abstract class Unit{
	int x, y;
	abstract void move(int x, int y);
	void stop(){}
}

class Marine extends Unit{

	@Override
	void move(int x, int y) {
		// TODO Auto-generated method stub
		
	}
	
	void stimPack(){}
}
class Tank extends Unit{

	@Override
	void move(int x, int y) {
		// TODO Auto-generated method stub
		
	}
	void changeMode(){}
}

class Dropship extends Unit{

	@Override
	void move(int x, int y) {
		// TODO Auto-generated method stub
		
	}
	void load(){}
	void unload(){}
}