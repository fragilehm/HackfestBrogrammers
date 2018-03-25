//
//  NeedMapViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
class NeedMapViewController: UIViewController {
    var categoryIds = [Int]()
    var locationManager = CLLocationManager()
    var need = ""
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var hideButton: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var detailAddressLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailPhoneLabel: UILabel!
    @IBOutlet weak var detailCategoriesLabel: UILabel!
    @IBOutlet weak var detailRecommendedLabel: UILabel!
    var markers = [Pin]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        setupViews()
        initGoogleMaps()
        ServerManager.shared.getNeedMarkers(need: need,category_id: categoryIds[0], setMarkersData, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Нуждаюсь в помощи"
    }
    @IBAction func xPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.backView.isHidden = true

        }, completion: nil)
    }
    @IBAction func hidePressed(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.backView.isHidden = true
        }, completion: nil)
    }
    func setMarkersData(markers: [Pin]){
        print(markers)
        self.markers = markers
        var markerList = Array<GMSMarker>()
        
        for (index, marker) in markers.enumerated() {
            markerList.append(createMarker(address: marker, index: index))
        }
        fitAllMarkers(markerList: markerList)
    }
    private func initGoogleMaps() {
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        let camera = GMSCameraPosition.camera(withLatitude: 42.877490, longitude: 74.598800, zoom: 10.0)
        self.myMapView.camera = camera
        myMapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 55, right: 0)
        myMapView.settings.myLocationButton = true
        //Location Manager code to fetch current location
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
        self.view.bringSubview(toFront: backView)
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
        let position = CLLocationCoordinate2DMake((address.latitude as! NSString).doubleValue, (address.longitude as! NSString).doubleValue)
        let marker = GMSMarker(position: position)
        marker.title = "\(index)"
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
        CATransaction.setValue(1, forKey: kCATransactionAnimationDuration)
        myMapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 70.0))
        CATransaction.commit()
    }
}
extension NeedMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print(marker.title)
        detailAddressLabel.text = self.markers[Int(marker.title!)!].address
        detailPhoneLabel.text = self.markers[Int(marker.title!)!].user_phone
        detailDescriptionLabel.text = self.markers[Int(marker.title!)!].description
        var cat = ""
        for category in self.markers[Int(marker.title!)!].categories {
            cat.append(category.title)
        }
        detailCategoriesLabel.text = cat
        detailRecommendedLabel.text = self.markers[Int(marker.title!)!].user_connectedTo
        self.backView.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.detailView.alpha = 1
        }) { (animated) in
            self.hideButton.isHidden = false
        }
        return true
    }
    
}
extension NeedMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
//        let camera = GMSCameraPosition.cameraWithLatitude((location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
//
//        self.mapView?.animateToCameraPosition(camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
    }
}

