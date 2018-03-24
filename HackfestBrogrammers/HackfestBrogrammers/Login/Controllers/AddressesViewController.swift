//
//  AddressesViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class AddressesViewController: UIViewController {
    
    //MARK: datafields
    private var addresses = Array<Address>()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        initMap()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Добавить адрес"
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
            setMarkers(addresses: addresses)
        }
    }
    
    private func setMarkers(addresses: Array<Address>){
        myMapView.clear()
        var markerList = Array<GMSMarker>()
        for x in addresses {
            markerList.append(createMarker(address: x))
        }
        fitAllMarkers(markerList: markerList)
    }
    
    private func createMarker(address: Address) -> GMSMarker {
        let position = CLLocationCoordinate2DMake(address.latitude, address.longitude)
        let marker = GMSMarker(position: position)
        marker.title = address.title
        marker.map = myMapView
        return marker
    }
    
    private func fitAllMarkers( markerList: Array<GMSMarker>) {
        var bounds = GMSCoordinateBounds()
        
        for marker in markerList {
            bounds = bounds.includingCoordinate(marker.position)
        }
        
        CATransaction.begin()
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        myMapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 70.0))
        CATransaction.commit()
    }
    
    //MARK: Public methods
    func setAddresses(addresses: Array<Address>){
        self.addresses = addresses
    }
    
    //MARK: Views
    private let myMapView: GMSMapView = {
        let v = GMSMapView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    private func setupViews() {
        self.view.addSubview(myMapView)
        myMapView.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        myMapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        myMapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        myMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive=true
    }
}


extension AddressesViewController: GMSMapViewDelegate {
    
//    public func mapTapped(sender: UITapGestureRecognizer) {
//        let location = gestureRecognizer.location(in: myMapView)
//        let coordinate = myMapView.convert(location, toCoordinateFrom: myMapView)
//
//        let alertController = UIAlertController(title: "Please type in title", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//
//        alertController.addTextField(configurationHandler: { (titleTF) in
//        })
//
//        alertController.view.tintColor = .black
//        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { [weak self] _ in
//            let address = DetailedAddress(title: alertController.textFields![0].text!, coordinate: coordinate)
//            self?.myMapView.addAnnotation(address)
//            self?.addresses.append(Address(title: address.title!, latitude: address.coordinate.latitude, longitude: address.coordinate.longitude))
//        })
//        alertController.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
//        self.present(alertController, animated: true, completion:{})
//    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let alertController = UIAlertController(title: "Please type in title", message: nil, preferredStyle: UIAlertControllerStyle.alert)

        alertController.addTextField(configurationHandler: { (titleTF) in
        })

        alertController.view.tintColor = .black
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { [weak self] _ in
            let address = Address(title: alertController.textFields![0].text!, latitude: coordinate.latitude, longitude: coordinate.longitude)
            self?.createMarker(address: address)
            self?.addresses.append(address)
        })
        alertController.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alertController, animated: true, completion:{})
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let alertController = UIAlertController(title: "Do you want to delete the marker?", message: marker.title!, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.view.tintColor = .black
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { [weak self] _ in
            marker.map = nil
        })
        alertController.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alertController, animated: true, completion:{})
        
        return true
    }
    
}
