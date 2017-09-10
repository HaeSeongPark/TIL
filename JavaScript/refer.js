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
var a = {'id':1};
function func(b) {
	b.id = 2;
}
func(a);
console.log(a.id);
