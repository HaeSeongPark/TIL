var featuredworks = {
	"featuredworks":[
		{
			"imgUrl":"http://placehold.it/555x300",
			"dataTarget":"#project1",
			"title":"Appify",
			"linkUrl":"http://github.com"
		},
		{
			"imgUrl":"http://placehold.it/555x300",
			"dataTarget":"#project1",
			"title":"Appify",
			"linkUrl":"http://github.com"
		},
		{
			"imgUrl":"http://placehold.it/555x300",
			"dataTarget":"#project1",
			"title":"Appify",
			"linkUrl":"http://github.com"
		},
		{
			"imgUrl":"http://placehold.it/555x300",
			"dataTarget":"#project1",
			"title":"Appify",
			"linkUrl":"http://github.com"
		},
		{
			"imgUrl":"http://placehold.it/555x300",
			"dataTarget":"#project1",
			"title":"Appify",
			"linkUrl":"http://github.com"
		}
	]
}
featuredworks.display = function(){
	'use strict';
	var rowCount = 0;
	var colCount = 0;
	featuredworks.featuredworks.forEach(function(work){
		var numberedFeaturedWorkStart = HTMLfeaturedWorkStart.replace("%num%",rowCount),
			formattedFeaturedWorkImg = HTMLfeaturedWorkImg.replace("%data%",work.imgUrl),
			formattedFeaturedWorkTItle = HTMLfeaturedWorkTitle.replace("%data%",work.title),
			formattedFeaturedWorkLink = HTMLfeaturedWorkLink.replace("%data%",work.linkUrl);

		var rowCountClass = '.row'+rowCount;

		if( rowCount===0 && rowCount%2 === 0 ) 
		{
			$(".container:last").append(numberedFeaturedWorkStart);
			rowCount++;
		}

		var rowFloorCountClass = '.row'+Math.floor(rowCount/2);
		var formattedclomd6Start = HTMLcolmd6Start.replace("%data%",colCount);
		$(rowFloorCountClass).append(formattedclomd6Start);

		var rowcolCountClass = rowFloorCountClass+ " .col" + colCount;
		console.log(rowcolCountClass);
		$(rowcolCountClass).append(formattedFeaturedWorkImg)
						   .append(formattedFeaturedWorkTItle)
						   .append(formattedFeaturedWorkLink);

		colCount++;
	});
};

featuredworks.display();