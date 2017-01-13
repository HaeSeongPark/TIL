# Tip
- Singleton pattern template 만들기
	- 이클립스에서 Window - Preferences - java - Editor - Templates - New - 새로운 Template 추가
```java
private static ${enclosing_type} instance = new ${enclosing_type}();

private ${enclosing_type}() {}

public static ${enclosing_type} getInstance(){
    if(null == instance){
        instance = new ${enclosing_type}();
    }
    return instance;
}
// 위와 같이 해주시고 sing정보만 치고 Ctrl + Sapce를 하면 템플릿을 적용할 수 있다.
```
[출처](http://vicki.tistory.com/611)
