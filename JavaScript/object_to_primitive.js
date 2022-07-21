console.log("hello");
let user = {
  name: "John",
  money: 1000,
  toString() {
    return `{name: "${this.name}"}`;
  },
  valueOf() {
    return this.money;
  }
};

console.log(user); 
console.log(+user); 
console.log(user + 500);

// hello
// {
//   name: 'John',
//   money: 1000,
//   toString: [Function: toString],
//   valueOf: [Function: valueOf]
// }
// 1000
// 1500