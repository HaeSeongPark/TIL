function eventHandler() 
{
	console.log("eventHandler");
	function innerFunction() 
	{
		console.log("innerFunction");
	}
	for (var i = 0; i < 2; i++) {
		innerFunction();
	}
}