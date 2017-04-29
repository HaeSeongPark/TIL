package ch15_Exercise;

import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class Ch15_9 extends Frame {
	String fileName;
	TextArea content;
	MenuBar mb;
	Menu mFile;
	MenuItem miNew, miOpen, miSaveAs, miExit;

	Ch15_9(String title) {
		super(title);
		content = new TextArea();
		add(content);
		
		mb = new MenuBar();
		mFile = new Menu("File");
		
		miNew = new MenuItem("New");
		miOpen = new MenuItem("Open");
		miSaveAs = new MenuItem("Save As...");
		miExit = new MenuItem("Exit");
		
		mFile.add(miNew);
		mFile.add(miOpen);
		mFile.add(miSaveAs);
		mFile.addSeparator();
		mFile.add(miExit);
		
		mb.add(mFile);
		setMenuBar(mb);
		
		MyHandler handler = new MyHandler();
		miNew.addActionListener(handler);
		miOpen.addActionListener(handler);
		miSaveAs.addActionListener(handler);
		miExit.addActionListener(handler);
		
		setSize(300,200);
		setVisible(true);
	}
	
	void fileOpen(String fileName){
		try(  FileReader fr = new FileReader(fileName);
			  BufferedReader br = new BufferedReader(fr)) {
			  StringWriter output = new StringWriter();
			  String line = "";
			  
			  while((line=br.readLine())!=null)
			  {
				  output.write(line+"\n");
			  }
			  content.setText(output.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	void saveAs(String fileName){
		try(FileWriter fw = new FileWriter(fileName);
			BufferedWriter input = new BufferedWriter(fw)) {
			
			input.write(content.getText());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void main(String[] args) {
		Ch15_9 main = new Ch15_9("Text Editor");
	}
	
	class MyHandler implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e) {
			String command = e.getActionCommand();
			
			if(command.equals("New")){
				content.setText("");
			} else if(command.equals("Open")){
				FileDialog fileOpen = new FileDialog(Ch15_9.this, "파일 열기");
				fileOpen.setVisible(true);
				fileName = fileOpen.getDirectory() + fileOpen.getFile();
				System.out.println(fileName);
				// 선택된 파일의 내용을 TextArea에 보여준다.
				fileOpen(fileName);
			} else if(command.equals("Save As...")){
				FileDialog fileSave = new FileDialog(Ch15_9.this, "파일저장", FileDialog.SAVE);
				fileSave.setVisible(true);
				fileName = fileSave.getDirectory() + fileSave.getFile();
				System.out.println(fileName);
				saveAs(fileName);
			} else if (command.equals("Exit")){
				System.exit(0);
			}
		}
		
	}
}
