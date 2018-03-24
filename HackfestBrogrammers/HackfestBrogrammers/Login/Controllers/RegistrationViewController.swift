//
//  RegistrationViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var addresses = Array<Address>()

    @IBOutlet private weak var repeatPasswordTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var descriptionTV: UITextView!
    @IBOutlet private weak var phoneTF: UITextField!
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var surnameTF: UITextField!
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func onClickAddresses(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AddressesViewController") as! AddressesViewController
        vc.setAddresses(addresses: addresses)
        self.navigationController?.show(vc, sender: self)
    }
    
    @IBAction private func onClickRegister(_ sender: UIButton) {
        
    }
    
}
