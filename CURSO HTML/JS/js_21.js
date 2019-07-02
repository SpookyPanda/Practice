function sleepIn(weekday, vacation){
  if (weekday == true && vacation == false){
    return false;
  }else{
    return true;
  }
}

function monkeyTrouble(aSmile, bSmile) {
  if ((aSmile && bSmile) || (!aSmile && !bSmile)){
    return true;
  }else {
    return false;
  }
}

function stringTimes(str, n){
  n=Math.abs(n);
  while (n>0){
    console.log(str);
    n--
  }
}

function luckySum(a,b,c){
  if (a === 13){
    return 0;
  }else if(b === 13){
  return a;
  }else if (c === 13){
    return a+b;
  }else {
    return a+b+c;
  }
}

function caught_speeding(speed, isBirthday){
  if (isBirthday){
    speed=speed-5
  }
  if(speed <= 60){
    return 0;
  }else if (speed>60 && speed <= 80){
    return 1;
  }else{
    return 2;
  }
}

function makeBricks(s,m,goal){
  if (((m*5) + s) < goal){
    console.log("not possible");
  }

  var sum=0;
  var med=0;
  var small=0;

  while (m>0){
    if ((sum + 5) > goal) {
      break;
    }else{
      sum+=5
      m--
      med++
    }
  }

  while (s > 0){
    if ((sum + 1) > goal) {
      break;
    }else {
      sum++
      s--
      small++
    }
  }

  if (sum == goal) {
    return console.log("it's possible with " + med + " medium bricks and " + small + " small bricks");
  }else {
    console.log("the closest you can go is " + sum);
    console.log("with " + med + " medium and " + small + " small bricks");
  }
}
