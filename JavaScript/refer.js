// var a = {'id':1}
// var b = a
// b.id = 2
// console.log(a.id)
//
// var a = 1;
// function func(b) {
// 	b = 2;
// }
// func(a);
// console.log(a);
//
// var a = {'id':1};
// function func(b) {
// 	b = {'id':2};
// }
// func(a);
// console.log(a.id); // 1
// var a = {'id':1};
// function func(b) {
// 	b.id = 2;
// }
// func(a);
// console.log(a.id);


// 오늘 날짜 얻기
var popup_time = new Date ();

// 오늘 요일 얻기, javascript는 0 (Sun) to 6 (Sat)이다
// 따라서 계산하기 편하게 0(mon) to 6(sun)으로 바꿈
var dayOfToday = (popup_time.getDay() === 0) ? 6 : popup_time.getDay() - 1;

// 월~일 -> 월요일로 : 해당 날짜에서 요일번호를 빼면 됨 ex) 9일 - 0(월요일) = 9, 10일 - 1 (화요일) = 9
// 비고 월요일 오전 10시 전에는 0이 아닌 7을 빼야 함
if (dayOfToday === 0 && popup_time.getHours() < 10) dayOfToday = 7;
popup_time.setDate(popup_time.getDate() - dayOfToday);

// 20171009 형태로 만들기
var popup_time_string = popup_time.getFullYear();
	popup_time_string += (popup_time.getMonth()+1 < 10 ? "0" : "") + (popup_time.getMonth()+1);
	popup_time_string += (popup_time.getDate() < 10 ? "0" : "") + popup_time.getDate();

console.log("ppopup_time_string : " + popup_time_string);

