package ch14;

@FunctionalInterface
interface MyFunction2{
	void myMethod();
}

public class LambdaEx2 {

	public static void main(String[] args) {
		MyFunction2 f = ()->{}; // MyFunction2 f = (MyFunction2)(()->{})
		Object obj = (MyFunction2)(()->{}); // Object타입으로 형변환이 생략됨
		String str = ((Object)(MyFunction2)(()->{})).toString();
		
		System.out.println(f);
		System.out.println(obj);
		System.out.println(str);
		
//		System.out.println(()->{]); //에러, 람다식은 Object타입으로 형변환 안됨
		System.out.println((MyFunction2)(()->{}));
//		System.out.println((MyFunction2)(()->{}).toString()); // 에러.
		System.out.println(((Object)(MyFunction2)(()->{})).toString());
		
		/*
		 *  ch14.LambdaEx2$$Lambda$1/834600351@87aac27
			ch14.LambdaEx2$$Lambda$2/1418481495@3e3abc88
			ch14.LambdaEx2$$Lambda$3/303563356@816f27d
			ch14.LambdaEx2$$Lambda$4/1826771953@53d8d10a
			ch14.LambdaEx2$$Lambda$5/245257410@65ab7765

		 */
	}
}
