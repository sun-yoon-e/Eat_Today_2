import UIKit
import MapKit

class Japan_MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    var posts = NSMutableArray()
    var foods : [Food] = []
    
    func loadInitialData() {
        for post in posts {
            let BIZPLC_NM = (post as AnyObject).value(forKey: "BIZPLC_NM") as! NSString as String
            let REFINE_ROADNM_ADDR = (post as AnyObject).value(forKey: "REFINE_ROADNM_ADDR") as! NSString as String
            let REFINE_WGS84_LOGT = (post as AnyObject).value(forKey: "REFINE_WGS84_LOGT") as! NSString as String
            let REFINE_WGS84_LAT = (post as AnyObject).value(forKey: "REFINE_WGS84_LAT") as! NSString as String
            let lat = (REFINE_WGS84_LAT as NSString).doubleValue
            let lon = (REFINE_WGS84_LOGT as NSString).doubleValue
            let food = Food(title: BIZPLC_NM, road_addr: REFINE_ROADNM_ADDR, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            foods.append(food)
        }
    }
    
    let regionRadius: CLLocationDistance = 5000
    
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
        
        let initialLocation = CLLocation(latitude: 37.275060, longitude: 127.009233)    // 초기 위치 : 경기도청
        
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        loadInitialData()
        mapView.addAnnotations(foods)
    }
}
