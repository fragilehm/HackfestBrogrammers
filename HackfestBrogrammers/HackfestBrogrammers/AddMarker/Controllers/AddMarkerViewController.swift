//
//  AddMarkerViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class AddMarkerViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarItems()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Marker"
        // Do any additional setup after loading the view.
    }

}
