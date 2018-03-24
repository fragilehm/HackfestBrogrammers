//
//  ProfileViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var emailField: UIStackView!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Профиль"
    }

}
