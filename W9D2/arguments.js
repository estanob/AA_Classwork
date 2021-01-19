function sum() {
  let sum = 0
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

function sum2(...nums) {
  let sum = 0
  for (let i = 0; i < nums.length; i++) {
    sum += nums[i];
  }
  return sum;
}

Function.prototype.myBind = function(ctx) {
  return () => {
    return this.apply(ctx);
  }
};