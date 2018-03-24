//
//  DetailedAddress.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import MapKit
import Contacts


import Foundation
class DetailedAddress: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
    //    func mapItem() -> MKMapItem {
    //        let addresssDictionary = [String(CNPostalAddressStreetKey) : title!]
    //        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addresssDictionary)
    //        let mapItem =  MKMapItem(placemark: placemark)
    //        mapItem.name = "\(title!)"
    //        return mapItem
    //    }
}
