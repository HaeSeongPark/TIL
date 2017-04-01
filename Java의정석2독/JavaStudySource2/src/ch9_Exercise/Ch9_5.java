package ch9_Exercise;

public class Ch9_5 {
	public static void main(String[] args) {
		System.out.println(count("12345AB12AB345AB","AB"));
		System.out.println(count("12345","AB"));
	}
	
	public static int count(String src, String target){
		int count = 0; // 찾은 횟수
		int pos = 0; // 찾기 시작할 위치
		
		
		// 반복문을 사용해서 아래의 과정 반복
		// 1. src에서 target을 pos의 위치부터 찾는다.
		// 2. 찾으면 count의 값을 1 증가 시키고, pos의 값을 target.length만큼 증가
		// indexOf의 결과가 -1이면 반복문을 빠져나가서  count을 반환
		
//		while(true){
//			int idx = src.indexOf(target,pos);
//
//			if(idx == -1){
//				break;
//			}
//			else{
//				count++;
//				pos = idx + target.length();
//			}
//		}
//
//		while(true){
//			
//			if( (pos = src.indexOf(target, pos)) != -1){
//				count++;
//				pos += target.length();
//			} else
//				break;
//		}
		
		while((pos = src.indexOf(target, pos)) != -1){
			count++;
			pos += target.length();
		}
		
		return count;
	}
}
