import UIKit
import CoreMotion
import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager : CLLocationManager!
    var motionManager:CMMotionManager!
    var timer:Timer!

    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var Map: MKMapView!
    
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        motionManager = CMMotionManager()
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 1.0 / 60.0
            motionManager.startAccelerometerUpdates()
            self.timer = Timer(fire: Date(),
                               interval: (1.0 / 60.0) ,
                               repeats: true,
                               block: {(timer) in
                                if let data = self.motionManager.accelerometerData{
                                    self.x.text = String(data.acceleration.x)
                                    self.y.text = String(data.acceleration.y)
                                    self.z.text = String(data.acceleration.z)
                                }})
            RunLoop.current.add(self.timer, forMode: .default)
        }else{
            self.timer = Timer(fire: Date(),
                               interval: (20.0 / 60.0) ,
                               repeats: true,
                               block: {(timer) in
                                    self.x.text = String(arc4random())
                                    self.y.text = String(arc4random())
                                    self.z.text = String(arc4random())
                                })
            RunLoop.current.add(self.timer, forMode: .default)
            self.status.text = "Accelerometer is not Available"
        }
}
    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus){
        if status == .authorizedAlways{
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self){
                if CLLocationManager.isRangingAvailable(){
                    //do some stuff 
                }
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for l in locations{
            lat.text = String(l.coordinate.latitude)
            lon.text = String(l.coordinate.longitude)
            let coordinateRegion = MKCoordinateRegion(
                center:l.coordinate,
                latitudinalMeters: 100,
                longitudinalMeters: 100
            )
            Map.setRegion(coordinateRegion, animated: true)
            Map.addAnnotation(PointOfInterest(location: l.coordinate, title: "move"))

            
            //---------------

            
            //----------------
        }
    }
}
class PointOfInterest:NSObject, MKAnnotation{
    let coordinate: CLLocationCoordinate2D
    let title:String?
    
     init(location:CLLocationCoordinate2D,title:String) {
        self.coordinate = location
        self.title = title
    }
}
