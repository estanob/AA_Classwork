Array.prototype.myEach = function(cb){
    this.forEach(function(ele){
        cb(ele)
    })
    
    return this 

    
}
function addTwo(num){
    return num + 2
}


console.log([4,5,6].myEach(addTwo(num)))