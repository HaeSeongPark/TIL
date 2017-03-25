package ch7_Exercise;

public class Ch7_18 {
	static void action(Robot r){
		if(r instanceof DanceRobot){
			((DanceRobot) r).dance();
		} else if (r instanceof SingRobot){
			((SingRobot) r).sing();
		} else if (r instanceof DrawRobot){
			((DrawRobot) r).draw();
		}
	}
	
	public static void main(String[] args) {
		Robot[] arr = { new DanceRobot(), new SingRobot(), new DrawRobot() };
		
		for(int i=0; i < arr.length; i++)
			action(arr[i]);
	}
}

class Robot{}

class DanceRobot extends Robot{
	void dance(){
		System.out.println("춤 춘다.");
	}
}
class SingRobot extends Robot{
	void sing(){
		System.out.println("노래를 합니다.");
	}
}
class DrawRobot extends Robot{
	void draw(){
		System.out.println("그림을 그립니다.");
	}
}