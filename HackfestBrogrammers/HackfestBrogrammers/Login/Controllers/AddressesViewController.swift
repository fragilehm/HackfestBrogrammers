//
//  AddressesViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import MapKit

class AddressesViewController: UIViewController, MKMapViewDelegate {
    
    private var addresses = Array<Address>()

    @IBOutlet private weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMap()
    }
    
    private func initMap(){
        myMap.delegate = self
        myMap.mapType = MKMapType.standard
        if (addresses.count == 0){
            let eyeCoordinate = CLLocationCoordinate2D(latitude: 42.876772, longitude: 74.603582)
            let mapCamera = MKMapCamera(lookingAtCenter: eyeCoordinate, fromEyeCoordinate: eyeCoordinate, eyeAltitude: 1000.0)
            myMap.setCamera(mapCamera, animated: true)
        } else {
            
        }
        
    }
    

}
