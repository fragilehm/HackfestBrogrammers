//
//  AddMarkerViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class AddMarkerViewController: UIViewController, MarkerCategoriesViewControllerDelegate {
    
    //MARK: Private Variables
    private var isMapFullScreen = false
    private var googleMarker: GMSMarker?
    private var categories = Array<Category>()
    
    @IBOutlet weak var needSC: UISegmentedControl!
    @IBOutlet weak var mapContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var mapDoneBtn: UIButton!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var descriptionTF: UITextView!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var phoneTF: CustomTextField!
    @IBOutlet weak var surnameTF: CustomTextField!
    @IBOutlet weak var nameTF: CustomTextField!
    @IBOutlet weak var mapContainer: UIView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarItems()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Marker"
        setupViews()
        initGoogleMaps()
    }
    
    private func initGoogleMaps() {
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        
        let camera = GMSCameraPosition.camera(withLatitude: 42.877490, longitude: 74.598800, zoom: 10.0)
        self.myMapView.camera = camera
    }
    
    //MARK: On Click actions
    @IBAction func onClickCategories(_ sender: UIButton) {
        let sb = UIStoryboard(name: "AddMarker", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MarkerCategoriesViewController") as! MarkerCategoriesViewController
        vc.delegate = self
        navigationController?.show(vc, sender: self)
    }
    @IBAction func onClickSubmit(_ sender: UIButton) {
        var isNeed = needSC.selectedSegmentIndex == 0
        var intCat = [Int]()
        for x in categories {
            intCat.append(x.id)
        }
        
        var phone = phoneTF.text
        let latitude = googleMarker?.position.latitude.description
        let longitude = googleMarker?.position.longitude.description
//        print(String(describing: latitude?.prefix(9)))
//        print(String(describing: latitude?.prefix(9)) as! NSString)
//        print(Double(String(describing: latitude?.prefix(9))) )
//        print((String(describing: latitude?.prefix(9)) as NSString).doubleValue)
        var marker = AddPin(categories: intCat, status: "1", description: descriptionTF.text, address: googleMarker?.title, latitude: (String(describing: latitude!.prefix(9)) as NSString).doubleValue, longitude: (String(describing: longitude!.prefix(9)) as NSString).doubleValue, isNeed: isNeed, user_id: 1, user_phone: phoneTF.text, user_email: emailTF.text, user_name: nameTF.text, user_surname: surnameTF.text, user_description: nil, user_image_url: nil, user_connectedTo: nil)
       // var dic = marker.toDictionary()
        ServerManager.shared.addMarker(marker: marker, onSuccess, error: showErrorAlert)
    }
    
    @IBAction func onClickMapDone(_ sender: UIButton) {
        isMapFullScreen = false
        changeMapHeight(height: 150)
        mapDoneBtn.isHidden = true
    }
    
    func onSuccess(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Views
    private let myMapView: GMSMapView = {
        let v = GMSMapView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    private func setupViews() {
        self.mapContainer.addSubview(myMapView)
        myMapView.topAnchor.constraint(equalTo: mapContainer.topAnchor).isActive=true
        myMapView.leftAnchor.constraint(equalTo: mapContainer.leftAnchor).isActive=true
        myMapView.rightAnchor.constraint(equalTo: mapContainer.rightAnchor).isActive=true
        myMapView.bottomAnchor.constraint(equalTo: mapContainer.bottomAnchor).isActive=true
        self.view.addSubview(mapDoneBtn)
    }
    
    //MARK: Other methods
    private func changeMapHeight(height: CGFloat){
        self.view.layoutIfNeeded()
        self.mapContainerHeight.constant = height
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func getData(categories: [Category]) {
        self.categories = categories
        var str = "Categories: "
        for x in categories {
            str += "#" + x.title + " "
        }
        categoriesLabel.text = str
        categoriesLabel.isHidden = false
    }
   
    
}

extension AddMarkerViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        if isMapFullScreen {
            if googleMarker != nil {
                self.googleMarker?.map = nil
            }
            setMarker(coordinate: coordinate)
        } else {
            mapDoneBtn.isHidden = false
            changeMapHeight(height: self.view.bounds.height)
            isMapFullScreen = true
        }
    }
    
    private func setMarker(coordinate: CLLocationCoordinate2D){
        let alertController = UIAlertController(title: "Введите название", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField(configurationHandler: { (titleTF) in
        })
        
        alertController.view.tintColor = .black
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { [weak self] _ in
            self?.googleMarker = GMSMarker(position: coordinate)
            self?.googleMarker?.title = alertController.textFields![0].text!
            self?.googleMarker?.map = self?.myMapView
        })
        alertController.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alertController, animated: true, completion:{})
    }
}
