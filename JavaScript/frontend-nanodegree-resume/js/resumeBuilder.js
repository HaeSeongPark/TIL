/*
This is empty on purpose! Your code to build the resume will go here.
 */
// jQuery 사용하지 않고 순수자바스크립트로 해보기

// skills 자세히 추가 
var bio = {
 	"name" : "HaeSeong Park",
 	"role" : "FrontEnd Developer",
 	"contacts":{
 		"mobile":"010-7107-9042",
 		"email":"cord7894@gmail.com",
 		"github":"HaeSeongPark",
 		"location":"Seoul"
 	},
 	"welcomeMessage" : "Hi",
 	"skills" : ["javascript", "java&android", "swift&ios"],
 	"bioPic":"images/fry.jpg"
 }

bio.display = function(){
	var formattedName = HTMLheaderName.replace("%data%",bio.name),
		formattedRole = HTMLheaderRole.replace("%data%",bio.role),
		formattedPhoto = HTMLbioPic.replace("%data%",bio.bioPic),
		formattedMobile = HTMLmobile.replace("%data%",bio.contacts.mobile),
		formattedEmail = HTMLemail.replace("%data%",bio.contacts.email),
		formattedGithub = HTMLgithub.replace("%data%",bio.contacts.github),
		formattedLocation = HTMLlocation.replace("%data%",bio.contacts.location);

	$("#header").append(formattedName)
				.append(formattedRole)
				.append(HTMLTopContacts)
			    .append(formattedPhoto)
			    .append(HTMLskillsStart);

	$("#topContacts").append(formattedMobile)
					 .append(formattedEmail)
					 .append(formattedGithub)
					 .append(formattedLocation);

	// skills
    if (bio.skills.length > 0) {
        for (skill in bio.skills) {
            if (bio.skills.hasOwnProperty(skill)) {
                formattedSkill = HTMLskills.replace("%data%", bio.skills[skill]);
                $(skills).append(formattedSkill);
            }
        }
    }
};

var works = {
	"jobs":[
		{
			"employer":"Hello Nature",
			"title":"FrontEnd Developer",
			"location":"28, Gangnam-daero 160-gil, Gangnam-gu, Seoul, Republic of Korea",
			"dates":"Sep 20th, 2017",
			"description":"first job",
			"url":"http://www.hellonature.net"
		}
	]
}

works.display = function(){
	works.jobs.forEach(function(work){
		var formattedworkLocation = HTMLworkLocation.replace("%data%",work.location),
		 	formattedworkEmployer = HTMLworkEmployer.replace("%data%",work.employer).replace("#",work.url),
		    formattedworkTitle = HTMLworkTitle.replace("%data%",work.title),
		    formattedworkEmployerTitle = formattedworkEmployer + formattedworkTitle,		
		    formattedworkDates = HTMLworkDates.replace("%data%",work.dates),
		    formattedworkDescription = HTMLworkDescription.replace("%data%",work.description);
		
 		$("#workExperience").append(HTMLworkStart);

 		$(".work-entry:last").append(formattedworkLocation)
							 .append(formattedworkEmployerTitle)
							 .append(formattedworkDates)
							 .append(formattedworkDescription);
	});
};
// 배포하면 링크추가, 안드 ios 웹 등 이력서에 있는 것 추가
var projects = {
    "projects":
    	[
            {
                "title":"resume with udacity nanodegree",
                "dates":"Sep 10th, 2017 ~ ",
                "description":"first web frondend projcets, result:this page",
                "images": [],
                "link": ""
            }
        ]
}
projects.display = function(){
	projects.projects.forEach(function(project){
		var formattedprojectTitle = HTMLprojectTitle.replace("%data%",project.title),
			formattedprojectDates = HTMLprojectDates.replace("%data%",project.dates),
			formattedprojectDescription = HTMLprojectDescription.replace("%data%",project.description);

		$("#projects").append(HTMLprojectStart);
		$(".project-entry:last").append(formattedprojectTitle)
								.append(formattedprojectDates)
								.append(formattedprojectDescription);

		/*
		if (projects.projects[project].images/length > 0) {
			for(image in projects.projects[project].images){
				var formattedImage = HTMLprojectImage.replace("%data%",projects.projects[project].images[image]);
				$(".project-entry:last").append(formattedImage);
			}
		}
		*/

	});
};

