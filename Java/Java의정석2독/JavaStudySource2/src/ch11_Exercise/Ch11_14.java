package ch11_Exercise;

import java.io.*;
import java.util.*;


public class Ch11_14 {
	
	static ArrayList record = new ArrayList(); // 성적데이터 저장 공간
	static Scanner s = new Scanner(System.in);
	
	public static void main(String[] args) {
		while(true){
			switch(displayMenu()){
			case 1:
				inputRecord();
				break;
			case 2:
				displayRecord();
				break;
			case 3:
				System.out.println("종료");
				System.exit(0);
			}
		}
	}
	
	static int displayMenu(){
		System.out.println("************************************");
		System.out.println("***** 성적 관리 프로그램 ***********");
		System.out.println("************************************");
		System.out.println();
		System.out.println(" 1. 학생성적 입력하기");
		System.out.println();
		System.out.println(" 2. 학생성적 보기");
		System.out.println();
		System.out.println(" 3. 프로그램 종료");
		System.out.println();
		
		System.out.print("원하는 메뉴 선택 1~3 : ");
		int menu = 0;
		
		while(true){
			try {
				menu = Integer.parseInt(s.nextLine().trim());
				if( 1<= menu && menu <=3) break;
				else throw new Exception();
			} catch (Exception e) {
				System.out.println("다시 입력해주세요 범위 1~3");
			}
		}
		
		return menu;
	}
	
	static void inputRecord(){
		System.out.println("1.학생성적입력하기");
		System.out.println("이름,반,번호,국어성적,영어성적,수학성적의 순서로 공백없이 입력하세요.");
		System.out.println("입력을마치려면q를입력하세요 메인화면으로 돌아갑니ㅏ.");
		
		while(true){
			System.out.print(">>");
		try{	
			String input = s.nextLine().trim();
			
			if(!input.equalsIgnoreCase("q")){
				Scanner s2 = new Scanner(input).useDelimiter(",");
				record.add(new Student14(s2.next(),s2.nextInt(),s2.nextInt(),s2.nextInt(),s2.nextInt(),s2.nextInt()));
				System.out.println("입력완료 마치려면 q");
			}else{
				return;
			}
		}catch(Exception e){
			System.out.println("입력오류. 이름, 반, 번호, 국어성적, 영어성적, 수학성적순으로 입력");
		}
	}
}
	static void displayRecord(){
		int koreanTotal = 0;
		int englishTotal = 0;
		int mathTotal = 0;
		int total  = 0;
		
		int length = record.size();
		
		if(length > 0){
			System.out.println();
			System.out.println("이름 반 번호 국어 영어 수학 총점 평균 전교등수 반등수");
			
			System.out.println("===================================");
			
			for(int i=0; i<length; i++){
				Student14 student = (Student14)record.get(i);
				System.out.println(student);
				koreanTotal += student.kor;
				mathTotal += student.math;
				englishTotal += student.eng;
				total += student.total;
			}
			System.out.println("=================================");
			System.out.println("총점 : "+koreanTotal+" "+englishTotal+" "+mathTotal+" "+total);
			System.out.println();
		}
		else{
			System.out.println("=======================");
			System.out.println("데이터가 없습니다./");
			System.out.println("=======================");
		}
	}
}

class Student14 implements Comparable{
	String name;
	int ban;
	int no;
	int kor;
	int eng;
	int math;
	
	int total;
	int schoolRank;
	int classRank;
	
	
	
	public Student14(String name, int ban, int no, int kor, int eng, int math) {
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		total = kor+ eng + math;
	}
	
	int getTotal(){
		return total;
	}
	
	float getAverage(){
		return (int)((getTotal()/3f)*10+0.5)/10f;
	}

	@Override
	public int compareTo(Object o) {
		if(o instanceof Student14){
			Student14 tmp = (Student14)o;
			return tmp.total - this.total;
		}else{
			return -1;
		}
	}

	@Override
	public String toString() {
		return "Student14 [name=" + name + ", ban=" + ban + ", no=" + no + ", kor=" + kor + ", eng=" + eng + ", math="
				+ math + ", total=" + total + ", schoolRank=" + schoolRank + ", classRank=" + classRank + "]";
	}
	
	
}
