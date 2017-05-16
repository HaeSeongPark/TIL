package tryHelloWorld;

// 가운데 글자 홀일때 정가운데 짝일때 가운데 두 글자


public class StringExercise{
    String getMiddle(String word){
    	
    	String result = "";
    	int middleIndex=word.length()/2;
    	
    	// 홀수이면
    	if(word.length()%2 != 0 ) {
    		result = word.substring(middleIndex,middleIndex+1);
    	} else {  // 짝수면
    		result = word.substring(middleIndex-1, middleIndex+1);
    	}
    	return result;    
    	
//    	return word.substring(len/2 - (len+1)%2, len/2 + 1);
    }
    // 아래는 테스트로 출력해 보기 위한 코드입니다.
    public static void  main(String[] args){
        StringExercise se = new StringExercise();
        System.out.println(se.getMiddle("power"));
        System.out.println(se.getMiddle("test"));
    }
}