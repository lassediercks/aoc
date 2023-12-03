const fs = require("fs");

const input = fs.readFileSync("./lib/dayone/input");
const inputArray = input.toString().split("\n");

const doubleArray = inputArray.map((x) => [...x]);
const toNumbers = doubleArray.map((x) => x.map((y) => parseInt(y)));
const noNans = toNumbers.map((x) => x.filter((y) => !isNaN(y)));
const sumChilds = noNans.map((y) => {
  if (y.length > 1) {
    return y[0] + y.reverse()[0];
  } else {
    return y[0];
  }
});
const total = sumChilds.reduce((a, b) => a + b, 0);
console.log(total);
