import Foundation
import MapKit
import Contacts

class Food: NSObject, MKAnnotation {
    let title: String?
    let road_addr: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, road_addr: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.road_addr = road_addr
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return road_addr
    }
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
