Array.prototype.bubbleSort = function(){
  let sorted = false;
  while (!sorted){
    sorted = true;
    for(let i = 0; i < this.length - 1; i++){
      if (this[i] > this[i + 1]){
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
}

//console.log([8, 3, 2, 0, 7].bubbleSort());

String.prototype.subStrings = function(){

  let subs = [];

  for (let start = 0; start <= this.length - 1; start++){
    for (let end = start + 1; end <= this.length; end++){
      subs.push(this.slice(start, end))
    }
  }
  return subs
}

console.log("hello".subStrings())


