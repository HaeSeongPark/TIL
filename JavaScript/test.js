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
var HTMLworkEmployer = '<a href="#">%data%';
console.log(HTMLworkEmployer.replace("#","hello nature").replace("%data%",".net"));