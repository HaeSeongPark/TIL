var sum = 0;

for( var i =1; i<=50; i++)
{
	sum += i;
}

(function(){
	for( var i =1; i<=5; i++)
	{
		console.log(i);
	}
})();


for(; i<=100; i++)
{
	sum += i;
}

console.log(sum);

setTimeout(
	function(){
		console.log("timeout");
	});