//
//  Food.swift
//  Eat_Today
//

import Foundation
import MapKit
import Contacts

class Food: NSObject, MKAnnotation {
    let BIZPLC_NM: String?
    let REFINE_ROADNM_ADDR: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.BIZPLC_NM = title
        self.REFINE_ROADNM_ADDR = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return REFINE_ROADNM_ADDR
    }
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = BIZPLC_NM
        return mapItem
    }
}
