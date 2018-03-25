//
//  CategoriesViewController.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

protocol MarkerCategoriesViewControllerDelegate: class {
    func getData(categories: [Category])
}

class MarkerCategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var categories = [Category]()
    var checked: [Bool]?
    var delegate: MarkerCategoriesViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        configureTableView()
        ServerManager.shared.getCategories(setCategories, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    
    func setCategories(categories: [Category]){
        self.categories = categories
        if checked == nil {
            checked = [Bool].init(repeating:  false, count: categories.count)
        }
        self.tableView.reloadData()
    }
    
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        var selectedCategories = [Category]()
        for (i, val) in (checked?.enumerated())!{
            if val{
                selectedCategories.append(categories[i])
            }
        }
        delegate?.getData(categories: selectedCategories)
    }
}
extension MarkerCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        let url = URL(string: categories[indexPath.row].image_url!)
        cell.categoriesImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder-image"), options: nil, progressBlock: nil, completionHandler: nil)
        cell.categoriesName.text = categories[indexPath.row].title
        cell.descriptionLabel.text = categories[indexPath.row].description
        if checked![indexPath.row] == true {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if !checked![indexPath.row] {
                cell.accessoryType = .checkmark
                checked![indexPath.row] = true
            }
            else
            {
                cell.accessoryType = .none
                checked![indexPath.row] = false
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

