package ch15_Exercise;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.SequenceInputStream;
import java.util.Vector;

public class FileMergeTest {
	public static void main(String[] args) {
		if(args.length==0){
			System.out.println("USAGE:java FileMergeTest MERGE_FILENAME FILENAME1 FILENAME2 ...");
			System.exit(0);
		}
		File mergeFile = new File(args[0]);
		Vector<FileInputStream> v = new Vector<>();
		for(int i=1; i<args.length; i++){
			try {
				v.add(new FileInputStream(args[i]));
			} catch (FileNotFoundException e) {
				System.out.println("파일을 찾을 수 없습니다.");
			}
		}
		
		SequenceInputStream input = new SequenceInputStream(v.elements());
		
		try{
			FileWriter fr = new FileWriter(mergeFile);
			BufferedWriter br = new BufferedWriter(fr);
					
			int data = 0;
			while((data=input.read())!=-1){
				br.write(data);
			}
			
			br.close();
			
		} catch ( FileNotFoundException e){
			System.out.println("파일이 없습니다.");
		}
		catch ( Exception e){
		}
	}
}
