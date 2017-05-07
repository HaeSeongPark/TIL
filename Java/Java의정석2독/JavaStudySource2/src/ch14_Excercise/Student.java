package ch14_Excercise;


class Student implements Comparable<Student>{
	
	enum Level { HIGH, MID, LOW }
	
	String name;
	boolean isMale;
	int ban;
	int totalScore;
	int hak;
	int score;

	public Student() {
		super();
	}
	
	public Student(String name, boolean isMale, int hak, int ban, int score) {
		super();
		this.name = name;
		this.isMale = isMale;
		this.ban = ban;
		this.hak = hak;
		this.score = score;
	}

//	public Student(String name, int ban, int totalScore) {
//		super();
//		this.name = name;
//		this.ban = ban;
//		this.totalScore = totalScore;
//	}
	
	public String toString(){
		return String.format("[%s, %s, %d학년 %d반, %3d점]", name, 
				isMale ? "남" : "여",hak, ban, score);
	
	}
	
	
	public String getName() {
		return name;
	}
	
	boolean isMale() { return isMale; }
	
	public int gethak() { return hak; }
	
	public int getScore() { return score; }
	
	public int getBan() {
		return ban;
	}

	public int getTotalScore() {
		return totalScore;
	}

	@Override
	public int compareTo(Student o) {
		return o.totalScore - this.totalScore;
	}
}