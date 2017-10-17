// var featuredworks = {
// 	"featuredworks":[]
// }

var req = new XMLHttpRequest();
req.onreadystatechange = function a()
{
	console.log(this.readyState, this.status);
	if(this.readyState === 4)// && this.status === 0
	{
		var data = JSON.parse(this.response);
		featuredworks.featuredworks = data;
		console.log(featuredworks.featuredworks);
	}
}
req.open("GET","data/data.txt");
req.send();