function add() {
  roster.push(prompt("Name to add"));
}

function remove() {
  roster.splice(roster.indexOf(prompt("Name to remove")),1);
}

function display() {
  console.log(roster);
}

var roster=[]
var request=prompt("Would you like to start the app? y/n");

if (request === "y"){
  while (true) {
    request=prompt("What would you like to do?\nadd/remove/diplay/quit");

    if (request == "add") {
      add();
    }else if (request == "remove") {
      remove();
    }else if (request == "display") {
      display();
    }else if (request == "quit") {
      break;
    }
  }
}
