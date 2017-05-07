package ch12Exercise;

@interface TestInfo{
	int count() default 1;
	String[] value() default "aaa";
}

public class Ch12_7 {
/*
 * @TestInfo  class Exercise12_7{}
 * Ok!      모두 기본값으로 사용
 * @TestInfo(count=1, value="aaa")
 * 
 * 
 * @TestInfor(1) class Exercise12_7{}
 * 에러 .요소의 이름이  value가 아니면 이름을 생략할 수 없다
 * @TsetInfor(count=1)
 * 
 * @TsetInfor("bbb") class Excercise12_7{}
 * OK. 
 * @TestTinfor(count=1, value="bbb")
 * 
 * @Test("bbb","ccc") class Excercise12_7{}
 * 에러. 값을 여러개 지정해야할 경우 '{}'를 써야함
 * @Tset({"bbb","ccc"})
 * 
 */
}
