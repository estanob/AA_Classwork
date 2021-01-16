class Clock {
  constructor() {
    // 1. Create a Date object. +
    // 2. Store the hours, minutes, and seconds. +
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let date = new Date();
    this.h = date.getHours();
    this.m = date.getMinutes();
    this.s = date.getSeconds();
    // console.log(this)
    this._tick();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
    
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    
    console.log(this.h + ":" + this.m + ":" + this.s);
  }
  
  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    // console.log(this)
    if (this.s === 59){
      this.s = 0;
      this.m++;
    } 
    if (this.m === 59){
      this.m = 0;
      this.h++;
    }
    if (this.h === 23){
      this.h = 0;
    }

    this.s++;
    this.printTime(this.h, this.m, this.s);

  }
}

// const clock = new Clock();


const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

function addNumber(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    reader.close();
    return completionCallback(sum);
  }

  let userNumbers;
  if (numsLeft > 0){
    reader.question("Please enter some numbers\n", (res) => {
      userNumbers = parseInt(res);
      numsLeft--;
      // debugger 
      sum = completionCallback(sum, userNumbers);
      sum + addNumber(sum, numsLeft, completionCallback);
      console.log(sum);
    })
  }
}

function completionCallback(sum, num) {
  sum += num;
  return sum;
}

addNumber(1, 2, completionCallback);