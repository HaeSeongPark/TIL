package ch7_Exercise;
/*
 * 클래스가 다음과 같이 정의돼 있을 때, 형변환을 올바르게 하지 않은 것은?
 * class Unit{}
 * class AirUnit extends Unit{}
 * class GroundUnit extends Unit{}
 * class Tank extends GroundUnit{}
 * class AirCraft extends AirUnit{}
 * 
 * Unit u = new GroundUnit();
 * Tank t = new Tank();
 * AirCraft ac = new AirCraft();
 * ----------------------
 * a. u = (Unit)ac;         조상타입의 참조변수로 자손타입의 인스터스 참조
 * b. u = ac;        조상타입의 참조변수로 자손타입의 인스터스 참조
 * c. GroundUnit gu = (GroundUnit)u;   -> GroundUnit gu = (GroundUnit)new GroundUnit();    o 
 * d. AirUnit au = ac;     -> AirUnit au = new AirCraft(); 조상타입의 참조변수로 자손타입의 인스터스 참조
 * e. t = (Tank)u;           Tank t= (Tank)new GroundUnit();  자손타입의 참조변수로 조상인스턴스를 참조 X
 * f. GroundUnit gu = t;     GroundUUnit gu = new Tank(); 조상타입의 참조변수로 자손타입의 인스터스 참조
 */
public class Ch7_15 {

}
