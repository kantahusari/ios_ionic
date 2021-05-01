import { Component } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import {HttpClient} from '@angular/common/http';
import { Platform } from '@ionic/angular';
import  'rxjs/add/operator/map';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {
  place:string ="";
  type:string = "";
  icon: string ="";
  temperature: string ="";
  
  constructor( public httpClient: HttpClient, public geolocation:Geolocation, public platform: Platform) {
    this.platform.ready().then(()=>{
      this.GetCurrentLocation();
    })
  }
  GetCurrentLocation(){
    this.geolocation.getCurrentPosition().then((position)=>{
      var latitude = position.coords.latitude;
      var longitude = position.coords.longitude;
      this.GetCurrentTemperature(latitude,longitude);
    })
  }
  GetCurrentTemperature( latitude, longitude){
    var url ="https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&appid=930788bb590c81462d522852baa4f789";
    this.httpClient.get(url).subscribe((temperaturedata) =>{
      var obj = <any> temperaturedata;
      this.place = obj.name;
      this.type = obj.weather[0].main;
      this.icon ="https://api.openweathermap.org/img/w/"+obj.weather[0].icon+".png";
      this.temperature = (parseFloat(obj.main.temp)-273.15).toFixed(2).toString()+"°C";
      
    })
   
  }
   

 

}
