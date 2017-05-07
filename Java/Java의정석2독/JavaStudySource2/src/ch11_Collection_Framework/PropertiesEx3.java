package ch11_Collection_Framework;

import java.io.FileOutputStream;
import java.util.Properties;

public class PropertiesEx3 {
	public static void main(String[] args) {
		Properties prop = new Properties();
		
		prop.setProperty("timeout", "30");
		prop.setProperty("language", "kr");
		prop.setProperty("ªÁ¿Ã¡Ó", "10");
		prop.setProperty("capacity", "10");
		
		try {
			prop.store(new FileOutputStream("output.txt"), "Properties Example");
			prop.storeToXML(new FileOutputStream("output.xml"), "Properties Example");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
