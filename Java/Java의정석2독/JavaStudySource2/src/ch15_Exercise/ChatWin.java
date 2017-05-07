package ch15_Exercise;

import java.io.*;
import java.awt.*;
import java.awt.event.*;
import java.beans.EventHandler;

public class ChatWin extends Frame {
	String nickname = "";
	TextArea ta = new TextArea();
	Panel p = new Panel();
	TextField tf = new TextField(30);
	Button bSave =new Button("저장");
	
	ChatWin(String nickname){
		super("Chatting");
		this.nickname = nickname;
		
		setBounds(200,100,300,200);
		
		p.setLayout(new FlowLayout());
		p.add(tf);
		p.add(bSave);
		
		add(ta,"Center");
		add(p,"South");
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		bSave.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				FileDialog fileSave = new FileDialog(ChatWin.this, "파일저장", FileDialog.SAVE);
				fileSave.setVisible(true);
				String fileName = fileSave.getDirectory() + fileSave.getFile();
				saveAs(fileName);
			}
		});
		
		EventHandler handler = new EventHandler();
		ta.addFocusListener(handler);
		tf.addFocusListener(handler);
		tf.addActionListener(handler);
		
		ta.setText("#"+nickname+"님 즐거운 채팅되세요.");
		ta.setEditable(false);
		
		setResizable(false);
		setVisible(true);
		tf.requestFocus();
	}
	
	void saveAs(String fileName){

		
		try ( FileWriter fw= new FileWriter(fileName);
				BufferedWriter bw = new BufferedWriter(fw)){

			bw.write(ta.getText());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		if(args.length!=1){
			System.out.println("USAGE : java ChatWin NICKNAME");
			System.exit(0);
		}
		new ChatWin(args[0]);
	}
	
	class EventHandler extends FocusAdapter implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			String msg = tf.getText();
			if("".equals(msg)) return;
			
			ta.append("\r\n" + nickname + ">" + msg);
			tf.setText("");
		}
		
		public void focusGained(FocusEvent e){
			tf.requestFocus();
		}
	}
}


