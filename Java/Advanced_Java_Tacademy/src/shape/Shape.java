package shape;

public abstract class Shape
{
	// 도형의 넓이
	abstract int calculateArea();
	
	// 도형의 영역을 나타내는 함수로 left, right, top, bottom값을 갖ㄴ느다.
	abstract void setBounds();
}
