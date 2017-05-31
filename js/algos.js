// 7.3 Release 0: Find the Longest Phrase
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

// 7.3 Release 1: Find a Key-Value Match
// write a function that takes two objects and checks to see if the objects share at least one key-value pair.

// create a boolean variable (starting with false)
// use a loop to go through each key-value pair in Object1
// for each key-value pair in Object1, create a nested loop to compare to each key-value pair in Object2
// if any key-value pair matches, return true
// otherwise return false

function compareObject(object1, object2){
	match = false;
	for (var name1 in object1) {
		for (var name2 in object2) {
			if (name1 == name2 && object1[name1] == object2[name2]) {
				match = true;
			}
		}
	}
	return match;
}


// DRIVER CODE

// 7.3 Release 0: Find the Longest Phrase
var phrases = ["long phrase","longest phrase","longer phrase"];
console.log(longestPhrase(phrases));

var randomLetters = ["hfksogvjf","qwertyuiosdfgh","erghjfghjdkjhgfdfghjk", "asdhgf"];
console.log(longestPhrase(randomLetters));

// 7.3 Release 1: Find a Key-Value Match
console.log(compareObject({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
console.log(compareObject({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}));
console.log(compareObject({name: "Steven", age: 54}, {animal: "Dog", legs: 3}));