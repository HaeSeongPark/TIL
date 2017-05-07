package ch15_IO;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamException;
import java.io.Serializable;

class SuperUserInfo {
	String name;
	String password;

	SuperUserInfo() {
		this("Unknown", "11111");
	}

	public SuperUserInfo(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}

}

public class UserInfo2 extends SuperUserInfo implements Serializable {
	int age;

	public UserInfo2() {
		this("Unknown", "1111", 0);
	}

	public UserInfo2(String name, String password, int age) {
		this.name = name;
		this.password = password;
		this.age = age;
	}
	
	public String toString(){
		return "(" + name +"," + password + "," + age +")";
	}
	
	private void writeObject(ObjectOutputStream out) throws Exception{
//		out.writeUTF(name);
//		out.writeUTF(password);
		out.defaultWriteObject();
	}
	private void readObject(ObjectInputStream in) throws Exception {
//		name = in.readUTF();
//		password = in.readUTF();
		in.defaultReadObject();
	}

}
