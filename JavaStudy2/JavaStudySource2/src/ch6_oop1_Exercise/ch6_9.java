package ch6_oop1_Exercise;

public class ch6_9 {
/*
 * 다음 클래스에 static을 붙여야 하는 것은 뭐고 이유는?
 * 단, 모든 병사의 공격력과 방어력은 같아야 한다.
 * 
 * static 모든 인스턴스가 공유하는 변수
 * 따라서 weapon, armor에 static을 붙여야 함
 * 모든 병사의 공격력과 방어력은 같기 때문
 * 
 * 또한 static변수를 사용하는 메서드에도 static을 붙여야 한다.
 * 따라서 weaponUp과 armorUp메서드에도 static을 붙여야 한다.
 * 
 */

}

class Marine{
	int x=0, y=0; // Marine의 위치좌표(x,y);
	int hp = 60;
	int weapon = 6; // 공격력
	int armor = 0; // 방어력
	
	void weaponUp(){
		weapon++;
	}
	
	void armorUp(){
		armor++;
	}
	
	void move(int x, int y){
		this.x = x;
		this.y = y;
	}
}
