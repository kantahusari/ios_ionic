import { Component } from '@angular/core';
import { Geolocation, Geoposition } from '@ionic-native/geolocation/ngx';
import { Plugins } from '@capacitor/core';
const {Storage} = Plugins;

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})

export class Tab2Page {
  //setting up the variables to use
  coordinates: [number, number] = [0,0]
  visits: Location[]
  location_Index: number = 0

  constructor(private geolocation: Geolocation) {
    this.geolocation.getCurrentPosition({
      timeout: 1000, enableHighAccuracy: true, maximumAge: 2500
    }).then((resp) => {
      this.coordinates[0] = resp.coords.latitude;
      this.coordinates[1] = resp.coords.longitude;
      this.location_Index++
      this.store(this.coordinates[0], this.coordinates[1])
    })
  }

  store(latitude: number, longitude: number){
    let timeStamp = new Date();
    let currentCords = [this.location_Index ,latitude, longitude, timeStamp.getMonth() + 1, timeStamp.getDate(), timeStamp.getFullYear()]
    this.setCoords(currentCords[0], currentCords);
  }

  async setCoords(locationIndex: any, locationValue: any){
    await Storage.set({
      key: JSON.stringify(locationIndex),
      value: JSON.stringify(locationValue)
    })
    this.previousCoords()
  }

  async previousCoords() {
    this.visits = [];
    let {keys} = await Storage.keys();
    keys.forEach(this.fetchCords, this);
  }

  async fetchCords(locationIndex: any) {
    let allvisits = await Storage.get({key: locationIndex});
    let currentCords = JSON.parse(allvisits.value);
    this.visits.push(currentCords);
  }

}

