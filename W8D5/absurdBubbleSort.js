const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})


function absurdBubbleSort() {
  
}

function askIfGreaterThan(el1, el2, callback) {
  reader.question("Is the left num greater than the right num?\n", (res) => {
    let input = res;
    if (input === "yes"){
      console.log(callback(el1, el2));
    }
    reader.close();
  })
}

function callback(el1, el2) {
  if (el1 > el2) {
    return [el1, el2] = [el2, el1];
  }
}

askIfGreaterThan(2, 1, callback);
