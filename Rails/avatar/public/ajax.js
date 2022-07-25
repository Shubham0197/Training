console.log("Ajax in JAvascript and Rails");

let fetchBtn = document.getElementById("fetchBtn");
fetchBtn.addEventListener('click', buttonClickHandler);

function buttonClickHandler(){
  console.log("You hhave Clicket the button");

  //INstantiate an XHR object
  const xhr = new XMLHttpRequest();

  // open the object
  xhr.open('GET', 'data.txt', true);

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


  xhr.send();

}