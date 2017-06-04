# Broadcast Receiver
* 시간대 변경, 배터리 부족, 언어 설정 변경 등 특정 브로드캐스트에 반응하는 컴포넌트
* 사용자 인터페이스를 가지고 있지 않다.
* 이러한 브로드캐스트를 받으면 브로드캐스트 리시버는 이를 처리하고 다시 대기 모드
* 10초 이내의 작업만을 보증하므로
* 오랜 시간 동작해야 한다면 별도의 쓰레드로 처리하거나 서비스에 구현해야 한다.
```java
public class MyReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
    }
}
```
