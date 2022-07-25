console.log("Ajax in JAvascript and Rails");

let fetchBtn = document.getElementById("fetchBtn");
fetchBtn.addEventListener('click', buttonClickHandler);

function buttonClickHandler(){
  console.log("You hhave Clicket the button");

  //INstantiate an XHR object
  const xhr = new XMLHttpRequest();

  // open the object
  //xhr.open('GET', 'https://jsonplaceholder.typicode.com/todos/1', true);
  //using this for the post request
  xhr.open('POST', 'hhttps://dummy.restapiexample.com/api/v1/create', true);
  xhr.getResponseHeader('Content-type', 'application/json');


  // what to do on progress
  xhr.onprogress = function() {
    console.log('on Progress');
  }

  xhr.onreadystatechange = function(){
    console.log("ready state is ", xhr.readyState);
  }
  
  // what to do when respoonse is ready
  xhr.onload = function(){
    if(this.status === 200 ) {
    console.log(this.responseText);
    }
    else{
      console.error("Some Error Occured");
    }
  }
  params = `{"name":"test1","salary":"1123","age":"213"}`;

  xhr.send(params);

  console.log("We are ddone");

}


let popBtn = document.getElementById("popBtn");
popBtn.addEventListener('click',popHandler);
function popHandler(){
  console.log("You hhave Clicket  pop the button");

  //INstantiate an XHR object
  const xhr = new XMLHttpRequest();

  // open the object
  //xhr.open('GET', 'https://jsonplaceholder.typicode.com/todos/1', true);
  //using this for the post request
  xhr.open('GET', 'https://dummy.restapiexample.com/api/v1/employees', true);


  // what to do when respoonse is ready
  xhr.onload = function(){
    if(this.status === 200 ) {
    let obj = JSON.parse(this.responseText);
    console.log(obj);
    let list = document.getElementById('list');
    str = "";
    for (key in obj){
      str+= `<li>${obj[key].employee_name}</li>`;

    }
    list.innerHTML = str ;
    }
    else{
      console.error("Some Error Occured");
    }
  }

  xhr.send();

  console.log("We are ddone fetching the data");

}