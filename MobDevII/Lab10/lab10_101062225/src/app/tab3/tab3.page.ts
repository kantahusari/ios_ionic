import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss']
})
export class Tab3Page implements OnInit {
// var url ="https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&appid=930788bb590c81462d522852baa4f789";
place:string ="";
type:string = "";
icon: string ="";
temperature: string ="";
  constructor( private httpClient: HttpClient ) {}
  public weatherForm = new FormGroup({
    city: new FormControl('', Validators.required),
  });
  public weather;
  public city;
  
  search(formData: FormData){
    console.log(formData);
    this.city("city", formData["city"]);
    
    this.getWeatherFromApi(formData["city"]).subscribe( weather => {
      this.weather = weather;
      console.log(weather);
    })

  }
  
  getWeather(){
    this.city.then( city => {
      if(city === null){
        this.getWeatherFromApi("paris").subscribe( weather => {
          var obj = <any> weather;
          this.place = obj.name;
          this.type = obj.weather[0].main;
          this.icon ="https://api.openweathermap.org/img/w/"+obj.weather[0].icon+".png";
          this.temperature = (parseFloat(obj.main.temp)-273.15).toFixed(2).toString()+"°C";
              
          console.log(weather);
        })
      }else{
        this.getWeatherFromApi(city).subscribe( weather => {
          this.weather = weather;
          console.log(weather);
        });
      }

    }).catch(err =>{
      console.log(err);
    })
 
}

  getWeatherFromApi(city: string){
    return this.httpClient.get(`api.openweathermap.org/data/2.5/weather?id=${city}&appid=930788bb590c81462d522852baa4f789`);
  }
  ngOnInit() {
   this.getWeather();
  }

}
