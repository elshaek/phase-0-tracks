// create a function that takes a string as a parameter and reverses the string:
// create a new variable to store the new string
// use a loop to get to each character in the string, starting from the last character
// decrement the loop to move to the previous character
// store each character in the new variable for each loop
// return new variable with reversed string

function reverse(str){
	var reversedStr = "";
	for (i = str.length-1; i > -1; i--){
		reversedStr += str[i];
	}
	return reversedStr
}

console.log(reverse("hello"));