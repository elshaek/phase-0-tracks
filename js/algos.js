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
	var match = false;
	for (var name1 in object1) {
		for (var name2 in object2) {
			if (name1 == name2 && object1[name1] == object2[name2]) {
				match = true;
			}
		}
	}
	return match;
}

// 7.3 Release 2: Generate Random Test Data

// create a function that takes an integer for length, and builds and returns an array of strings of the given length
// the words generated should be of randomly varying length, with a minimum of 1 letter and a maximum of 10 letters.
// create an empty array variable
// create an array of 10 words that have lengths of 1 to 10
// use a loop to add string to the array variable as many times as per the number in the argument
// for each loop, generate a random number between 0 to 9
// use the random number to retrieve a word from the array of 10 words

function randomTestData(numberOfWords) {
	var wordArray = [];
	var wordList = ["a", "bg", "ert", "ighf", "chjfn", "oghtds", "ufhggeg", "hgdkcdjk", "jydfbksjd", "yterdbfmjg"];

	for (i = 0; i < numberOfWords; i++) {
		var randomNumber = Math.floor((Math.random() * 10));
		wordArray.push(wordList[randomNumber]);
	}
	return wordArray;
}


// DRIVER CODE

console.log("7.3 Release 0: Find the Longest Phrase\n");
var phrases = ["long phrase","longest phrase","longer phrase"];
console.log(longestPhrase(phrases));

var randomLetters = ["hfksogvjf","qwertyuiosdfgh","erghjfghjdkjhgfdfghjk", "asdhgf"];
console.log(longestPhrase(randomLetters));
console.log("========================");


console.log("7.3 Release 1: Find a Key-Value Match\n");
console.log(compareObject({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
console.log(compareObject({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}));
console.log(compareObject({name: "Steven", age: 54}, {animal: "Dog", legs: 3}));
console.log("========================");


console.log("7.3 Release 2: Generate Random Test Data\n");
for (num = 0; num < 10; num++) {
	console.log("Array " + (num+1));
	var generatedArray = randomTestData(Math.floor((Math.random() * 9)+2)); // generate random number between 2 and 10
	console.log(generatedArray);
	console.log("The longest word is: " + longestPhrase(generatedArray) + "\n");
}