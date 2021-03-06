import UIKit
import MapKit

class Famous_MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    var posts = NSMutableArray()
    var foods : [Food] = []
    var restNm = NSMutableString()
    var LOGT : Double = 0
    var LAT : Double = 0
    
    func loadInitialData() {
        for post in posts {
            let RESTRT_NM = (post as AnyObject).value(forKey: "RESTRT_NM") as! NSString as String
            let name1 = RESTRT_NM as NSString as String
            let name2 = restNm as NSString as String
            if(name1 == name2){
                let REFINE_ROADNM_ADDR = (post as AnyObject).value(forKey: "REFINE_ROADNM_ADDR") as! NSString as String
                let REFINE_WGS84_LOGT = (post as AnyObject).value(forKey: "REFINE_WGS84_LOGT") as! NSString as String
                let REFINE_WGS84_LAT = (post as AnyObject).value(forKey: "REFINE_WGS84_LAT") as! NSString as String
                let lat = (REFINE_WGS84_LAT as NSString).doubleValue
                let lon = (REFINE_WGS84_LOGT as NSString).doubleValue
                LAT = lat
                LOGT = lon
                let food = Food(title: RESTRT_NM, road_addr: REFINE_ROADNM_ADDR, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                foods.append(food)
            }
        }
    }
    
    let regionRadius: CLLocationDistance = 3000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Food
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Food else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()
        
        let initialLocation = CLLocation(latitude: LAT, longitude: LOGT)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        mapView.addAnnotations(foods)
        
        let bg:Color = color
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
}
