package ch7_oop2;

public class RepairableTset {
	public static void main(String[] args) {
		Tank tank = new Tank();
		Dropship dropship = new Dropship();
		Marine marine = new Marine();
		SCV scv = new SCV();
		
		scv.repair(tank);
		scv.repair(dropship);
//		scv.repair(marine);
		scv.repair(scv);
	}
}

interface Repairable{}
class UnitT{
	int hitPoint;
	final int MAX_HP;
	UnitT(int hp){
		MAX_HP = hp;
	}
}

class GroundUnit extends UnitT{
	GroundUnit(int hp){
		super(hp);
	}
}

class AirUnit extends UnitT{
	AirUnit(int hp){
		super(hp);
	}
}

class Tank extends GroundUnit implements Repairable{
	Tank(){
		super(150);
		hitPoint = MAX_HP;
	}
	
	public String toString(){
		return "Tank";
	}
}

class Dropship extends AirUnit implements Repairable{
	Dropship(){
		super(125);
		hitPoint = MAX_HP;
	}
	
	public String toString(){
		return "Dropship";
	}
}

class Marine extends GroundUnit{

	Marine() {
		super(40);
		hitPoint = MAX_HP;
	}
	
}

class SCV extends GroundUnit implements Repairable{
	SCV(){
		super(60);
		hitPoint = MAX_HP;
	}
	
	void repair(Repairable r){
		if(r instanceof UnitT){
			UnitT u = (UnitT)r;
			while(u.hitPoint != u.MAX_HP){
				u.hitPoint++;
			}
			System.out.println(u.toString() + "의 수리가 끝났습니다.");
		}
	}
	
	public String toString(){
		return "SCV";
	}
}