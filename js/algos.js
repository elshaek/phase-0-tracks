// Write a function that takes an array of words or phrases and returns the longest word or phrase in the array. 

// use a loop to go through each item in the array
// create a new variable to store a string (starting with "")
// create a new variable to store an integer (starting with 0)
// for each item, find the length and store in the integer variable, and store the current element in the string variable
// if the length of the current element is longer than the previously stored element,
// replace the previously stored length with the current length, previously stored string with the current string

function longestPhrase(str) {
	var strLength = 0;
	var longestStr = "";
	
	for (i = 0; i < str.length; i++) {
		if (str[i].length > strLength){
			strLength = str[i].length;
			longestStr = str[i];
		}
	}
	return longestStr;
}

// DRIVER CODE
var phrases = ["long phrase","longest phrase","longer phrase"];
console.log(longestPhrase(phrases));

var randomWords = ["hfksogvjf","qwertyuiosdfgh","erghjfghjdkjhgfdfghjk", "asdhgf"];
console.log(longestPhrase(randomWords));