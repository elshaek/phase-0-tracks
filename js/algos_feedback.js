/*

I felt that your pseudocode was particularly well thought out. I liked the fact that you first included a more general 
statement about the responsibility of the function and its input and output, and then broke that functionality down into 
smaller, more actionable bullet points that were structured very much like the body of a function. Just be careful that 
you are not overly specific about implementation details in your pseudocode, because this can actually lead you to building 
less efficient code. Things like the number of variables you are storing and how many loops you build are more 
code-specific implementation details that can cause you to write less efficient code. -OK

In your longestPhrase function, what is the purpose of storing both the length of the longest word and the longest word 
itself if you can use the length attribute of the string to check the length? If you are iterating over a relatively small 
amount of data and the data you are storing in a variable is subject to change often, you are not really making any gains 
by storing both the longest word and its length. Simply worry about storing the current longest word in the array. -OK

When you are looking for key/value pair matches between two objects, you actually do not need to use a nested loop. 
Consider what would happen inside your first loop if, instead of creating a second loop to iterate through all the keys 
in object2, you simply compared object1[name1] === object2[name1]. If name1 was not a key that existed in object2, the 
return value of object2[name1] would be undefined, and the comparison would return false. Therefore, you could accomplish 
the same task without a nested loop, which would greatly reduce the potential time complexity of this function. -OK

The other thing to consider in your compareObject function is when is the right time to return from the function. Right 
now, you don't return a result (even if you have found a match) until you finish iterating over all the keys in both the 
objects. What if you found a match on the first set of key/value pairs? You'd spend a bunch of time iterating over the 
rest of the key/value pairs when you already know that there is a match. Consider returning true from the function as soon 
as you find the first key/value pair match so that you do not have to delay returning from the function. -OK

In your randomTestData function, your "random words" are not totally random because they are hard-coded into your function. 
How can you dynamically generate a random word of a random length? It might be easier and fit the bill of a 
single-responsibility function if you created a separate function that used the alphabet to select a random amount of 
random letters and generate a random word from those letters. That way, you could call on that function from inside your 
existing randomTestData function without hard-coding your random words, and without adding a great deal of complexity to 
that function. -OK
*/

// 7.3 Release 0: Find the Longest Phrase
// Write a function that takes an array of words or phrases and returns the longest word or phrase in the array. 

// use a loop to go through each item in the array
// FOR each item, IF the length of the current element is longer than the previously stored element,
// replace the previously stored length with the current length, previously stored string with the current string
// return the longest string

function longestPhrase(str) {
	var longestStr = "";
	
	for (i = 0; i < str.length; i++) {
		if (str[i].length > longestStr.length){
			longestStr = str[i];
		}
	}
	return longestStr;
}

// 7.3 Release 1: Find a Key-Value Match
// write a function that takes two objects and checks to see if the objects share at least one key-value pair.

// use a loop to go through each key-value pair in Object1
// for each key-value pair in Object1, compare to each key-value pair in Object2
// if any key-value pair matches, return true
// otherwise return false

function compareObject(object1, object2){
	var match = false;
	for (var name1 in object1) {
		if (object1[name1] == object2[name1]) {
			match = true;
			break;
		}
	}
	return match;
}

// 7.3 Release 2: Generate Random Test Data

// create a function that takes an integer for length, and builds and returns an array of strings of the given length
// the words generated should be of randomly varying length, with a minimum of 1 letter and a maximum of 10 letters.
// use a loop to add string to the array variable as many times as per the number in the argument
// for each loop, generate a random number between 0 to 9
// use the random number to retrieve a word from the array of 10 words

function randomWordGenerator(wordLength) {
	var alphabets = "abcdefghijklmnopqrstuvwxyz";
	var word = "";
	for (i = 0; i < wordLength; i++){
		var randomIndex = Math.floor((Math.random() * 26));
		word += alphabets[randomIndex];
	}
	return word;
}

function randomTestData(numberOfWords) {
	var wordArray = [];

	for (j = 0; j < numberOfWords; j++) {
		var randomNumber = Math.floor((Math.random() * 10) + 1); // generate random number between 1-9 (inclusive)
		var randomWord = randomWordGenerator(randomNumber);
		wordArray.push(randomWord);
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
