//
//  AddingStoryViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import UITextView_Placeholder
class AddingStoryViewController: UIViewController {

    @IBOutlet weak var storyTextView: UITextView! {
        didSet {
            storyTextView.layer.borderWidth = 0.7
            storyTextView.layer.borderColor = UIColor.init(netHex: 0xBDBDBD).cgColor
            storyTextView.layer.cornerRadius = 5
            storyTextView.placeholder = "история"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Добывить историю"
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
    }
    
}
