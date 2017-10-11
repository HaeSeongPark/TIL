// var projects = {
//     "projects":
//     	[
//             {
//                 "title":"resume with udacity nanodegree",
//                 "dates":"2017",
//                 "description":"first projcets",
//                 "images": ["images/197x148.gif"],
//                 "link": "http://www.webificio.it/dboard"
//             }
//         ]
// }

// projects.display = function(){
// 	projcets.projects.forEach(function(project){
// 		$("#projects").append(HTMLprojectStart);
// 		var formattedprojectTitle = HTMLprojectTitle.replace("%data%",project.title);
// 		$(".project-entry:last").append(formattedprojectTitle);
// 	});
// };

// projects.display();
// var HTMLworkEmployer = '<a href="#">%data%';
// console.log(HTMLworkEmployer.replace("#","hello nature").replace("%data%",".net"));

// var s = "hello world!";
// var word = s.substring(s.indexOf(" ")+1, s.length);
// console.log(word);

// var x = 1,
// 	y = 2;
// [x,y] = [y,x];
// console.log(x+" "+y);

// function test()
// {
// 	var i = 0;
// 	if (true)
// 	{
// 		var j = 0;
// 		for(var k=0; k<10; k++)
// 		{
// 			console.log("k"+k); //0~9
// 		}
// 		console.log(k);  // 10
// 	}
// 	console.log(j); // 0
// }
// test();

// function factorial(x){
// 	if (x<0) throw new Error("x must not be negative");
// 	for(var f = 1; x>1; f*=x, x--){}
// 	return f;
// }
// console.log(factorial(3));
// "use strict";
// var hasStrictMode = (function() {
// 	return this===undefined
// }());
// console.log(hasStrictMode);

// var o = { x : 1 };
// console.log( o && o.x );
	var cress = {
		pad:function(num, width){
			 num = num + '';
			 return num.length >= width ? num : new Array(width - num.length + 1).join('0') + num;
		}
	}

	// var popup_time = new Date (2017, 9, 13, 15)
	var popup_time = new Date ()

	var popup_time_string
	;(function(){
		if(popup_time.getDay() != 1){
			while(popup_time.getDay() !=  1) {
			console.log("not monday")
			popup_time.setDate(popup_time.getDate() - 1)
			}
		} else if (popup_time.getHours() < 10 ){
			popup_time.setDate(popup_time.getDate() - 7)
		}
		//20170707과 같은 형태로 변환 
		popup_time_string = String(popup_time.getFullYear()) + String(cress.pad((popup_time.getMonth() + 1),2)) + String(cress.pad(popup_time.getDate(),2));
	})()
console.log(popup_time_string);