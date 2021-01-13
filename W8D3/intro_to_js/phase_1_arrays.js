Array.prototype.uniq = function(){
  let uniq_arr = [];
  this.forEach(function(ele){
    if (!uniq_arr.includes(ele)){
      uniq_arr.push(ele);
    }
  })
  return uniq_arr;
}

// console.log([1, 2, 2, 3, 3, 3].uniq())



Array.prototype.twoSum = function(){
  let pairs = [];
  for (let i = 0; i < this.length - 1; i++){
    for (let j = i + 1; j < this.length; j++){
      if (this[i] + this[j] === 0) {
        pairs.push([i, j])
      }
    }
  }
  return pairs;
}

//console.log([-1, 1, -2, 2, 3, 4].twoSum())

Array.prototype.transpose = function(){
  let tr = [];

  for (let i = 0; i < this.length; i++) {
    tr.push([])
  }

  for (let i = 0; i < this.length; i++){
    for(let j = 0; j < this.length; j++){
      tr[j].push(this[i][j])
    }
  }

  return tr
  
}

  //console.log([[1,2,3],[4,5,6],[7,8,9]].transpose())