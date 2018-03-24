//
//  LanguageViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {
    let pickerData = ["Русский", "Кыргызча", "English"]
    @IBOutlet weak var languagePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Выбор языка"
    }
}
extension LanguageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    
}
