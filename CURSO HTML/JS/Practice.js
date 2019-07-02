alert("Hello,you will find a set of questions, it only tankes a few seconds");
var name = prompt("Please enter your first name");
var lname = prompt("Last name");
var age = prompt("Enter your age");
var height = prompt("How tall are you?");
var pet = prompt("What's your pet's name?");
var check = false;

if(name[0] == lname[0]){
  if (age > 20 && age < 30){
    if (height >= 170){
      if (pet[pet.length - 1] == "y")
      check = true;
    }
  }
}

alert("thanks");

if (check){
  console.log("Hello");
}else {
  console.log("Nothing to see here");
}
//log alert
