// var sampleArray = [0,0,7];
// var incrementLastArrayEleent = function (_array) {
// 	var newArray = [];
// 	newArray = _array.slice(0);
// 	var lastNumber = newArray.pop();
// 	newArray.push(lastNumber+1);
// 	console.log("_array : ", _array);
// 	return newArray;
// }
// console.log(incrementLastArrayEleent(sampleArray));

var name = "AlbERt EINstEiN";
function nameChanger(oldName) {
	// var finalName = oldName.split(" ");
	// var firstName = finalName[0];
	// var lastName = finalName[1];

	// var toLowerCasedFirstname = firstName.toLowerCase();
	// var toUpperCasedLastName = lastName.toUpperCase();

	// finalName = firstName.charAt(0).toUpperCase() 
	// 			+ toLowerCasedFirstname.slice(1) 
	// 			+ " "
	// 			+ toUpperCasedLastName;
	var names = oldName.split(" ");
	names[1] = names[1].toUpperCase();
	names[0] = names[0].slice(0,1).toUpperCase() + names[0].slice(1).toLowerCase();
	var finalName = names.join(" ");
	return finalName;
}
console.log(nameChanger(name));
