//Object.method()
var arr = ["a", "b", "c"];
console.log('Object.keys(arr)', Object.keys(arr));

//Object.prototype.method()
var o = new Object();
console.log('o.toString',o.toString());

var a = new Array(1,2,3);
console.log('a.toString',a.toString());

// Object 메소드 확장
Object.prototype.contain = function(needle) {	
	 for(var name in this){
	 	if(this[name] === needle){
	 		return true;
	 	}
	 }
	 return false;
};

var o = {'name':'egoing', 'city':'seoul'}
console.log(o.contain('egoing'));
var a = ['egoing','leezche','grapittie'];
console.log(a.contain('hhh'));


// Object 확장의 위험성
for(var name in o){
	console.log(name)
	/*
	name
	city
	contain
	*/
}
for(var name in o){
	if(o.hasOwnProperty(name)){
		console.log(name);
		/*name
		city
		*/
	}
}