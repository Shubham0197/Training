  let schedule_from = document.getElementById('schedule_from');
      let dest = document.getElementById('dest');
      let len = schedule_from.length;

      //schedule_from.addEventListener("change", show());
      $('#schedule_from').change(function(){
        dest.style.display = "block";
        schedule_destination = document.getElementById('schedule_destination');
        schedule_destination.innerHTML = "";
        let i = 0;
        let city_from = schedule_from.options[schedule_from.selectedIndex].text;
        while(i < len ){
          let city = schedule_from.options.item(i).text;
          console.log(city,i);
          console.log( city_from != city)
          if (city_from != city ) {
            let option = document.createElement("option");
            option.value = option.text = city ;
            schedule_destination.appendChild(option);
          }
          i++;
        }
        schedule_destination.value = "SELECT";
      });
