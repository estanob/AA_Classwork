Array.prototype.myEach = function(cb){
    for (let i = 0; i < this.length; i++){
        cb(this[i]);
    }
    return this;
}

// let addTwo = function(num) {
//     console.log(num + 2);
// }

// const arr = [4, 5, 6] // => [6, 7, 8]
// arr.myEach(ele) => {console.log(ele + 2)}
// console.log(arr.myEach(addTwo))


Array.prototype.myMap = function(cb){
    const mapped = [];
    this.myEach(ele => mapped.push(cb(ele)))
    return mapped;
}
 
//const arr = [4, 5, 6]

// let addTwo = function (num) {
//     console.log(num + 2);
// }

// console.log(arr.myMap(addTwo));
//console.log(arr.myMap(ele => ele + 2));


Array.prototype.myReduce = function(cb,) {

}