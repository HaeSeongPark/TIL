> 출차 : https://kairo96.gitbooks.io/android/ch3.31.html
# layout
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/layout.PNG)
## ConstraintLayout
* 관련자료
  1. https://news.realm.io/kr/news/constraintlayout-it-can-do-what-now
  2. http://kunny.github.io/lecture/ui/2016/05/22/constraint_layout_1/
  3. http://www.kmshack.kr/2016/06/%EB%B9%A0%EB%A5%B4%EA%B3%A0-%EC%9C%A0%EC%97%B0%ED%95%9C-contraintlayout/

## LinearLayout
* 선형(수직, 수평)으로 뷰들을 관리하는 레이아웃을 말한다.
```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="horizontal" >

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="match_parent"
        android:layout_weight="2"
        android:background="#FFFF0000" />

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="match_parent"
        android:layout_weight="1"
        android:background="#FF00FF00" />

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="match_parent"
        android:layout_weight="1"
        android:background="#FF0000FF" />

</LinearLayout>
```
* orientation="horizontal" or "vertical"
* 수평, 수직으로 뷰들을 잽치
* laout_weight"1" : 가중치
* 배치 비율, 위에서는 적색 2칸, 나머지 한 칸 씩
* ![LinearLayout.png](https://github.com/HaeSeongPark/TIL/blob/master/img/android/LinearLayout.png)

## RelativeLayout
![RelativeLayout.png](https://github.com/HaeSeongPark/TIL/blob/master/img/android/RelativeLayout.png)
* 상대적 위치에 기반하여 뷰들을 배치하는 레이아웃
* 어떤 뷰의 왼쪽에 배치하거나 아래에 배치하는 방식
```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content" >

    <TextView
        android:id="@+id/label"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:paddingTop="15px"
        android:text="Name" />

    <EditText
        android:id="@+id/edit"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_toRightOf="@id/label" />

    <Button
        android:id="@+id/ok"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_below="@id/edit"
        android:layout_toLeftOf="@+id/cancel"
        android:text="OK" />

    <Button
        android:id="@+id/cancel"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentRight="true"
        android:layout_below="@id/edit"
        android:text="Cancel" />
</RelativeLayout>
```
* android:layout_toRightOf="@id/label"
   - 현재 뷰를 아이디가 label인 뷰의 오른쪽에 배치하라는 선언
* android:layout_toLeftOf="@id/label"
   - 현재 뷰를 아이디가 label인 뷰의 왼쪽 배치하라는 선언
* android:layout_below="@id/label"
   - 현재 뷰를 아이디가 label인 뷰의 아래에 배치하라는 선언
* android:layout_alignParentRight="true"
   - 현재 뷰를 부모 뷰의 오른쪽에 배치하라는 선언이다.
## FrameLayout
![FrameLayout.png](https://github.com/HaeSeongPark/TIL/blob/master/img/android/FrameLayout.png)
* 뷰들을 왼쪽 상단을 기준으로 배치하는 레이아웃(중첩)
```xml
<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent" >

    <Button
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:text="big_button" />

    <Button
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="small_button" />

</FrameLayout>
```

## TableLayout
![TableLayout.png](https://github.com/HaeSeongPark/TIL/blob/master/img/android/TableLayout.png)
* 테이블 형태로 뷰를 배치
* 테이블 형태로 일관되게 뷰를 배치할 수 있어 많은 뷰들을 배치하는 경우에 유용
* 리니어 레이아웃을 상속해서 만들어졌다.
```xml
<?xml version="1.0" encoding="utf-8"?>
<TableLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:stretchColumns="1" >

    <TableRow>

        <TextView android:text="Name" />

        <EditText
            android:id="@+id/edit"
            android:layout_span="3" />
    </TableRow>

    <View
        android:layout_height="2px"
        android:background="#FFFFFF" />

    <TableRow>

        <Button
            android:id="@+id/ok"
            android:layout_column="2"
            android:text="OK" />

        <Button
            android:id="@+id/cancel"
            android:text="Cancel" />
    </TableRow>

</TableLayout>
```
* android:stretchColumns="1"
   - 테이블 레이아웃에서 지정된 컬럼은 늘리고, 다른 컬럼은 속해 있는 뷰들을 표현할 수 있는 만큼의 크기만 갖게 하라는 속성, 이 속성에는 1이나 2처럼 다수의 컬럼 위치를 지정할 수도 있으며, "*"로 지정하여 전체 컬럼을 지정할 수도 있다.
* android:layout_span="3"
   - 이 속성은 지정된 개수만큼의 컬럼을 한 개의 컬럼으로 표시하라는 의미를 가진다. 그래서 "3"이라고 지정하면 3개의 뷰가 표시되는 컬럼을 모두 합쳐서 한 개의 뷰만 표시하는 것이 된다. 즉, 이 속성이 설정된 뷰는 다른 뷰보다 더 큰 크기를 가지게 된다
* android:layout_column="2"
   - 테이블 레이아웃에서 특정 컬럼 위치에 해당 뷰를 표시하라는 속성이다. "2"라고 지정하면 세 번째 컬럼 위치에 뷰를 표시하게 된다. 컬럼 위치는 0부터 시작한다.

## GridLayout
* 가상의 격자를 기준으로 아이템을 배치
* 테이블레이아웃과 비슷하지만 아이템을 순서대로 배치한다는 점이 다르다.
* 내부적으로 레이아웃 크기를 지정하기 때문에 layout_width, height를 지정할 필요없음
* 안드로이드 4.0에 도입됐으며 이하 버전에는 v7을 추가해서 사용해야 한다.
### 그리드 레이아웃의 주요속성
* cloumnCount 열의 최대 개수
* rowCount 행의 최대 개수
### 그리드 레이아웃의 ChidView 주요 속성
![GridLayout.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/android/GridLayout.PNG)
* layout_column="1" // 열의 위치
* layout_row="1"//행 위치
* layout_columnSpan="2" // 열이 차지할 칸수
* layout_rowSpan="2" // 행이 차지할 칸수
* layout_gravity="fill" // 뷰의 정렬 및 크기 지정(left, fill,_horizontal등)
```xml
<?xml version="1.0" encoding="utf-8"?>
<GridLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:columnCount="4"
    android:orientation="horizontal"
    android:useDefaultMargins="true"
    tools:context="com.rhino.study.layout.GridLayoutActivity">

    <!-- 컬럼4개, 방향수평, 자동마진처리-->

    <!-- 빈공간 차지, 컬럼과 로우 번호 0,0, 가로두칸(column)
    을 합치고 꽉채우겠다-->
    <Space
        android:layout_column="0"
        android:layout_columnSpan="2"
        android:layout_gravity="fill"
        android:layout_row="0"/>

    <Button
        android:layout_columnSpan="2"
        android:layout_gravity="fill"
        android:text="AC"/>

    <Button android:text="7"/>
    <Button android:text="8"/>
    <Button android:text="9"/>
    <Button
        android:layout_gravity="fill"
        android:layout_rowSpan="2"
        android:text="+"/>
    <Button android:text="4"/>
    <Button android:text="5"/>
    <Button android:text="6"/>

    <Button android:text="1"/>
    <Button android:text="2"/>
    <Button android:text="3"/>

    <Button
        android:layout_gravity="fill"
        android:layout_rowSpan="2"
        android:text="enter"
        android:textAllCaps="false"/>

    <Button
        android:layout_gravity="fill"
        android:layout_columnSpan="2"
        android:text="0"/>

    <Button android:text="."/>


</GridLayout>

```
