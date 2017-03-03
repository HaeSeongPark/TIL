> 출처 : 자바의 정석

# Java IO 7. 직렬화(Serialization)
## 1. 직렬화란(Serialization)란?
* 객체를 '연속적인 데이터'로 변환하는 것. 반대과정은 '역직렬화'라고 한다.
* 객체의 인스턴수변수들의 값을 일렬로 나열하는 것
* 객체를 저장하기 위해서는 객체를 직렬화해야 한다.
* 객체를 저장한다는 것은 객체의 모든 `인스턴스변수`의 값을 저장하는 것

## 2. ObjectInputStream, ObjectOutputStream
* 객체를 직렬화하여 입출력할 수 있게 해주는 보조스트림
```java
	ObjectInputStream(InputStream in)
    ObjectOutputStream(OutputStream out)
```
* 객체를 파일에 저장하는 방법
```java
	FileOutputStream fos = new FileOutputStream("objectfile.ser");
    ObjectOutputStream out = new ObjectOutputStream(fos);
    
    out.writeObject(new UserInfo());
```
* 파일에 저장된 객체를 다시 읽어오는 방법
```java
	FileInputStream fis = new FileInputStream("objectfile.ser");
    ObjetctInputStream in = new ObjectInputStream(fis);
    
    UserInfo info = (UerInfo)in.readObject();
```
* ObjectInputStream과 ObjectOutputStream의 메서드
![Java.io ObjectInputStream ObjectOuputStream.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.io%20ObjectInputStream%20ObjectOuputStream.png)

## 3. 직렬화 가능한 클래스 만들기
* java.io.Serializable을 구현해야만 직렬화가 가능하다.
```java
	public interface Serializable{}
    --------------
	public class UserInfo implements java.io.Serializable{
    	String name;
        String password;
        int age;
     }
```
* 제어자 transient가 붙은 인스턴스변수는 직렬화 대상에서 제외된다.
```java
	public class UserInfo implements Serialzable{
    	String name;
        transient String password; // 직렬화 대상에서 제외된다.
        int age;
      }
```
* Serializable을 구현하지 않은 클래스의 인스턴스도 직렬화 대상에서 제외
```java
	public class UserInfo implements Serializable{
    	String name;
        transient String password;
        int age;
        
        Object obj = new Object(0); // Object객체는 직렬화할 수 없다.
    }
```
* Serializable을 구현하지 않은 조상의 멤버들은 직렬화 대상에서 제외
```java
	public class SuperUserInfo{
    	String name; // 직렬화되지 않는다.
        String password; // 직렬화되지 않는다.
     }
     public class UserInfo extends SuperUserInfo implements Serializable{
     	int age;
     }
```
* readObject()와 writeObject()를 오버라이딩하면 직렬화를 내마음대로...
```java
	private void writeObject(ObjectOutputStream out) throws IOException{
    	out.writeUTF(name);
        out.writeUTF(password);
        out.defaultWriteObject();
    }
    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException{
    	name = in.readUTF();
        password = in.readUTF();
        in.defaultReadObject();
     }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/UserInfo2.java)

## 4. 직렬화 가능한 클래스의 버전관리
* 직렬화했을 때와 역직렬화했을 때의 클래스가 같은지 확인할 필요가 있다.
```java
	java.io.InvalidclassException : UserInfo; local class incompatible : stream
    classdesc serialVersionUID = 6953673583338942489, local class
    serialVersionUID = -6256164443556992367
```
* 직렬화할 때, 클래스의 버전(serialVersionUID)을 자동계산해서 저장한다.
* 클래스의 버전을 수동으로 관리하려면, 클래스 내에 정의해야 한다.
```java
	static fianl long serialVersionUID = 3519731767529258119L;
    int value1;
  }
```
* serialver.exe는 클래스의 serialVersionUID를 자동생성
```java
	c:\jdk1.5\work\ch14>serialver MyData
    MyData ; static final serialVersionUID = 3519731767529258119L;
```
