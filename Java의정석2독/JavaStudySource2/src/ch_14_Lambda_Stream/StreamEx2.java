package ch_14_Lambda_Stream;

import java.io.*;
import java.util.stream.*;

public class StreamEx2 {
	public static void main(String[] args) {
		File[] fileArr = { new File("Ex1.java"), new File("Ex1.bak"), new File("Ex2.java"), 
				new File("Ex1"), new File("Ex1.txt") };
		
		Stream<File> fileStream = Stream.of(fileArr);
		
		Stream<String> filenameStream = fileStream.map(File::getName);
		filenameStream.forEach(System.out::println);
		
		fileStream = Stream.of(fileArr);
		
		fileStream.map(File::getName)
				  .filter(s->s.indexOf('.')!=-1)
				  .peek(s->System.out.printf("filename=%s%n",s))
				  .map(s->s.substring(s.indexOf('.')+1))
				  .peek(s->System.out.printf("extension=%s%n",s))
				  .map(String::toUpperCase)
				  .distinct()
				  .forEach(System.out::println);
	}
}
