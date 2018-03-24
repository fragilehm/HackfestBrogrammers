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
    var sendBack: SendBack?
    
    var callback : ((Array<Address>) -> Void)?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sendBack?.getData(addresses: addresses)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initGoogleMaps()
    }
    
    private func initGoogleMaps() {
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        if addresses.count == 0 {
            let camera = GMSCameraPosition.camera(withLatitude: 42.877490, longitude: 74.598800, zoom: 10.0)
            self.myMapView.camera = camera
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

