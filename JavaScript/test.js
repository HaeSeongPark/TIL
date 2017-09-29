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
"use strict";
var hasStrictMode = (function() {
	return this===undefined
}());
console.log(hasStrictMode);

var o = { x : 1 };
console.log( o && o.x );