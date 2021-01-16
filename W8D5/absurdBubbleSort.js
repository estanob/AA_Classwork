const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})


function absurdBubbleSort() {
  
}

function outerBubbleSortLoop(madeAnySwaps) {
  // Begin an inner loop if you made any swaps. Otherwise, call
  // `sortCompletionCallback`.
}
// sorted = true 
// 
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  
  if (i === arr.length - 1) {
    // madeAnySwaps = true;    ?????
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], callback) // [1,2]
    innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
  }
}

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}?\n`, (res) => {
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

// askIfGreaterThan(2, 1, callback);
innerBubbleSortLoop([2, 1], 0, false, outerBubbleSortLoop);
