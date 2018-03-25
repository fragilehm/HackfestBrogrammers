//
//  MainViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var needLabel: UILabel! {
        didSet {
            needLabel.isUserInteractionEnabled = true
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(needPressed))
            needLabel.addGestureRecognizer(gestureRecognizer)
        }
    }
    @IBOutlet weak var wantLabel: UILabel! {
        didSet {
            wantLabel.isUserInteractionEnabled = true
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(wantPressed))
            wantLabel.addGestureRecognizer(gestureRecognizer)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addProfileNavigationItem()
        addAddNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Главная"
    }
    @objc func needPressed(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let categoriesVC = storyboard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        categoriesVC.isNeed = true
        self.navigationController?.show(categoriesVC, sender: self)
        print("need")
    }
    @objc func wantPressed(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let categoriesVC = storyboard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        categoriesVC.isNeed = false
        self.navigationController?.show(categoriesVC, sender: self)
        print("want")
        
    }
    func addProfileNavigationItem() {
        let profileButton = UIButton.init(type: .system)
        profileButton.setImage(#imageLiteral(resourceName: "avatar").withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(profilePressed(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
    }
    func addAddNavigationItem() {
        let profileButton = UIButton.init(type: .system)
        profileButton.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(addPressed(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .done, target: self, action:  #selector(addPressed(_:)))
    }
    @objc func addPressed(_ button: UIButton) {
        let storyboard = UIStoryboard.init(name: "AddMarker", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: "AddMarkerViewController")
        self.navigationController?.show(settingsVC, sender: self)
        //self.navigationController?.popViewController(animated: true)
    }
    @objc func profilePressed(_ button: UIButton) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.show(settingsVC, sender: self)
        //self.navigationController?.popViewController(animated: true)
    }
    

}
