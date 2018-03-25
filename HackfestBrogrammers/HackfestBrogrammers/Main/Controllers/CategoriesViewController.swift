//
//  CategoriesViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit
import Kingfisher
class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var categories = [Category]()
    var isNeed = false
    var checked = [Bool]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        configureTableView()
        addNextNavigationItem()
        ServerManager.shared.getCategories(setCategories, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Категории"
    }
    func setCategories(categories: [Category]){
        self.categories = categories
        checked = [Bool].init(repeating:  false, count: categories.count)
        self.tableView.reloadData()
    }
    func addNextNavigationItem() {
        let nextButton = UIButton.init(type: .system)
        nextButton.setTitle("Далее", for: .normal)
        nextButton.setTitleColor(UIColor.init(netHex: Colors.PURPLE), for: .normal)
        nextButton.addTarget(self, action: #selector(nextPressed(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextButton)
    }
    @objc func nextPressed(_ button: UIButton) {
        var selectedIds = [Int]()
        for (i, val) in checked.enumerated() {
            if val {
                selectedIds.append(categories[i].id)
            }
        }
        if selectedIds.count == 0 {
            let alert = UIAlertController(title: "Внимание", message: "выберите пожалуйста минимум одну категорию", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isNeed {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let needVC = storyboard.instantiateViewController(withIdentifier: "NeedMapViewController") as! NeedMapViewController
                needVC.categoryIds = selectedIds
                self.navigationController?.show(needVC, sender: self)
            }
            else
            {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let needVC = storyboard.instantiateViewController(withIdentifier: "WantMapViewController") as! WantMapViewController
                needVC.categoryIds = selectedIds
                self.navigationController?.show(needVC, sender: self)
            }
            
        }
        
        //self.navigationController?.popViewController(animated: true)
    }
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
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
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if !checked[indexPath.row] {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
            }
            else
            {
                cell.accessoryType = .none
                checked[indexPath.row] = false
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
