package ch7_Exercise;

import java.awt.*;
import java.awt.event.*;
/*
 * Envent Handler를 익명 클래스로 변경하기
 */

public class Ch7_28 {
	public static void main(String[] args) {
		Frame f = new Frame();
		f.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				e.getWindow().setVisible(false);
				e.getWindow().dispose();
				System.exit(0);
			}
		});
	}
}

//class EventHandler extends WindowAdapter {
//	public void windowClosing(WindowEvent e) {
//		e.getWindow().setVisible(false);
//		e.getWindow().dispose();
//		System.exit(0);
//	}
//}
// public class Ch7_28 {
// public static void main(String[] args) {
// Frame f = new Frame();
// f.addWindowListener(new EventHandler());
// }
// }
//
// class EventHandler extends WindowAdapter{
// public void windowClosing(WindowEvent e){
// e.getWindow().setVisible(false);
// e.getWindow().dispose();
// System.exit(0);
// }
// }