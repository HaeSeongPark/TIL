package ch7_oop2;

class Shape{
	String color = "";
	void draw(){
		System.out.printf("[color=%s]%n",color);
	}
	Shape(String color){
		this.color = color;
	}
}