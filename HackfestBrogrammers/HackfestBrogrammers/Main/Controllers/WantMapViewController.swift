//
//  WantMapViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
class WantMapViewController: UIViewController {
    var categoryIds = [Int]()
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        setupViews()
        initGoogleMaps()
        ServerManager.shared.getWantMarkers(category_id: categoryIds[0], setMarkersData, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Хочу помочь"
    }
    func setMarkersData(markers: [Pin]){
        print(markers)
        var markerList = Array<GMSMarker>()
        
        for (index, marker) in markers.enumerated() {
            markerList.append(createMarker(address: marker, index: index))
        }
        fitAllMarkers(markerList: markerList)
    }
    private func initGoogleMaps() {
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        myMapView.settings.myLocationButton = true

        let camera = GMSCameraPosition.camera(withLatitude: 42.877490, longitude: 74.598800, zoom: 10.0)
        self.myMapView.camera = camera
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        //if addresses.count == 0 {
        
        //} else {
        //  setMarkers(addresses: addresses)
        //}
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
    
    //    private func setMarkers(addresses: Array<Address>){
    //        myMapView.clear()
    //        var markerList = Array<GMSMarker>()
    //        for  in addresses {
    //            markerList.append(createMarker(address: x))
    //        }
    //        fitAllMarkers(markerList: markerList)
    //    }
    //
    private func createMarker(address: Pin, index: Int) -> GMSMarker {
        var position = CLLocationCoordinate2DMake(42.890496, 74.585858)
        
        if index == 0 {
            position = CLLocationCoordinate2DMake(42.884931, 74.600278)
        }
        let marker = GMSMarker(position: position)
        marker.title = address.description
        marker.icon = UIImage(named: "\(address.status)")
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
    
    
}
extension WantMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print(marker.title)
        
        return true
    }
    
}
extension WantMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        //        let camera = GMSCameraPosition.cameraWithLatitude((location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        //
        //        self.mapView?.animateToCameraPosition(camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
    }
}


