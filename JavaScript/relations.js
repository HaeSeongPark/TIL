function getRelationship(x, y) {
	var isXnumber = ((typeof x) === "number") ? (isNaN(x) ? false : true) : false;
	var isYnumber = ((typeof y) === "number") ? (isNaN(y) ? false : true) : false;
	if(isXnumber && isYnumber)
		return (x===y) ? "=" : (x>y) ? ">" : "<";
	else if(!isXnumber && !isYnumber)
		return "Can't compare relationships because " + x +" and " + y + " are not numbers";
	else if(!isXnumber && isYnumber)
		return "Can't compare relationships because " + x +" is" + " not a number";
	else if(isXnumber && !isYnumber)
		return "Can't compare relationships because " + y +" is" + " not a number"; 	
}
console.log(getRelationship(1,1));
console.log(getRelationship(1,4));
console.log(getRelationship("that",2));
console.log(getRelationship("this"," something else"));
console.log(getRelationship(3));
console.log(getRelationship("hi"));
console.log(getRelationship(NaN));
console.log(getRelationship(NaN, undefined));