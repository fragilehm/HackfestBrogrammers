//
//  MainViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addProfileNavigationItem()
        // Do any additional setup after loading the view.
    }
    func addProfileNavigationItem() {
        let profileButton = UIButton.init(type: .system)
        profileButton.setImage(#imageLiteral(resourceName: "avatar").withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(profilePressed(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
    }
    @objc func profilePressed(_ button: UIButton) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.show(settingsVC, sender: self)
        //self.navigationController?.popViewController(animated: true)
    }
    @IBAction func needPressed(_ sender: Any) {
    }
    @IBAction func wantPressed(_ sender: Any) {
    }
    @IBAction func addPressed(_ sender: Any) {
    }
    

}
