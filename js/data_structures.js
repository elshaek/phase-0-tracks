var colors = ["red", "green", "blue", "yellow"];
var names = ["Ed", "Hilbert", "Unicorn", "Pony"];
var horses = {};

colors.push("purple");
names.push("Alex");

console.log(colors);
console.log(names);

for (var i = 0; i < colors.length; i++) {
  horses[names[i]] = colors[i];
}

console.log(horses);

function Car(color, model, make){

  this.color = color;
  this.model = model;
  this.make = make;

  this.turbo = function () {
    console.log("Vroom Vroom!");
  }

}

var newcar = new Car("black", "Toyota", "Prius");
console.log(newcar.color + " " + newcar.model + " " + newcar.make + ".");
newcar.turbo();

var newcar2014 = new Car("blue", "Honda", "Civic");
console.log(newcar2014.color + " " + newcar2014.model + " " + newcar2014.make + ".");
newcar2014.turbo();

var newcar2015 = new Car("white", "Hyundai", "Something");
console.log(newcar2015.color + " " + newcar2015.model + " " + newcar2015.make + ".");
newcar2015.turbo();

/* Release 3 research with prototypes.
Car.prototype.seats=5;
console.log(newcar.seats);
console.log(newcar2014.seats);
console.log(newcar2015.seats);
Car.prototype.seats = "fishsticks";
console.log(newcar.seats);
console.log(newcar2014.seats);
console.log(newcar2015.seats);
newcar2015.seats = 2;
console.log(newcar.seats);
console.log(newcar2014.seats);
console.log(newcar2015.seats);

var newcar2016 = new Car("silver", "Toyota", "Corolla");
console.log(newcar2016.seats);
console.log(newcar2016.hasOwnProperty('seats'));
*/