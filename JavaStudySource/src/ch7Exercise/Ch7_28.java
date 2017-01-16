package ch7Exercise;

import java.awt.*;
import java.awt.event.*;

//public class Ch7_28 {
//public static void main(String[] args) {
//	Frame f = new Frame();
//	f.addWindowListener(new EventHandelr());
//}
//}
//
//class EventHandelr extends WindowAdapter{
//public void windowClosing(WindowEvent e){
//	e.getWindow().setVisible(false);
//	e.getWindow().dispose();
//	System.exit(0);
//}
//}

public class Ch7_28 {
	public static void main(String[] args) {
		Frame f = new Frame();
		f.addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e){
				e.getWindow().setVisible(false);
				e.getWindow().dispose();
				System.exit(0);
			}
		});
	}
}
