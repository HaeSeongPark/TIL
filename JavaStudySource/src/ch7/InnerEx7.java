package ch7;

import java.awt.*;
import java.awt.event.*;

public class InnerEx7 {
		public static void main(String[] args) {
			Button b = new Button("Start");
			b.addActionListener(new Eventhandler());
		}
}
class Eventhandler implements ActionListener{
	public void actionPerformed(ActionEvent e){
		System.out.println("ActionEvent Occurred");
	}
}