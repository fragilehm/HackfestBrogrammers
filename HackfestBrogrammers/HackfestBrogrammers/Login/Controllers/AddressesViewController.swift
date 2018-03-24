//
//  AddressesViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import MapKit

class AddressesViewController: UIViewController {
    
    private var addresses = Array<Address>()
    @IBOutlet private weak var myMap: MKMapView!
    var gestureRecognizer = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
    }
    
    private func initMap(){
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mapTapped))
        myMap.addGestureRecognizer(gestureRecognizer)
        myMap.delegate = self
        myMap.mapType = MKMapType.standard
        if (addresses.count == 0){
            let eyeCoordinate = CLLocationCoordinate2D(latitude: 42.876772, longitude: 74.603582)
            let mapCamera = MKMapCamera(lookingAtCenter: eyeCoordinate, fromEyeCoordinate: eyeCoordinate, eyeAltitude: 1000.0)
            myMap.setCamera(mapCamera, animated: true)
        } else {
            for x in addresses {
                let address = DetailedAddress(title: x.title, coordinate: CLLocationCoordinate2D(latitude: x.latitude, longitude: x.longitude))
                myMap.addAnnotation(address)
            }
            //            var mapRect = MKMapRect()
            //            for annotation in myMap.annotations {
            //                let annotationPoint = MKMapPointForCoordinate(annotation.coordinate)
            //                let pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1)
            //                mapRect = MKMapRectUnion(mapRect, pointRect)
            //            }
            //            myMap.setVisibleMapRect(mapRect, animated: true)
        }
    }
    
    func setAddresses(addresses: Array<Address>){
        self.addresses = addresses
    }
}


extension AddressesViewController: MKMapViewDelegate {
    
    @objc public func mapTapped(sender: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: myMap)
        let coordinate = myMap.convert(location, toCoordinateFrom: myMap)
        
        let alertController = UIAlertController(title: "Please type in title", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField(configurationHandler: { (titleTF) in
        })
        
        alertController.view.tintColor = .black
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { [weak self] _ in
            let address = DetailedAddress(title: alertController.textFields![0].text!, coordinate: coordinate)
            self?.myMap.addAnnotation(address)
            self?.addresses.append(Address(title: address.title!, latitude: address.coordinate.latitude, longitude: address.coordinate.longitude))
        })
        alertController.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alertController, animated: true, completion:{})
    }
    
    //    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //        if let annotation = annotation as? DetailedAddress {
    //            let annotation_id = "pin"
    //            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation_id)
    //            annotationView.image = UIImage(named: "dog")
    //            return annotationView
    //        }
    //        return nil
    //    }
}