// 온라인 클래스 들은 것 추가 
var education = {
	"schools":[
		{
			"name":"Incheon National University",
			"location":"Songdo,Incheon",
			"degree": "Bachelor",
			"majors": "CS",
			"url":"http://www.inu.ac.kr",
			"dates" : "From: 2010.03 ~ To: 2017.08" 
		}
	],
	"onlineCourses":[
		{
			"title": "JavaScript Syntax",
			"school" : "Udacity",
			"dates" : 2014,
			"url":"http://dfd.com"
		}
	]
}
education.display = function(){
	education.schools.forEach(function(school){
		var formattedSchoolName = HTMLschoolName.replace("%data%",school.name)
												.replace("#",school.url),
			formattedSchoolDegree = HTMLschoolDegree.replace("%data%",school.degree),
			formattedSchoolNameDegree = formattedSchoolName + formattedSchoolDegree,
			formattedSchoolLocation = HTMLschoolLocation.replace("%data%",school.location);
			formattedSchoolDates = HTMLschoolDates.replace("%data%",school.dates);
			formattedSchoolMajors = HTMLschoolMajor.replace("%data%",school.majors);

		$("#education").append(HTMLschoolStart)
					   .append(HTMLonlineClasses);
		
		$(".education-entry:last").append(formattedSchoolNameDegree)
								  .append(formattedSchoolLocation)
								  .append(formattedSchoolDates)
								  .append(formattedSchoolMajors);

	});
}

var menu = {
   "menu": [
      { 
         "title": "work",
         "link": "#workExperience"
      },
      {
         "title": "education",
         "link": "#education"
      },
      {
         "title": "projects",
         "link": "#projects"
      },
      {
         "title": "map",
         "link": "#mapDiv"
      },
      {
         "title": "let's talk",
         "link": "mailto:benedettologiudice@gmail.com"
      }
   ]
};

menu.display = function () {
    'use strict';
    var i=0, entry="", toptitle="", y=0;
    $("nav").append("<ul id=\"navmenu\">");
    //alert(menu.menu.length);
    for (i=0; i<menu.menu.length; i=i+1) {
       //alert(menu.menu[i].type);
       entry = '<li><a href="'+menu.menu[i].link+'">'+menu.menu[i].title+'</a></li>';
          // console.log(entry);
          $("#navmenu:last").append(entry);
    }
};

/////////// main /////////////////////////////////////
// menu.display();
bio.display();
works.display();
projects.display();
education.display();

/*
var work = {
  "jobs": [
    {
      "employer": "Udacity",
      "title": "Course Developer",
      "location": "Mountain View, CA",
      "dates": "Feb 2014 - Current",
      "description": "Who moved my cheese cheesy feet cauliflower cheese. Queso taleggio when the cheese comes out everybody's happy airedale ricotta cheese and wine paneer camembert de normandie. Swiss mozzarella cheese slices feta fromage frais airedale swiss cheesecake. Hard cheese blue castello halloumi parmesan say cheese stinking bishop jarlsberg."
    },
    {
      "employer": "LearnBIG",
      "title": "Software Engineer",
      "location": "Seattle, WA",
      "dates": "May 2013 - Jan 2014",
      "description": "Who moved my cheese cheesy feet cauliflower cheese. Queso taleggio when the cheese comes out everybody's happy airedale ricotta cheese and wine paneer camembert de normandie. Swiss mozzarella cheese slices feta fromage frais airedale swiss cheesecake. Hard cheese blue castello halloumi parmesan say cheese stinking bishop jarlsberg."
    },
    {
      "employer": "LEAD Academy Charter High School",
      "title": "Science Teacher",
      "location": "Nashville, TN",
      "dates": "Jul 2012 - May 2013",
      "description": "Who moved my cheese cheesy feet cauliflower cheese. Queso taleggio when the cheese comes out everybody's happy airedale ricotta cheese and wine paneer camembert de normandie. Swiss mozzarella cheese slices feta fromage frais airedale swiss cheesecake. Hard cheese blue castello halloumi parmesan say cheese stinking bishop jarlsberg."
    },
    {
      "employer": "Stratford High School",
      "title": "Science Teacher",
      "location": "Nashville, TN",
      "dates": "Jun 2009 - Jun 2012",
      "description": "Who moved my cheese cheesy feet cauliflower cheese. Queso taleggio when the cheese comes out everybody's happy airedale ricotta cheese and wine paneer camembert de normandie. Swiss mozzarella cheese slices feta fromage frais airedale swiss cheesecake. Hard cheese blue castello halloumi parmesan say cheese stinking bishop jarlsberg."
    }
  ]
};
*/